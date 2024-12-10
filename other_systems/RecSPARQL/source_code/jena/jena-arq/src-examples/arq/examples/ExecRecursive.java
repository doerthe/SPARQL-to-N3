package arq.examples;

import java.util.HashMap;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.sparql.core.Quad;
import org.apache.jena.tdb.TDBFactory;



public class ExecRecursive {

	public static final String RECURSIVE_TDB_DIR = "/Users/adriansotosuarez/Documents/Datasets/RecAux";
	public static final String TDB_DIR = "/Users/adriansotosuarez/Documents/Datasets/gmark/gmark3";
	public static final String[] RECURSIVE_METHODS = {"MEM", "MEM-OPT", "DISK-OPT", "MEM-OPT-LIMIT", "DISK-OPT-LIMIT"};
	public static final String RECURSIVE_METHOD = RECURSIVE_METHODS[3];
	public static int NUMBER_OF_ITERATIONS = 8;

	public static void main(String[] args) {

		Dataset dataset = TDBFactory.createDataset(TDB_DIR);

		String queryString = "SELECT DISTINCT ?act WHERE\n" + 
				"                	{\n" + 
				"                	{\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/actor>\n" + 
				"                	  <http://data.linkedmdb.org/resource/actor/29539> .\n" + 
				"                	  ?mov <http://data.linkedmdb.org/resource/movie/actor> ?act .\n" + 
				"                	  ?mov <http://data.linkedmdb.org/resource/movie/director> ?dir .\n" + 
				"                	  ?dir <http://data.linkedmdb.org/resource/movie/director_name> ?x .\n" + 
				"                	  ?dir <http://data.linkedmdb.org/resource/movie/actor_name> ?x\n" + 
				"                  }\n" + 
				"                  UNION {\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/actor>\n" + 
				"                    <http://data.linkedmdb.org/resource/actor/29539> .\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/actor> ?act2 .\n" + 
				"                    ?mov2 <http://data.linkedmdb.org/resource/movie/actor> ?act2 .\n" + 
				"                    ?mov2 <http://data.linkedmdb.org/resource/movie/actor> ?act .\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/director> ?dir .\n" + 
				"                    ?mov2 <http://data.linkedmdb.org/resource/movie/director> ?dir2 .\n" + 
				"                    ?dir <http://data.linkedmdb.org/resource/movie/director_name> ?x .\n" + 
				"                	  ?y <http://data.linkedmdb.org/resource/movie/actor_name> ?x .\n" + 
				"                    ?dir2 <http://data.linkedmdb.org/resource/movie/director_name> ?x2 .\n" + 
				"                	  ?y2 <http://data.linkedmdb.org/resource/movie/actor_name> ?x2\n" + 
				"                  }\n" + 
				"                  UNION {\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/actor>\n" + 
				"                    <http://data.linkedmdb.org/resource/actor/29539> .\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/actor> ?act3 .\n" + 
				"                    ?mov2 <http://data.linkedmdb.org/resource/movie/actor> ?act3 .\n" + 
				"                    ?mov2 <http://data.linkedmdb.org/resource/movie/actor> ?act2 .\n" + 
				"                    ?mov3 <http://data.linkedmdb.org/resource/movie/actor> ?act2 .\n" + 
				"                    ?mov3 <http://data.linkedmdb.org/resource/movie/actor> ?act .\n" + 
				"                    ?mov <http://data.linkedmdb.org/resource/movie/director> ?dir .\n" + 
				"                    ?mov2 <http://data.linkedmdb.org/resource/movie/director> ?dir2 .\n" + 
				"                    ?mov3 <http://data.linkedmdb.org/resource/movie/director> ?dir3 .\n" + 
				"                    ?dir <http://data.linkedmdb.org/resource/movie/director_name> ?x .\n" + 
				"                	  ?y <http://data.linkedmdb.org/resource/movie/actor_name> ?x .\n" + 
				"                    ?dir2 <http://data.linkedmdb.org/resource/movie/director_name> ?x2 .\n" + 
				"                	  ?y2 <http://data.linkedmdb.org/resource/movie/actor_name> ?x2 .\n" + 
				"                    ?dir3 <http://data.linkedmdb.org/resource/movie/director_name> ?x3 .\n" + 
				"                	  ?y3 <http://data.linkedmdb.org/resource/movie/actor_name> ?x3\n" + 
				"                  }\n" + 
				"                	}"; 

		
		queryString = "SELECT DISTINCT ?p1 ?p2 ?p3 ?p4 WHERE {?x ?p1 ?u . ?x ?p2 ?v . ?y ?p3 ?u . ?y ?p4 ?v FILTER(?x != ?y && ?p1 != ?p2 && ?p3 != ?p4 && ?u != ?v) }";
		queryString = "SELECT DISTINCT ?act WHERE\n" + 
				"                	{\n" + 
				"                	{\n" + 
				"                    <http://yago-knowledge.org/resource/Kevin_Bacon> <http://yago-knowledge.org/resource/actedIn> ?mov .\n" + 
				"                    ?act <http://yago-knowledge.org/resource/actedIn> ?mov .\n" + 
				"                    ?dir <http://yago-knowledge.org/resource/directed> ?mov .\n" + 
				"                    ?dir <http://yago-knowledge.org/resource/actedIn> ?mov1\n" + 
				"                  }\n" + 
				"                  UNION {\n" + 
				"                    <http://yago-knowledge.org/resource/Kevin_Bacon> <http://yago-knowledge.org/resource/actedIn> ?mov .\n" + 
				"                    ?act2 <http://yago-knowledge.org/resource/actedIn> ?mov .\n" + 
				"                    ?dir <http://yago-knowledge.org/resource/directed> ?mov .\n" + 
				"                    ?dir <http://yago-knowledge.org/resource/actedIn> ?movd1 .\n" + 
				"                    ?act2 <http://yago-knowledge.org/resource/actedIn> ?mov2 .\n" + 
				"                    ?act <http://yago-knowledge.org/resource/actedIn> ?mov2 .\n" + 
				"                    ?dir2 <http://yago-knowledge.org/resource/directed> ?mov2 .\n" + 
				"                    ?dir2 <http://yago-knowledge.org/resource/actedIn> ?movd2 .\n" + 
				"                  }\n" +
				"                }";
		
		queryString = "SELECT * WHERE {?x ?y ?z}";
		long start = System.currentTimeMillis();

		Query query = QueryFactory.create(queryString);
		QueryExecution qexec = QueryExecutionFactory.create(query, dataset);

		HashMap<RDFNode, Integer> predicates = new HashMap<>();
		
		int triples = 0;
		try {
			ResultSet rs = qexec.execSelect() ;

			for ( ; rs.hasNext() ; )
			{
				QuerySolution rb = rs.nextSolution() ;

				// RDFNode z = rb.get("z") ;
				//System.out.println( z + " - " + cz ) ;
				triples++;

			}
		}
		finally
		{
			qexec.close() ;
		}
		
		long end = System.currentTimeMillis() - start;
		
		System.out.println("Triples:" + triples);
		System.out.println("Time:" + end);
	}

}
