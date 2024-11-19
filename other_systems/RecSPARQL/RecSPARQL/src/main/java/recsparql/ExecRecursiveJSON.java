package recsparql;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.stream.Collectors;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.MyQueryExecutionFactory;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.sparql.lang.MyRecursiveNodeFactory;
import org.apache.jena.sparql.lang.RecursiveNodeFactory;
import org.apache.jena.tdb.TDBFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.common.collect.Lists;

public class ExecRecursiveJSON {

	public static int REPETITIONS = 1;

	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException {
		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());

		JSONParser parser = new JSONParser();
		JSONObject queries_object = (JSONObject) parser.parse(new FileReader(ExecRecursive.queryPath));
		JSONArray queries_list = (JSONArray) queries_object.get("queries");

//		for (int i = 0; i < queries_list.size(); i++) {

		// START parameters
		
		// try different query
		int i = 0;
		
		// END parameters
		
		
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
//					System.out.println(Lists.newArrayList(rb.varNames()).stream().map(var -> rb.get(var).toString())
//							.collect(Collectors.joining(",")));

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
