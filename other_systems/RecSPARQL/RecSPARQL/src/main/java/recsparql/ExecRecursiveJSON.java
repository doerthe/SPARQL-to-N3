package recsparql;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Collectors;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.MyQueryExecutionFactory;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.sparql.lang.MyRecursiveNode;
import org.apache.jena.sparql.lang.MyRecursiveNodeFactory;
import org.apache.jena.sparql.lang.RecursiveNodeFactory;
import org.apache.jena.tdb.TDBFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.common.collect.Lists;

public class ExecRecursiveJSON {

	public static void main(String[] args) throws FileNotFoundException, IOException, ParseException {
		// START parameters

		boolean verbose = true;

		// number of runs
		int nrRuns = 1;

		// - recSPARQL

		String root = "/Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/";

		// -- yago
//		int nr = 1; // (1-5)		
//		String tdbPath = root + "datasets/yagoFacts";
////		String dataPath = "file://" + root + "datasets/yagoFacts.nt";
//		String queryPath = root + "queries/yago-facts.json";
//		String outPath = root + "results/yago%s.txt";

		// -- lmdb
//		int nr = 1; // (1-3)
//		String tdbPath = root + "datasets/lmdb";
//		String queryPath = root + "queries/lmdb.json";
//		String outPath = root + "results/lmdb%s.txt";

		// -- gmark
		int nr = 1; // (1-10)
		String tdbPath = root + "datasets/GMark/gmark1-subset2"; // "datasets/GMark/gmark3";
		String queryPath = root + "queries/gmark.json";
		String outPath = root + "results/gmark%s.txt";

		// END parameters

		MyRecursiveNode.verbose = verbose;

		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());

		JSONParser parser = new JSONParser();
		JSONObject queries_object = (JSONObject) parser.parse(new FileReader(queryPath));
		JSONArray queries_list = (JSONArray) queries_object.get("queries");

		if (!verbose) {
			System.out.println("execTime");
		}
		for (int i = 0; i < nrRuns; i++) {
			if (verbose) {
				System.out.println("query: " + nr + "; run: " + i);
			}

			Dataset dataset = TDBFactory.createDataset(tdbPath);

			// NOTE doesn't work; the TDB dataset is doing something magical.
//			Model model = ModelFactory.createDefaultModel();
//			model.read(ExecRecursive.dataPath, null, "N-TRIPLE");

			String query_string = (String) ((JSONObject) queries_list.get(nr - 1)).get("query");
//			System.out.println(query_string + "\n---\n");

			long start = System.currentTimeMillis();

			Query query = QueryFactory.create(query_string);

			QueryExecution qexec = MyQueryExecutionFactory.create(query, dataset);
//			QueryExecution qexec = MyQueryExecutionFactory.create(query, model);

			int nrTriples = 0;
			StringBuffer out = new StringBuffer();

			ResultSet rs = qexec.execSelect();
			while (rs.hasNext()) {
				QuerySolution rb = rs.nextSolution();

				String line = Lists.newArrayList(rb.varNames()).stream().map(var -> var + "=" + rb.get(var))
						.collect(Collectors.joining(","));
				out.append(line).append("\n");

				nrTriples++;
			}

			qexec.close();

			dataset.close();
//			model.close();

			Files.write(Paths.get(String.format(outPath, nr)), out.toString().getBytes());

			long total = System.currentTimeMillis() - start;

			if (verbose) {
				System.out.println("# triples: " + nrTriples);
				System.out.println("execTime: " + total + " ms");

			} else {
				System.out.println(total);
			}
		}
	}
}
