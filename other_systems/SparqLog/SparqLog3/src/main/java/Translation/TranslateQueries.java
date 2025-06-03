package Translation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TranslateQueries {

	// help with converting into nemo:
	// (remove ID args):
	// ID\d, -> 
	// (remove ID creation)
	// , ID\d = .*\. -> .
	// (?'s for variables)
	// (case-sensitive) (\(|,)(\s*)[A-Z] -> $1$2?$3
	
	public static void main(String[] args) throws Exception {
//		translateSparqlBenchmarks();
//		translateRecSparql();
		
		translateSingleQuery();
	}
	
	public static void translateSingleQuery() throws Exception {
		String query = 
				"PREFIX : <http://example/>\n"
				+ "PREFIX : <>  \n"
				+ "SELECT *\n"
				+ "    { ?x1 :p16/:p17 ?x2 . ?x2 :p18 ?x3 }";
		
		SPARQLTranslator sparqlTranslator = new SPARQLTranslator(new SkolemFunctionGenerator());
		Writer w = new PrintWriter(System.out);
		insertPreamble(w);
		translateQuery(sparqlTranslator, query, w);
		
		w.flush();
	}

	public static void translateSparqlBenchmarks() {
		for (String schema : Arrays.asList("beseppi", "swdfmygraph", "sp2bench50k", "sp2benchPropertyPath",
				"sp2benchOntology")) {
			System.out.println("Benchmark " + schema + ":");

			String queryDeliminator = "#---";
			String filePath = getQueryPathForSchema(schema);
			List<String> queries = loadQueries(filePath, queryDeliminator);

			SPARQLTranslator sparqlTranslator = new SPARQLTranslator(new SkolemFunctionGenerator());

			int i = 0;
			try (FileWriter myWriter = new FileWriter(
					"src/main/resources/SPARQL_Benchmarks/Vadalog Translation of Benchmark Queries/" + schema
							+ ".txt");) {

				for (String query : queries) {
					System.out.println("Translating query " + i + " to SparqLog.");

					myWriter.write("% Query " + i++ + ":\n");
					insertPreamble(myWriter);
					translateQuery(sparqlTranslator, query, myWriter);
					myWriter.write("\n\n");
				}

				myWriter.flush();
				myWriter.close();

			} catch (IOException e) {
				e.printStackTrace();
				return;
			}
		}
	}

	public static void translateRecSparql() throws IOException {
		SPARQLTranslator sparqlTranslator = new SPARQLTranslator(new SkolemFunctionGenerator());

		String queryDeliminator = "#---";

		String path = "src/main/resources/recSPARQL/";

		for (File file : new File(path).listFiles()) {
			if (file.isDirectory())
				continue;

			System.out.println("Translating " + file.getName());

			String vlName = file.getName().substring(0, file.getName().lastIndexOf(".")) + ".vl";
			File vlFile = new File(path + "vadalog", vlName);
			FileWriter w = new FileWriter(vlFile, false);

			insertPreamble(w);

			List<String> queries = loadQueries(file.getPath(), queryDeliminator);
			int i = 0;
			for (String query : queries) {
				System.out.println("translating query " + i++ + " to SparqLog.");

				translateQuery(sparqlTranslator, query, w);
				w.write("\n\n");
			}

			System.out.println("");

			w.flush();
			w.close();
		}
	}

	public static List<String> loadQueries(String filePath, String queryDeliminator) {
		File file = new File(filePath);
		List<String> queries = new ArrayList<>();

		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.exit(-1);
		}

		try {
			String line;
			String query = "";
			while ((line = br.readLine()) != null) {
				if (line.startsWith(queryDeliminator)) {
					if (!query.isEmpty()) {
						queries.add(query);
					}
					query = "";
					continue;
				}
				query += line + "\n";
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.exit(-1);
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
				System.exit(-1);
			}
		}

		return queries;
	}

	public static String getQueryPathForSchema(String schema) {
		switch (schema) {
		case "beseppi":
			return "src/main/resources/SPARQL_Benchmarks/BeSeppi/queries/queries.txt";
		case "swdfmygraph":
			return "src/main/resources/SPARQL_Benchmarks/Feasible/queries/processed_queries.txt";
		case "sp2bench50k":
			return "src/main/resources/SPARQL_Benchmarks/SP2bench/queries/processed_queries.txt";
		case "sp2benchPropertyPath":
			return "src/main/resources/SPARQL_Benchmarks/SP2bench/Property Path Queries/queries.txt";
		case "sp2benchOntology":
			return "src/main/resources/SPARQL_Benchmarks/SP2bench/Ontology Queries/queries.txt";
		default:
			throw new IllegalArgumentException("Schema: " + schema + " not known!");
		}
	}

	public static void createDirectoryIfNotExists(String directoryPath) {
		File directory = new File(directoryPath);
		if (!directory.exists()) {
			directory.mkdir();
		}
	}

	private static void insertPreamble(Writer w) throws IOException {
		w.write("@include(\"RDF Triples\").\n" + "@include(\"Auxiliary Predicates\").\n\n");
	}

	private static void translateQuery(SPARQLTranslator sparqlTranslator, String query, Writer w) throws IOException {
		try {
			String parsedQuery = sparqlTranslator.parseQuery(query);
//			w.write("@include(\"RDF Triples\").\n" + "@include(\"Auxiliary Predicates\").\n");
			w.write(parsedQuery);
			w.write("@include(\"RDF Triples\").\n" + "@output(\"ans1\").");

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
