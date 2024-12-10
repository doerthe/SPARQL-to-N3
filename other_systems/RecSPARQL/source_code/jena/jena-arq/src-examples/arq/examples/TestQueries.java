package arq.examples;

import java.util.List;
import java.util.ArrayList;

import javax.print.attribute.standard.OutputDeviceAssigned;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.ResultSetFormatter;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.sparql.core.Quad;
import org.apache.jena.tdb.TDBFactory;

public class TestQueries {

	public static final String TDB_DIR = "/Users/adriansotosuarez/Desktop/LeapfrogData";

	public static void main(String[] args) {

		Dataset dataset = TDBFactory.createDataset(TDB_DIR);
		
		// Select your query
		String queryString = TestQueriesString.QUERY_1;
		
		List<List<String>> output = returnAsList(queryString, dataset);
		
		// TODO: Cambiar el output2 por lo que tira el Leapfrog	
		List<List<String>> output2 = returnAsList(queryString, dataset);
		compareOutputs(output, output2);
		
		// TODO: Repetir para cada una de las consultas

	}
	
	public static void compareOutputs(List<List<String>> out1, List<List<String>> out2) {
		if (out1.size() != out2.size()) {
			System.out.println("Size is different: " + out1.size() + " and " + out2.size() + ".");
			return;
		} else {
			for (int i = 0; i < out1.size(); i++) {
				for (int j = 0; j < out1.get(i).size(); j++)  {
					if (!out1.get(i).get(j).equals(out2.get(i).get(j))) {
						System.out.println("Output is different in row " + i);
						return;
					}
				}
			}
		}
		System.out.println("Output iguales :)");
		
	}

	public static List<List<String>> returnAsList(String queryString, Dataset dataset) {
		Query query = QueryFactory.create(queryString);
		QueryExecution qexec = QueryExecutionFactory.create(query, dataset);

		List<List<String>> returnList = new ArrayList<>();

		try {
			ResultSet rs = qexec.execSelect() ;
			List<String> vars_name = rs.getResultVars();
			for ( ; rs.hasNext() ; )
			{
				QuerySolution rb = rs.nextSolution() ;

				List<String> row = new ArrayList<>();
				for (String var_name : vars_name) {
					if (rb.get(var_name) == null) {
						row.add("");
					} else {
						row.add(rb.get(var_name).toString());
					}
				}
				returnList.add(row);
			}
		}
		finally
		{
			qexec.close() ;
		}
		return returnList;
	}

}
