package Translation;

import static Translation.MyUtils.MyUtils.getNodeLabel;

import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.Writer;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.StmtIterator;

public class RDFDataTranslator {

	public void translateRDFData(String dataPath, String destPath, String graphName, boolean shortHand)
			throws Exception {
		FileWriter myWriter = new FileWriter(destPath);

		translateRDFData(dataPath, myWriter, graphName, shortHand);
	}

	public void translateRDFData(String dataPath, Writer myWriter, String graphName, boolean shortHand)
			throws Exception {
		String graph = graphName;
		String tableSchema = "(subject VARCHAR(500), subjectDType VARCHAR(500), subjectLTag VARCHAR(5), predicate VARCHAR(500), predicateDType VARCHAR(500), predicateLTag VARCHAR(5), object VARCHAR(5000), objectDType VARCHAR(500), objectLTag VARCHAR(5), graph VARCHAR(200))";
		String tableSchemaShort = "(subject, subjectDType, subjectLTag, predicate, predicateDType, predicateLTag, object, objectDType, objectLTag, graph)";

		Model model = ModelFactory.createDefaultModel();
		model.read(new FileInputStream(dataPath), "", "TTL");

//		try (Reader data = new FileReader(dataPath);) {
////            RDFParser.create().source(data).lang(Lang.NTRIPLES).parse(model);
////			RDFParser.create().source(data).lang(Lang.N3).parse(model);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

		// list the statements in the Model
		StmtIterator iter = model.listStatements();

		while (iter.hasNext()) {
			org.apache.jena.rdf.model.Statement stmt = iter.nextStatement(); // get next statement
//			System.out.println(stmt);

			translateData(stmt, myWriter, graph, shortHand);
		}

		myWriter.flush();
		myWriter.close();
	}

	private void translateData(org.apache.jena.rdf.model.Statement stmt, Writer myWriter, String graph,
			boolean shortHand) throws Exception {

		MyNode subjectNode = getNodeLabel(stmt.getSubject().asNode(), false); // get the subject
		String subjectLabel = subjectNode.getLabel().replace("\n", "").replace("\r", "").replace("\"", "");

		MyNode predicateNode = getNodeLabel(stmt.getPredicate().asNode(), false); // get the predicate
		String predicateLabel = predicateNode.getLabel().replace("\n", "").replace("\r", "").replace("\"", "");

		MyNode objectNode = getNodeLabel(stmt.getObject().asNode(), false); // get the object
		String objectLabel = objectNode.getLabel().replace("\n", "").replace("\r", "").replace("\"", "");

		if (shortHand) {
			myWriter.write(subjectLabel + ";" + subjectNode.getDatatype() + ";" + subjectNode.getLanguageTag() + ";"
					+ predicateLabel + ";" + predicateNode.getDatatype() + ";" + predicateNode.getLanguageTag() + ";"
					+ objectLabel + ";" + objectNode.getDatatype() + ";" + objectNode.getLanguageTag() + ";" + graph
					+ "\n");

		} else {
			myWriter.write(String.format(
					"triple(\"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\").\n",
					subjectLabel, subjectNode.getDatatype(), subjectNode.getLanguageTag(), predicateLabel,
					predicateNode.getDatatype(), predicateNode.getLanguageTag(), objectLabel, objectNode.getDatatype(),
					objectNode.getLanguageTag(), graph));
		}
	}

	public static void main(String[] args) throws Exception {
		RDFDataTranslator rdt = new RDFDataTranslator();

		// - quick tests

		rdt.translateRDFData("src/main/resources/bacon.nt", new PrintWriter(System.out), "default", false);

		// - recsparql tests

//		String srcPath = "/Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/";
//		String destPath = "src/main/resources/recSPARQL/vadalog/data/";
//
//		rdt.translateRDFData(srcPath + "yagoFacts.nt", destPath + "yagoFacts.txt", "default", false);

		// - sparqlog tests

//		String srcPath = "src/main/resources/SPARQL_Benchmarks/";
//		destPath= "src/main/resources/SPARQL_Benchmarks/Vadalog Translation of Benchmark Datasets/";

//        // Translate the BeSeppi dataset
//        rdt.translateRDFData("BeSeppi/dataset/BeSEPPIgraph.nt", destPath+ "beseppi.txt", "default", false);
//
//        // Translate the SWDF dataset
//        rdt.translateRDFData(srcPath + "Feasible/dataset/preprocessed_UTF8_dataset.nt", destPath+ "swdfmygraph.txt", "<http://localhost:3030/VADALOG/data/MyGraph>", false);
//        rdt.translateRDFData(srcPath + "Feasible/dataset/preprocessed_UTF8_dataset.nt", destPath+ "swdfmygraph.txt", "default", false);
//
//
//        // Translate the P2Bench dataset
//        rdt.translateRDFData(srcPath + "SP2bench/generator/bin/dataset/50k_dataset.n3", destPath+ "sp2bench50k.txt", "default", false);
////            rdt.translateRDFData(srcPath + "SP2bench/generator/bin/dataset/50k_dataset.n3", destPath+ "prop_path_sp2bench.txt", "default", false);
//        rdt.translateRDFData(srcPath + "SP2bench/generator/bin/dataset/50k_ontology_dataset.n3", destPath+ "ontology_sp2bench.txt", "default", false);
	}
}
