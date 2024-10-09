package Translation.MyUtils;

import Translation.MyNode;
import org.apache.jena.datatypes.xsd.impl.XSDBaseNumericType;

import org.apache.jena.graph.Node;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MyUtils {
    public static final String LOCAL_PREFIX = "L_"; //local prefix to distinguish variables from literals -> ?p is replaces by L_p!
    public static final String V1_PREFIX = "V1_";
    public static final String V2_PREFIX = "V2_";
    public static final String DataType_PREFIX = "DType_";
    public static final String LanguageTag_PREFIX = "LTag_";
    public static final String BlankNode_PREFIX = "B_";
    public static final String Aggregation_PREFIX = "A_";
    public static final String Integer_TYPE = "\"http://www.w3.org/2001/XMLSchema#integer\"";
    public static final MyNode X = new MyNode("X");
    public static final MyNode Y = new MyNode("Y");
    public static final MyNode W = new MyNode("W");
    public static final MyNode Z = new MyNode("Z");

    public static final String TID = "ID";
    public static final String auxiliaryPredicates =
            "@library(\"reg:\", \"regex\"). \n" +
                    "term(X,XD,XL) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D).\n" +
                    "term(Y,YD,YL) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D).\n" +
                    "term(Z,ZD,ZL) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D).\n" +
                    "\n" +
                    "subjectOrObject(X,XD,XL) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D).\n" +
                    "subjectOrObject(Z,ZD,ZL) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D).\n" +
                    "\n" +
                    "null(\"Null\").\n" +
                    "comp(X,X,X) :- term(X,XD,XL).\n" +
                    "compD(XD,XD,XD) :- term(X,XD,XL).\n" +
                    "compL(XL,XL,XL) :- term(X,XD,XL).\n" +
                    "\n" +
                    "comp(X,Y,X) :- term(X,XD,XL), null(Y).\n" +
                    "compD(XD,YD,XD) :- term(X,XD,XL), null(YD).\n" +
                    "compL(XL,YL,XL) :- term(X,XD,XL), null(YL).\n" +
                    "\n" +
                    "comp(Y,X,X) :- null(Y), term(X,XD,XL).\n" +
                    "compD(YD,XD,XD) :- null(YD), term(X,XD,XL).\n" +
                    "compL(YL,XL,XL) :- null(YL), term(X,XD,XL).\n" +
                    "\n" +
                    "comp(X,X,X) :- null(X).\n" +
                    "compD(X,X,X) :- null(X).\n" +
                    "compL(X,X,X) :- null(X).\n" +
                    "\n" +
                    "named(D) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), D != \"default\".\n" +
                    "\n" +
                    "literal(Z) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), ZD != \"URI\", ZD != \"Blanknode\".\n" +
                    "\n" +
                    "iri(X) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), XD = \"URI\".\n" +
                    "iri(Y) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), YD = \"URI\".\n" +
                    "iri(Z) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), ZD = \"URI\".\n" +
                    "\n" +
                    "bnode(X) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), XD = \"Blanknode\".\n" +
                    "bnode(Y) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), YD = \"Blanknode\".\n" +
                    "bnode(Z) :- triple(X,XD,XL, Y,YD,YL, Z,ZD,ZL, D), ZD = \"Blanknode\".\n" +
                    "\n" +
                    "str(URI, String) :- iri(URI), String = substring(URI, 1, string_length(URI) - 1).\n" +
                    "str(Literal, Literal) :- literal(Literal).\n" +
                    "str(Graph, Graph) :- named(Graph).\n";

    //Removes duplicates
    public static <T> List<T> mergeLists(List<T> list1, List<T> list2) {
        List mergedList = new ArrayList();
        mergedList.addAll(list1);
        mergedList.addAll(list2);
        List<T> uniqueVarNames = new ArrayList();
        uniqueVarNames.addAll(new HashSet<T>(mergedList));

        return uniqueVarNames;
    }

    //Removes duplicates
    public static <T> List<T> intersectLists(List<T> list1, List<T> list2) {

        Set set1 = new HashSet(list1);
        Set set2 = new HashSet(list2);

        set1.retainAll(set2);

        List<T> uniqueVarNames = new ArrayList<T>();
        uniqueVarNames.addAll(set1);

        return uniqueVarNames;
    }

    //Removes duplicates
    public static <T> List<T> removeListFromList(List<T> list1, List<T> list2) {
        List mergedList = new ArrayList();
        mergedList.addAll(list1);
        mergedList.removeAll(list2);
        List<T> uniqueVarNames = new ArrayList();
        uniqueVarNames.addAll(new HashSet<T>(mergedList));

        return uniqueVarNames;
    }

    public static List<MyNode> prefixVars(List<MyNode> vars, String prefix) {
        List<MyNode> result = new ArrayList();
        for (MyNode var : vars) {
            MyNode newVar = new MyNode(var);
            newVar.prefixVarNode(prefix);
            result.add(newVar);
        }
        return result;
    }

    // Replaces LOCAL_PREFIX, if existing
    public static String prefixVar(String varName, String prefix) {
        return prefix + removeLocalPrefix(varName);
    }

    // Replaces LOCAL_PREFIX, if existing
    public static String removeLocalPrefix(String varName) {
        return varName.replace(LOCAL_PREFIX, "");
    }

    public static MyNode getNodeLabel(Node element) throws ParseException {
        return getNodeLabel(element, true);
    }

    public static MyNode getNodeLabel(Node element, Boolean WrapInQuotes) throws ParseException {
        if (element.isVariable()) {
            return new MyNode(element.getName());
        } else if (element.isLiteral()) {
            String value = element.getLiteral().getValue().toString();
            String datatype = element.getLiteralDatatypeURI();
            datatype = WrapInQuotes ? "\"" + datatype + "\"" : datatype;

            if (element.getLiteralDatatype() instanceof XSDBaseNumericType) {
                String languageTag = "";
                languageTag = WrapInQuotes ? ("\"" + languageTag + "\"") : languageTag;
                return new MyNode(value, datatype, languageTag);
            } else {
                String languageTag = element.getLiteralLanguage();
                languageTag = WrapInQuotes ? ("\"" + languageTag + "\"") : languageTag;
                value = WrapInQuotes ? ("\"" + value + "\"") : value;
                return new MyNode(value, datatype, languageTag);
            }
        } else if (element.isURI()) {
            String uri = "<" + element.getURI() + ">";
            uri = WrapInQuotes ? "\"" + uri + "\"" : uri;
            String datatype = "URI";
            datatype = WrapInQuotes ? "\"" + datatype + "\"" : datatype;
            String languageTag = "";
            languageTag = WrapInQuotes ? ("\"" + languageTag + "\"") : languageTag;
            return new MyNode(uri, datatype, languageTag);
        } else if (element.isBlank()) {
            String blankNodeId = element.getBlankNodeLabel();
            blankNodeId = WrapInQuotes ? "\"" + blankNodeId + "\"" : blankNodeId;
            String datatype = "Blanknode";
            datatype = WrapInQuotes ? "\"" + datatype + "\"" : datatype;
            String languageTag = "";
            languageTag = WrapInQuotes ? ("\"" + languageTag + "\"") : languageTag;

            return new MyNode(blankNodeId, datatype, languageTag);
        } else {
            throw new ParseException("MyException -> Node type unknown.", 1);
        }
    }
}
