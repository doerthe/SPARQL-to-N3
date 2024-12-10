package arq.examples;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.sparql.lang.RecursiveNode;
import org.apache.jena.tdb.TDBFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ExecRecursiveIterationsJSON {

	public static int REPETITIONS = 1;

	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException {
		// TODO Auto-generated method stub

		JSONParser parser = new JSONParser();
		JSONObject queries_object = (JSONObject) parser.parse(new FileReader("/Users/adriansotosuarez/Documents/Datasets/Queries/yago2.json"));
		JSONArray queries_list = (JSONArray) queries_object.get("queries");

		int iterations = 14;

		for (int i = 0; i < queries_list.size(); i++) {
			System.out.println("### Query " + i + " ###");
			
			for (int k = 0; k < iterations; k++) {

				for (int j = 0; j < REPETITIONS; j++) {

					ExecRecursive.NUMBER_OF_ITERATIONS = k;
					Dataset dataset = TDBFactory.createDataset(ExecRecursive.TDB_DIR); 

					String query_string = (String) ((JSONObject)queries_list.get(i)).get("query");
					Query query = QueryFactory.create(query_string);

					long start = System.currentTimeMillis();

					QueryExecution qexec = QueryExecutionFactory.create(query, dataset);

					System.out.println("### Capture: " + j + ", LIMIT: " + k + " ###");
					int triples = 0;
					try {
						ResultSet rs = qexec.execSelect() ;

						while (rs.hasNext())
						{
							QuerySolution rb = rs.nextSolution();

							// RDFNode x = rb.get("x");
							// RDFNode y = rb.get("y");
							// RDFNode z = rb.get("z");             
							//System.out.println(x + " - " + y + " - " + z);
							triples++;
						}
					}
					finally
					{
						qexec.close();
						dataset.close();

					}

					long elapsedTimeMillis = System.currentTimeMillis()-start;

					System.out.println("Triples: " + triples);
					System.out.println("Time: " + elapsedTimeMillis);
				}

			}

		}


	}

}
