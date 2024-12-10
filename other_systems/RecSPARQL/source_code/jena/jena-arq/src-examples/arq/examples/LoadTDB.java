package arq.examples;

import org.apache.jena.query.Dataset;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.util.FileManager;

import java.io.IOException;


public class LoadTDB {

	public static void main(String[] args) throws IOException {

		String directory = ExecRecursive.TDB_DIR;
		Dataset dataset = TDBFactory.createDataset(directory);
		Model tdb = dataset.getDefaultModel();

		String source = "/Users/adriansotosuarez/Documents/Datasets/gmark/graph3.nt";
		FileManager.get().readModel(tdb, source, "NT");

		dataset.close();


	}

}
