package Translation;

import java.io.FileWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Run {

	public static void main(String[] args) throws Exception {
		String inPath = args[0];
		String outPath = args[1];
		
		String query = new String(Files.readAllBytes(Paths.get(inPath)));
		
		StringWriter w = new StringWriter();
		
		SPARQLTranslator sparqlTranslator = new SPARQLTranslator(new SkolemFunctionGenerator());
		TranslateQueries.insertPreamble(w);
		TranslateQueries.translateQuery(sparqlTranslator, query, w);
				
		w.flush();
		
		String vadalog = w.toString();
		vadalog = vadalog.replaceAll("ID\\d,", "");
		vadalog = vadalog.replaceAll(", ID\\d = .*\\.", ".");
		vadalog = vadalog.replaceAll("(\\(|,)(\\s*)([A-Z])", "$1$2?$3");
		
		Writer w2 = new FileWriter(outPath);
		w2.write(vadalog);
		w2.close();
	}
}
