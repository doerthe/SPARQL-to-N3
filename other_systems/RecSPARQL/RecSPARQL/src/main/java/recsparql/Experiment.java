package recsparql;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
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

import com.google.common.collect.Lists;

public class Experiment {

	public static void main(String[] args) throws Exception {
		// - START parameters

		String root = "/Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/";

//		// -- lmdb
//
//		// (these don't finish after 5 minutes or so)
//		List<String> skipQueries = Arrays.asList();
//		String skipUntil = null;
//
//		String dataName = "lmdb";
//		String queryFolder = root + "other_systems/RecSPARQL/queries/recsparql/" + dataName;
//		String dataPath = root + "other_systems/RecSPARQL/datasets/lmdb";

//		// -- yago
//
//		// (these don't finish after 5 minutes or so)
//		List<String> skipQueries = Arrays.asList();
//		String skipUntil = null;
//
//		String dataName = "yago";
//		String queryFolder = root + "other_systems/RecSPARQL/queries/recsparql/" + dataName;
//		String dataPath = root + "other_systems/RecSPARQL/datasets/yagoFacts";

		// TODO these won't work - need to convert into specific RecSPARQL syntax ...

//		// -- gmark
//		String dataset = "50";
//		// (these don't finish after 5 minutes or so)
//		List<String> skipQueries = Arrays.asList();
//		String skipUntil = null;
//
//		String dataName = "gmark_" + dataset;
//		String queryFolder = root + "other_systems/gmark-dominik/" + dataset + "/";
//		String dataPath = root + "other_systems/RecSPARQL/datasets/GMark/gmark_" + dataset;

		// -- zika

		// (these don't finish after 5 minutes or so)
		List<String> skipQueries = Arrays.asList();
		String skipUntil = null;

		String dataName = "zika";
		String queryFolder = root + "SPIN-to-N3/test/cases/zika/zika-queries-all.rsparql";
		String dataPath = root + "SPIN-to-N3/test/cases/zika/zika-data.n3";

		// (general)

		String outFolder = root + "SPIN-to-N3/test/run/results";
		String resultTmpl = "%s-%s-recsparql.txt";
		String timesFile = root + "SPIN-to-N3/test/run/times/" + dataName + "-recsparql.csv";

		// - END parameters

		FileWriter fw = new FileWriter(new File(timesFile));
		fw.write("query,result_file,exec_time\n");

		// - run all queries in folder

		File queryFile = new File(queryFolder);
		if (!queryFile.isDirectory()) {
			String queryPath = queryFile.getAbsolutePath();
			experiment(queryPath, dataName, dataPath, outFolder, resultTmpl, fw);

		} else {
			boolean skip = (skipUntil != null);

			List<File> files = Arrays.asList(new File(queryFolder).listFiles());
			files.sort((f1, f2) -> f1.getName().compareTo(f2.getName()));
			for (File f : files) {
				if (!f.getName().endsWith(".rsparql") || skipQueries.contains(f.getName())) {
					continue;
				}
				if (skip) {
					if (skipUntil.equals(f.getName())) {
						skip = false;
					} else {
						continue;
					}
				}

				String queryPath = f.getAbsolutePath();
				experiment(queryPath, dataName, dataPath, outFolder, resultTmpl, fw);
			}
		}

		fw.close();
	}

	public static void experiment(String queryPath, String dataName, String dataPath, String outFolder,
			String resultTmpl, FileWriter fw) throws Exception {

		String queryName = new File(queryPath).getName();
		queryName = queryName.substring(0, queryName.lastIndexOf("."));

		System.out.println("> " + queryName);

		long start = System.nanoTime();

		MyRecursiveNode.verbose = false;

		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());

		Dataset dataset = TDBFactory.createDataset(dataPath);

		// NOTE doesn't work; the TDB dataset is doing something magical.
//			Model model = ModelFactory.createDefaultModel();
//			model.read(ExecRecursive.dataPath, null, "N-TRIPLE");

		String queryString = readFile(queryPath, StandardCharsets.UTF_8);
//			System.out.println(query_string + "\n---\n");

		Query query = QueryFactory.create(queryString);

		QueryExecution qexec = MyQueryExecutionFactory.create(query, dataset);
//			QueryExecution qexec = MyQueryExecutionFactory.create(query, model);

		StringBuffer out = new StringBuffer();

		ResultSet rs = qexec.execSelect();
		while (rs.hasNext()) {
			QuerySolution rb = rs.nextSolution();

			String line = Lists.newArrayList(rb.varNames()).stream().map(var -> var + "=" + rb.get(var))
					.collect(Collectors.joining(","));
			out.append(line).append("\n");
		}

		qexec.close();

		dataset.close();
//			model.close();

		String resultName = String.format(resultTmpl, dataName, queryName);
		String resultPath = outFolder + "/" + resultName;

		Files.write(Paths.get(resultPath), out.toString().getBytes());

		double exec = ((double) (System.nanoTime() - start) / 1000000000);

		fw.write(queryName + "," + resultName + "," + exec + "\n");
	}

	static String readFile(String path, Charset encoding) throws IOException {
		byte[] encoded = Files.readAllBytes(Paths.get(path));
		return new String(encoded, encoding);
	}
}
