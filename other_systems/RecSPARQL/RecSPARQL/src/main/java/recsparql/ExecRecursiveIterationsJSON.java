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

// NOTE file not used

public class ExecRecursiveIterationsJSON {

	public static final String root = "/Users/wvw/git/n3/sparql2n3/other systems/RecSPARQL/";
	public static final String tdbPath = root + "datasets/GMark/gmark3";
	public static final String queryPath = root + "queries/gmark.json";

	public static int REPETITIONS = 1;

	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException {
		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());
		
		JSONParser parser = new JSONParser();
		JSONObject queries_object = (JSONObject) parser.parse(new FileReader(queryPath));
		JSONArray queries_list = (JSONArray) queries_object.get("queries");

		int iterations = 14;

		for (int i = 0; i < queries_list.size(); i++) {
			System.out.println("### Query " + i + " ###");

			for (int k = 0; k < iterations; k++) {

				for (int j = 0; j < REPETITIONS; j++) {

//					int k = iterations;
					ExecRecursive.NUMBER_OF_ITERATIONS = k;
					Dataset dataset = TDBFactory.createDataset(tdbPath);

					String query_string = (String) ((JSONObject) queries_list.get(i)).get("query");
					Query query = QueryFactory.create(query_string);

					long start = System.currentTimeMillis();

					QueryExecution qexec = MyQueryExecutionFactory.create(query, dataset);

					System.out.println("### Capture: " + j + ", LIMIT: " + k + " ###");
					int triples = 0;
					try {
						ResultSet rs = qexec.execSelect();

						while (rs.hasNext()) {
							QuerySolution rb = rs.nextSolution();

							RDFNode x = rb.get("x");
							RDFNode y = rb.get("y");
							RDFNode z = rb.get("z");
							System.out.println(x + " - " + y + " - " + z);
							triples++;
						}
					} finally {
						qexec.close();
						dataset.close();

					}

					long elapsedTimeMillis = System.currentTimeMillis() - start;

					if (triples > 0) {
						System.out.println("FOUND!!!");
					}
					System.out.println("Triples: " + triples);
					System.out.println("Time: " + elapsedTimeMillis);
				}
			}
		}
	}
}
