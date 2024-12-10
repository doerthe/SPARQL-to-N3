package recsparql;

import java.io.File;

import org.apache.jena.query.Dataset;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.sparql.lang.MyRecursiveNodeFactory;
import org.apache.jena.sparql.lang.RecursiveNodeFactory;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.util.FileManager;

public class LoadTDB {

	public static void main(String[] args) throws Exception {
		// START parameters

		// - recSPARQL

		String root = "/Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/";

		// -- yago
//		String source = root + "RecSPARQL/datasets/yagoFacts.nt";
//		String tdbPath = root + "RecSPARQL/datasets/yagoFacts";

		// -- lmdb
//		String source = root + "RecSPARQL/datasets/linkedmdb-latest-dump-fixed.nt";
//		String tdbPath = root + "RecSPARQL/datasets/lmdb";

		// -- gmark
//		String source = root + "RecSPARQL/datasets/GMark/graph1-subset2.nt"; // "datasets/GMark/graph3.nt";
//		String tdbPath = root + "RecSPARQL/datasets/GMark/gmark1-subset2"; // "datasets/GMark/gmark3";

		// -- gmark-dominik
		String datasetNr = "50";
		String source = root + "gmark-dominik/" + datasetNr + ".nt";
		String tdbPath = root + "RecSPARQL/datasets/GMark/gmark_" + datasetNr;

		// END parameters

		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());

		File directory = new File(tdbPath);
		if (directory.exists()) {
			// clear directory first
			for (File f : directory.listFiles())
				f.delete();
		}

		long start = System.currentTimeMillis();

		Dataset dataset = TDBFactory.createDataset(directory.getAbsolutePath());
		Model tdb = dataset.getDefaultModel();

		FileManager.get().readModel(tdb, source, "NT");

		dataset.close();

		long end = System.currentTimeMillis();
		System.out.println("time: " + (end - start));
	}
}
