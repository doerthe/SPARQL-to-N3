package Translation;
import java.io.*;
import java.text.ParseException;
import java.util.*;

public class TranslateQueries {
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
                return "src/SPARQL_Benchmarks/BeSeppi/queries/queries.txt";
            case "swdfmygraph":
                return "src/SPARQL_Benchmarks/Feasible/queries/processed_queries.txt";
            case "sp2bench50k":
                return "src/SPARQL_Benchmarks/SP2bench/queries/processed_queries.txt";
            case "sp2benchPropertyPath":
                return "src/SPARQL_Benchmarks/SP2bench/Property Path Queries/queries.txt";
            case "sp2benchOntology":
                return "src/SPARQL_Benchmarks/SP2bench/Ontology Queries/queries.txt";
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

    public static void main(String[] args) {
        for (String schema : Arrays.asList("beseppi", "swdfmygraph", "sp2bench50k", "sp2benchPropertyPath", "sp2benchOntology")) {
            System.out.println("Benchmark " + schema + ":");

            String queryDeliminator = "#---";
            String filePath = getQueryPathForSchema(schema);
            List<String> queries = loadQueries(filePath, queryDeliminator);

            SPARQLTranslator sparqlTranslator = new SPARQLTranslator(new SkolemFunctionGenerator());

            // Query + errorMessage
            Map<String, String> errors = new HashMap<>();
            List<String> parsedQueries = new ArrayList<>();
            List<String> unparsedQueries = new ArrayList<>();
            int i = 0;

            try (FileWriter myWriter = new FileWriter("src/SPARQL_Benchmarks/Vadalog Translation of Benchmark Queries/" + schema + ".txt");) {

                for (String query : queries) {
                    try {
                        String parsedQuery = sparqlTranslator.parseQuery(query);
                        parsedQueries.add(parsedQuery);
                        unparsedQueries.add(query);
                        myWriter.write("% Query " + i + ":\n");
                        myWriter.write("@include(\"RDF Triples\").\n" +
                                "@include(\"Auxiliary Predicates\").\n");
                        myWriter.write(parsedQuery);
                        myWriter.write("@include(\"RDF Triples\").\n" +
                                "@output(\"ans1\").\n\n");
                        i++;
                    } catch (ParseException e) {
                        errors.put(query, e.getMessage());
                        myWriter.write("Query " + i + " contains currently not supported features.\n\n");
                    }
                    System.out.println("Query " + i + " has been translated to SparqLog.");
                }
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }
        }
    }
}
