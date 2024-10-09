package recsparql;


import org.apache.jena.query.Dataset;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.sparql.lang.MyRecursiveNodeFactory;
import org.apache.jena.sparql.lang.RecursiveNodeFactory;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.util.FileManager;

public class LoadTDB {

	public static void main(String[] args) throws Exception {
		RecursiveNodeFactory.set(new MyRecursiveNodeFactory());
		
		long start = System.currentTimeMillis();
		
		String directory = ExecRecursive.tdbPath;
		Dataset dataset = TDBFactory.createDataset(directory);
		Model tdb = dataset.getDefaultModel();

		String source = "/Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/linkedmdb-latest-dump-fixed.nt";
		FileManager.get().readModel(tdb, source, "NT");

		dataset.close();
		
		long end = System.currentTimeMillis();
		System.out.println("time: " + (end - start));
	}
}
