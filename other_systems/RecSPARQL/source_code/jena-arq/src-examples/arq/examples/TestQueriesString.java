package arq.examples;

public class TestQueriesString {

	// Easiest Query
	public static String QUERY_1 = "PREFIX : <http://example.org/> " + 
			"SELECT * WHERE { " + 
			"  ?p :has_type :person . " + 
			"  OPTIONAL { " + 
			"    ?p :has_mail ?c " + 
			"  } " + 
			"} ORDER BY ?p ?c";

	// Query with BGP + Optional
	public static String QUERY_2 = "PREFIX : <http://example.org/> " + 
			"SELECT * WHERE { " + 
			"  ?p :has_type :person . " + 
			"  ?p :has_name ?n" + 
			"  OPTIONAL { " + 
			"    ?p :has_pet ?m . " + 
			"    OPTIONAL { " + 
			"      ?m :has_race ?r " + 
			"    } " + 
			"  } " + 
			"} ORDER BY ?p ?n ?m ?r";

	// Two BGP
	public static String QUERY_3 = "PREFIX : <http://example.org/> " + 
			"SELECT * WHERE { " + 
			"  ?p :has_type :person . " + 
			"  ?p :has_name ?n . " + 
			"  ?p :has_pet ?m " + 
			"  OPTIONAL { " + 
			"    ?m :has_race ?r . " + 
			"    ?m :has_name ?n2 . " +
			"    ?r :has_subrace ?r2 " + 
			"  } " + 
			"} ORDER BY ?p ?n ?m ?r ?n2 ?r2";

	// Deeper tree
	public static String QUERY_4 = "PREFIX : <http://example.org/> " + 
			"SELECT * WHERE { " + 
			"  ?p :has_type :person . " + 
			"  ?p :has_name ?n . " + 
			"  OPTIONAL { " + 
			"    ?p :has_mail ?c " + 
			"  } . " + 
			"  OPTIONAL { " + 
			"    ?p :has_pet ?m . " + 
			"    ?m :has_name ?n2 . " + 
			"    OPTIONAL { " + 
			"      ?m :has_race ?r " + 
			"    } " + 
			"  } " + 
			"} ORDER BY ?p ?n ?c ?m ?n2 ?r";

	// Same tree, one more OPT
	public static String QUERY_5 = "PREFIX : <http://example.org/> " + 
			"SELECT * WHERE { " + 
			"  ?p :has_type :person . " + 
			"  ?p :has_name ?n . " + 
			"  OPTIONAL { " + 
			"    ?p :has_mail ?c " + 
			"  } . " + 
			"  OPTIONAL { " + 
			"    ?p :has_address ?a " + 
			"  } . " +
			"  OPTIONAL { " + 
			"    ?p :has_pet ?m . " + 
			"    ?m :has_name ?n2 . " + 
			"    OPTIONAL { " + 
			"      ?m :has_race ?r " + 
			"    } " + 
			"  } " + 
			"} ORDER BY ?p ?n ?c ?a ?m ?n2 ?r";

	// Deepest Tree
	public static String QUERY_6 = "PREFIX : <http://example.org/> " + 
			"SELECT * WHERE { " + 
			"  ?p :has_type :person . " + 
			"  ?p :has_name ?n . " + 
			"  OPTIONAL { " + 
			"    ?p :has_mail ?c " + 
			"  } . " + 
			"  OPTIONAL { " + 
			"    ?p :has_address ?a " + 
			"  } . " + 
			"  OPTIONAL { " + 
			"    ?p :has_pet ?m . " + 
			"    ?m :has_name ?n2 . " + 
			"    OPTIONAL { " + 
			"      ?m :has_race ?r . " + 
			"      OPTIONAL { " + 
			"        ?r :has_subrace ?r2 " + 
			"      } " + 
			"    } " + 
			"  } " + 
			"} ORDER BY ?p ?n ?c ?a ?m ?n2 ?r ?r2";

}
