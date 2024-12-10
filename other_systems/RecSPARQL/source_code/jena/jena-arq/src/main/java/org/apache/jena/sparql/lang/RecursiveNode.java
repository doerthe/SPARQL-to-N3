package org.apache.jena.sparql.lang;

import java.util.*;

import org.apache.jena.graph.NodeFactory;
import org.apache.jena.graph.Triple;
import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.sparql.core.DatasetGraph;
import org.apache.jena.tdb.TDBFactory;
import arq.examples.ExecRecursive;

public class RecursiveNode {
	
	static public final String LINE_SEPARATOR = System.getProperty("line.separator") ; 
	public ArrayList<String> InnerQueries;
	public ArrayList<String[]> QueriesConstruct;
	public String Prefix;
	public String OuterQuery;
	public RecursiveNode()
	{
		InnerQueries = new ArrayList<String>();
		QueriesConstruct = new ArrayList<String[]>();
		Prefix = "";
		OuterQuery = "";
	}
	
	public void init(String queryString)
	{
		// Obtaining the prefix
		String pre_processed_query = queryString;
		while(pre_processed_query.contains("PREFIX"))
		{
			int index = pre_processed_query.indexOf('>');
			Prefix = Prefix + pre_processed_query.substring(0,index+1) + LINE_SEPARATOR;
			pre_processed_query = pre_processed_query.substring(index+1);
			pre_processed_query = pre_processed_query.trim();
		}
		pre_processed_query = pre_processed_query.trim();
		while(pre_processed_query.contains("WITH RECURSIVE"))
		{
			Stack<String> brackets = new Stack<String>();
			for (int i = 0; i< pre_processed_query.length(); i++)
			{
				if(pre_processed_query.charAt(i)=='{')
				{
					brackets.push("{");
				}
				else if(pre_processed_query.charAt(i)=='}')
				{
					brackets.pop();
					if(brackets.size()==0)
					{
						String s = pre_processed_query.substring(0,i+1);
						pre_processed_query = pre_processed_query.substring(i+1);
						pre_processed_query = pre_processed_query.trim();
						InnerQueries.add(s);
						break;
					}
				}
			}
		}
		OuterQuery = Prefix + LINE_SEPARATOR + pre_processed_query;
		
		String PrefixCopy = new String(Prefix);
		HashMap<String, String> prefixes = new HashMap<String, String>();
		PrefixCopy = PrefixCopy.trim();
		while(PrefixCopy.length()!=0)
		{
			int a = PrefixCopy.indexOf(" ");
			PrefixCopy = PrefixCopy.substring(a).trim();
			int b = PrefixCopy.indexOf(":");
			String daKey = PrefixCopy.substring(0,b).trim();
			PrefixCopy = PrefixCopy.substring(b+1).trim();
			int c = PrefixCopy.indexOf(">");
			String daValue = PrefixCopy.substring(1,c);
			PrefixCopy = PrefixCopy.substring(c+1).trim();
			prefixes.put(daKey, daValue);
		}
		
		
		for(String query : InnerQueries)
		{
			String[] auxArray = new String[2];
			String auxQuery = query;
			auxQuery = auxQuery.replace("WITH RECURSIVE", "");
			auxQuery = auxQuery.trim();
			int auxIndex = auxQuery.indexOf(" ");
			auxArray[0] = auxQuery.substring(0,auxIndex);
			
			if(auxArray.length>0)
			{
				if(!auxArray[0].contains("http://"))
				{
					String[] nextURI = auxArray[0].split(":");
					auxArray[0] = prefixes.get(nextURI[0])+nextURI[1];

				}
			}
			
			auxQuery = auxQuery.substring(auxIndex);
			auxQuery = auxQuery.replace("AS", "");
			auxQuery = auxQuery.trim();
			auxArray[1] = Prefix + LINE_SEPARATOR + auxQuery.substring(1,auxQuery.length()-1);
			QueriesConstruct.add(auxArray);
		}
		
	}
	
	public static void execRecQueryWithoutUnion(Dataset ds, Query recursiveQuery, String recursiveURI)
	{
		int countPrev = 0;
		int countNow = 0;
		Model workingGraph = ModelFactory.createDefaultModel();

		Model baseGraph;
		if(ds.containsNamedModel(recursiveURI))
		{
			baseGraph = ds.getNamedModel(recursiveURI);	
		}
		else
		{
			baseGraph = ModelFactory.createDefaultModel();
		}
		QueryExecution qexec;
		
		while(true)
		{
			qexec = QueryExecutionFactory.create(recursiveQuery, ds);
			Model aux = qexec.execConstruct();
			countNow = aux.getGraph().size();
			if(countNow == countPrev)
			{
				break;
			}
			else
			{
				workingGraph = aux;
				Model union = workingGraph.union(baseGraph);
				ds.addNamedModel(recursiveURI, union);
				countPrev = countNow;	
			}
		}
	}

	public static void execRecQueryOpt(Dataset ds, Query recursiveQuery, String recursiveURI)
	{
		Query[] rec_query = parseOpt(recursiveQuery);
		ds.removeNamedModel(recursiveURI);

		if(rec_query.length==1)
		{
			int countPrev = 0;
			int countNow = 0;
			Model workingGraph = ModelFactory.createDefaultModel();

			Model baseGraph;
			baseGraph = ModelFactory.createDefaultModel();

			QueryExecution qexec;			
			while(true)
			{
				qexec = QueryExecutionFactory.create(rec_query[0], ds);
				Model aux = qexec.execConstruct();
				countNow = aux.getGraph().size();
				if(countNow == countPrev)
				{
					break;
				}
				else
				{
					workingGraph = aux;
					Model union = workingGraph.union(baseGraph);
					ds.addNamedModel(recursiveURI, union);
					countPrev = countNow;

				}


			}
			qexec.close();
		}
		else
		{
			Model returnGraph = ModelFactory.createDefaultModel();
			QueryExecution qexecBase = QueryExecutionFactory.create(rec_query[0], ds);
			QueryExecution qexecRec;
			
			Model baseModel = qexecBase.execConstruct();
			ds.addNamedModel(recursiveURI, baseModel);
			
			returnGraph = returnGraph.union(baseModel);
			
			int countPrev = 0;
			int countNow = 0;
			while(true)
			{
				qexecRec = QueryExecutionFactory.create(rec_query[1], ds);
				Model recModel = qexecRec.execConstruct();
				returnGraph.add(recModel);				

				countNow = (int) returnGraph.size();
				if(countNow == countPrev)
				{
					break;
				}

				countPrev = countNow;
				
				ds.removeNamedModel(recursiveURI);
				ds.addNamedModel(recursiveURI, recModel);
			}
			ds.removeNamedModel(recursiveURI);
			ds.addNamedModel(recursiveURI, returnGraph);
			qexecBase.close();
		}

	}
	
	public static void execRecQueryOptMaterialized(Dataset ds, Query recursiveQuery, String recursiveURI)
	{
		Query[] recursive_query = parseOpt(recursiveQuery);
		DatasetGraph dsg = ds.asDatasetGraph();
		dsg.removeGraph(NodeFactory.createURI(recursiveURI));

		if(recursive_query.length==1)
		{
			
			DatasetGraph dsgRecursive = TDBFactory.createDatasetGraph(ExecRecursive.RECURSIVE_TDB_DIR);
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursive")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursive"));
			}
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursiveTemp")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
			}
			int countPrev = 0;
			int countNow = 0;

			QueryExecution qexec;
			
			while(true)
			{
				
				qexec = QueryExecutionFactory.create(recursive_query[0], ds);
				Iterator<Triple> aux = qexec.execConstructTriples();
				while(aux.hasNext())
				{
					Triple tr = aux.next();
					dsgRecursive.add(NodeFactory.createURI("http://example.org/recursiveTemp"), tr.getSubject(), tr.getPredicate(), tr.getObject());
				}
				dsg.addGraph(NodeFactory.createURI(recursiveURI), dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursiveTemp")));
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
				countNow = dsg.getGraph(NodeFactory.createURI(recursiveURI)).size();

				if(countNow == countPrev)
				{
					break;
				}
				countPrev = countNow;


			}
			dsgRecursive.close();
			qexec.close();
		}
		else
		{
			DatasetGraph dsgRecursive =TDBFactory.createDatasetGraph(ExecRecursive.RECURSIVE_TDB_DIR);
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursive")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursive"));
			}
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursiveTemp")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
			}
			QueryExecution qexecBase = QueryExecutionFactory.create(recursive_query[0], ds);
			QueryExecution qexecRec;
			
			Iterator<Triple> baseModel = qexecBase.execConstructTriples();
			while(baseModel.hasNext())
			{
				Triple tr = baseModel.next();
				dsgRecursive.add(NodeFactory.createURI("http://example.org/recursiveTemp"), tr.getSubject(), tr.getPredicate(), tr.getObject());
				dsgRecursive.add(NodeFactory.createURI("http://example.org/recursive"), tr.getSubject(), tr.getPredicate(), tr.getObject());
			}
			dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursiveTemp")));
			dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
			
			// System.out.println(dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursive")).size());
			
			int countNow = 0;
			int countPrev = 0;
			
			while(true)
			{
				qexecRec = QueryExecutionFactory.create(recursive_query[1], ds);
				Iterator<Triple> recModel = qexecRec.execConstructTriples();
	            
				
				while(recModel.hasNext())
				{
					
					Triple tr = recModel.next();
					dsgRecursive.add(NodeFactory.createURI("http://example.org/recursiveTemp"), tr.getSubject(), tr.getPredicate(), tr.getObject());
					dsgRecursive.add(NodeFactory.createURI("http://example.org/recursive"), tr.getSubject(), tr.getPredicate(), tr.getObject());
				}
				
				countNow = dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursive")).size();
				// System.out.println(countNow);
				
				if(countNow == countPrev)
				{
					break;
				}
				
				countPrev = countNow;
				dsg.removeGraph(NodeFactory.createURI(recursiveURI));
				dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursiveTemp")));
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
			}
			dsg.removeGraph(NodeFactory.createURI(recursiveURI));
			dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursive")));
			qexecBase.close();
			dsgRecursive.close();
		}


	}
	
	public static void execRecQueryOptLim(Dataset ds, Query recursiveQuery, String recursiveURI, int limit)
	{
		Query[] rec_query = parseOpt(recursiveQuery);
		ds.removeNamedModel(recursiveURI);

		if(rec_query.length==1)
		{
			int countPrev = 0;
			int countNow = 0;
			int count_limit = 0;
			Model workingGraph = ModelFactory.createDefaultModel();

			Model baseGraph;
			baseGraph = ModelFactory.createDefaultModel();

			QueryExecution qexec;			
			while(true)
			{
				qexec = QueryExecutionFactory.create(rec_query[0], ds);
				Model aux = qexec.execConstruct();
				countNow = aux.getGraph().size();
				if(countNow == countPrev)
				{
					break;
				}
				if(limit == count_limit)
				{
					break;
				}
				else
				{
					workingGraph = aux;
					Model union = workingGraph.union(baseGraph);
					ds.addNamedModel(recursiveURI, union);
					countPrev = countNow;

				}
				count_limit += 1;


			}
			qexec.close();
		}
		else
		{
			Model returnGraph = ModelFactory.createDefaultModel();
			QueryExecution qexecBase = QueryExecutionFactory.create(rec_query[0], ds);
			QueryExecution qexecRec;
			
			Model baseModel = qexecBase.execConstruct();
			ds.addNamedModel(recursiveURI, baseModel);
			
			returnGraph = returnGraph.union(baseModel);
			
			int countPrev = 0;
			int countNow = 0;
			int count_limit = 0;
			
			while(true)
			{
				qexecRec = QueryExecutionFactory.create(rec_query[1], ds);
				Model recModel = qexecRec.execConstruct();
				returnGraph.add(recModel);				

				countNow = (int) returnGraph.size();
				if(countNow == countPrev)
				{
					break;
				}
				if(limit == count_limit)
				{
					break;
				}

				countPrev = countNow;
				
				ds.removeNamedModel(recursiveURI);
				ds.addNamedModel(recursiveURI, recModel);
				count_limit += 1;
			}
			ds.removeNamedModel(recursiveURI);
			ds.addNamedModel(recursiveURI, returnGraph);
			qexecBase.close();
		}

	}
	
	public static void execRecQueryOptMaterializedLim(Dataset ds, Query recursiveQuery, String recursiveURI, int limit)
	{
		Query[] rec_query = parseOpt(recursiveQuery);
		DatasetGraph dsg = ds.asDatasetGraph();
		dsg.removeGraph(NodeFactory.createURI(recursiveURI));

		if(rec_query.length==1)
		{
			
			DatasetGraph dsgRecursive =TDBFactory.createDatasetGraph(ExecRecursive.RECURSIVE_TDB_DIR);
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursive")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursive"));
			}
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursiveTemp")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
			}
			int countPrev = 0;
			int countNow = 0;
			int count_limit = 0;

			QueryExecution qexec;
			
			while(true)
			{
				
				qexec = QueryExecutionFactory.create(rec_query[0], ds);
				Iterator<Triple> aux = qexec.execConstructTriples();
				while(aux.hasNext())
				{
					Triple tr = aux.next();
					dsgRecursive.add(NodeFactory.createURI("http://example.org/recursiveTemp"), tr.getSubject(), tr.getPredicate(), tr.getObject());
				}
				dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursiveTemp")));
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
				countNow = dsg.getGraph(NodeFactory.createURI(recursiveURI)).size();

				if(countNow == countPrev)
				{
					break;
				}
				if(limit == count_limit)
				{
					break;
				}
				countPrev = countNow;
				count_limit++;

			}
			dsgRecursive.close();
			qexec.close();
		}
		else
		{
			DatasetGraph dsgRecursive =TDBFactory.createDatasetGraph(ExecRecursive.RECURSIVE_TDB_DIR);
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursive")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursive"));
			}
			if(dsgRecursive.containsGraph(NodeFactory.createURI("http://example.org/recursiveTemp")))
			{
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
			}
			QueryExecution qexecBase = QueryExecutionFactory.create(rec_query[0], ds);
			QueryExecution qexecRec;
			
			Iterator<Triple> baseModel = qexecBase.execConstructTriples();
			while(baseModel.hasNext())
			{
				Triple tr = baseModel.next();
				dsgRecursive.add(NodeFactory.createURI("http://example.org/recursiveTemp"), tr.getSubject(), tr.getPredicate(), tr.getObject());
				dsgRecursive.add(NodeFactory.createURI("http://example.org/recursive"), tr.getSubject(), tr.getPredicate(), tr.getObject());
			}
			dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursiveTemp")));
			dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));
						
			int countNow = 0;
			int countPrev = 0;
			int count_limit = 0;
			
			while(true)
			{
				qexecRec = QueryExecutionFactory.create(rec_query[1], ds);
				Iterator<Triple> recModel = qexecRec.execConstructTriples();

				while(recModel.hasNext())
				{
					
					Triple tr = recModel.next();
					
					dsgRecursive.add(NodeFactory.createURI("http://example.org/recursiveTemp"), tr.getSubject(), tr.getPredicate(), tr.getObject());
					dsgRecursive.add(NodeFactory.createURI("http://example.org/recursive"), tr.getSubject(), tr.getPredicate(), tr.getObject());
				}
				
				countNow = dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursive")).size();
				
				if(countNow == countPrev)
				{
					break;
				}
				if(limit == count_limit)
				{
					break;
				}
				count_limit++;
				countPrev = countNow;
				
				dsg.removeGraph(NodeFactory.createURI(recursiveURI));
				dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursiveTemp")));
				dsgRecursive.removeGraph(NodeFactory.createURI("http://example.org/recursiveTemp"));		

			}
			dsg.removeGraph(NodeFactory.createURI(recursiveURI));
			dsg.addGraph(NodeFactory.createURI(recursiveURI),dsgRecursive.getGraph(NodeFactory.createURI("http://example.org/recursive")));
			qexecBase.close();
			dsgRecursive.close();
		}




	}
	
	public static Query[] parseOpt(Query inQuery)
	{
		String s = inQuery.toString();
		s = s.replace("\n", "");
		String[] splitQuery = s.split("WHERE");
		String preQuery = splitQuery[0].trim();
		String whereQuery = splitQuery[1].trim();
		whereQuery = whereQuery.substring(1,whereQuery.length()-1);
		
		if(!(whereQuery.contains("UNION")))
		{
			Query[] retQuery = new Query[1];
			retQuery[0] = inQuery;

			return retQuery;
		}
		else
		{
			String[] recursiveConstruct = whereQuery.split("UNION");
			String baseQuery = recursiveConstruct[0].trim();
			String recursiveStepQuery = recursiveConstruct[1].trim();
			String qs1 = preQuery + " WHERE " + baseQuery;
			String qs2 = preQuery +" WHERE {" + recursiveStepQuery + "}";
			Query q1 = QueryFactory.create(qs1);
			Query q2 = QueryFactory.create(qs2);
			Query[] retQuery = new Query[2];
			retQuery[0] = q1;
			retQuery[1] = q2;

			return retQuery;
		}
		
	}
	
	
	
}
