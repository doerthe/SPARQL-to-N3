package recsparql;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.MyQueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.sparql.lang.MyRecursiveNodeFactory;
import org.apache.jena.sparql.lang.RecursiveNodeFactory;
import org.apache.jena.tdb.TDBFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ExecRecursiveJSON {

	public static int REPETITIONS = 1;

	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException {
		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());
		
		JSONParser parser = new JSONParser();
		JSONObject queries_object = (JSONObject) parser.parse(new FileReader(ExecRecursive.queryPath));
		JSONArray queries_list = (JSONArray) queries_object.get("queries");

//		for (int i = 0; i < queries_list.size(); i++) {
		int i = 2;
		System.out.println("### Query " + i + " ###");

		for (int j = 0; j < REPETITIONS; j++) {
			Dataset dataset = TDBFactory.createDataset(ExecRecursive.tdbPath);

			String query_string = (String) ((JSONObject) queries_list.get(i)).get("query");
			System.out.println(query_string + "\n---\n");

			Query query = QueryFactory.create(query_string);

			long start = System.currentTimeMillis();

			QueryExecution qexec = MyQueryExecutionFactory.create(query, dataset);

			System.out.println("### Capture: " + j + " ###");
			int triples = 0;
			try {
				ResultSet rs = qexec.execSelect();

				while (rs.hasNext()) {
					QuerySolution rb = rs.nextSolution();

//					RDFNode x1 = rb.get("x1");
//					RDFNode z1 = rb.get("z1");
//					RDFNode x2 = rb.get("x2");
//					RDFNode z2 = rb.get("z2");
//					System.out.println(x1 + " - " + z1 + " - " + x2 + " - " + z2);

//					RDFNode z = rb.get("z");
//					RDFNode v = rb.get("v");
//					System.out.println(z + " - " + v);
//					
//					RDFNode x = rb.get("x");
//					RDFNode y = rb.get("y");
//					RDFNode z = rb.get("z");
//					System.out.println(x + " - " + y + " - " + z);
					triples++;
				}
			} finally {
				qexec.close();
				dataset.close();
			}

			long elapsedTimeMillis = System.currentTimeMillis() - start;

			System.out.println("Triples: " + triples);
			System.out.println("Time: " + elapsedTimeMillis);
		}
	}
//	}
}
