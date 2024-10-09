package arq.examples;

import java.io.BufferedReader;
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
import org.apache.jena.sparql.core.Quad;
import org.apache.jena.tdb.TDBFactory;



public class ExecGMarkFile {

	public static String TDB_GMARK_DIR = "/Users/adriansotosuarez/Documents/Datasets/gmark/gmark2";
	public static final int REPETITIONS = 3;
	public static void main(String[] args) throws IOException {

		Dataset dataset = TDBFactory.createDataset(ExecRecursive.TDB_DIR);
		String fileGMark = "/Users/adriansotosuarez/Documents/Datasets/Queries/gmark.txt";

		FileReader fileReader = new FileReader(fileGMark);

		BufferedReader bufferedReader = new BufferedReader(fileReader);

		String queryString = null;
		int queryCount = 0;
		while ((queryString = bufferedReader.readLine()) != null) {
			System.out.println("### Query " + queryCount + " ###");
			if (!(queryString.substring(0, 2)).equals("//")) {
				for (int i = 0; i < REPETITIONS; i++) {

					System.out.println("### Capture: " + i + " ###");
					Query query = QueryFactory.create(queryString);

					long start = System.currentTimeMillis();

					QueryExecution qexec = QueryExecutionFactory.create(query, dataset);

					int triples = 0;
					try {
						ResultSet rs = qexec.execSelect() ;

						for ( ; rs.hasNext() ; )
						{
							QuerySolution rb = rs.nextSolution();
							triples++;
						}
					}
					finally
					{
						qexec.close() ;
					}

					long elapsedTimeMillis = System.currentTimeMillis()-start;

					System.out.println("Triples: " + triples);
					System.out.println("Time: " + elapsedTimeMillis);
				}
			}
			queryCount++;
		}   

		// Always close files.
		bufferedReader.close();         




	}

}
