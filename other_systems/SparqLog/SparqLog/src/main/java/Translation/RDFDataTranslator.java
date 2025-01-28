package Translation;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.StmtIterator;
import org.apache.jena.riot.Lang;
import org.apache.jena.riot.RDFParser;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.text.ParseException;

import static Translation.MyUtils.MyUtils.getNodeLabel;

public class RDFDataTranslator {

    public void translateRDFData(String dataPath, String schemaName, String graphName) throws ParseException {
        String graph = graphName;
        String tableSchema = "(subject VARCHAR(500), subjectDType VARCHAR(500), subjectLTag VARCHAR(5), predicate VARCHAR(500), predicateDType VARCHAR(500), predicateLTag VARCHAR(5), object VARCHAR(5000), objectDType VARCHAR(500), objectLTag VARCHAR(5), graph VARCHAR(200))";
        String tableSchemaShort = "(subject, subjectDType, subjectLTag, predicate, predicateDType, predicateLTag, object, objectDType, objectLTag, graph)";

        Model model = ModelFactory.createDefaultModel();

        try (Reader data = new FileReader(dataPath);) {
//            RDFParser.create().source(data).lang(Lang.NTRIPLES).parse(model);
            RDFParser.create().source(data).lang(Lang.N3).parse(model);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // list the statements in the Model
        StmtIterator iter = model.listStatements();

        try (FileWriter myWriter = new FileWriter("src/SPARQL_Benchmarks/Vadalog Translation of Benchmark Datasets/" + schemaName + ".txt");) {

            while (iter.hasNext()) {
                org.apache.jena.rdf.model.Statement stmt = iter.nextStatement();  // get next statement
                MyNode subjectNode = getNodeLabel(stmt.getSubject().asNode(), false);     // get the subject
                MyNode predicateNode = getNodeLabel(stmt.getPredicate().asNode(), false);   // get the predicate
                MyNode objectNode = getNodeLabel(stmt.getObject().asNode(), false);      // get the object

                myWriter.write(subjectNode.getLabel().replace("\n", "").replace("\r", "") + ";" + subjectNode.getDatatype() + ";" +
                        subjectNode.getLanguageTag() + ";" + predicateNode.getLabel().replace("\n", "").replace("\r", "") + ";" +
                        predicateNode.getDatatype() + ";" + predicateNode.getLanguageTag() + ";" +
                        objectNode.getLabel().replace("\n", "").replace("\r", "") + ";" + objectNode.getDatatype() + ";" +
                        objectNode.getLanguageTag() + ";" + graph + "\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
            return;
        }
    }

    public static void main(String[] args) {
        RDFDataTranslator rdt = new RDFDataTranslator();
        try {
            // Translate the BeSeppi dataset
            rdt.translateRDFData("src/SPARQL_Benchmarks/BeSeppi/dataset/BeSEPPIgraph.nt", "beseppi", "default");

            // Translate the SWDF dataset
            rdt.translateRDFData("src/SPARQL_Benchmarks/Feasible/dataset/preprocessed_UTF8_dataset.nt", "swdfmygraph", "<http://localhost:3030/VADALOG/data/MyGraph>");
            rdt.translateRDFData("src/SPARQL_Benchmarks/Feasible/dataset/preprocessed_UTF8_dataset.nt", "swdfmygraph", "default");


            // Translate the P2Bench dataset
            rdt.translateRDFData("src/SPARQL_Benchmarks/SP2bench/generator/bin/dataset/50k_dataset.n3", "sp2bench50k", "default");
//            rdt.translateRDFData("src/SPARQL_Benchmarks/SP2bench/generator/bin/dataset/50k_dataset.n3", "prop_path_sp2bench", "default");
            rdt.translateRDFData("src/SPARQL_Benchmarks/SP2bench/generator/bin/dataset/50k_ontology_dataset.n3", "ontology_sp2bench", "default");
        } catch (ParseException e) {
            e.printStackTrace();
            return;
        }
    }
}
