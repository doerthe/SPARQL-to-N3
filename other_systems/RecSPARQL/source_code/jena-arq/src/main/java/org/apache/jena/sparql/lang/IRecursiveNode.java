package org.apache.jena.sparql.lang;

import java.util.ArrayList;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;

public interface IRecursiveNode {

	public void init(String queryString);

	public ArrayList<String> getInnerQueries();

	public ArrayList<String[]> getQueriesConstruct();

	public String getPrefix();

	public String getOuterQuery();

	public void execRecQueryWithoutUnion(Dataset ds, Query recursiveQuery, String recursiveURI);

	public void execRecQueryOpt(Dataset ds, Query recursiveQuery, String recursiveURI);

	public void execRecQueryOptMaterialized(Dataset ds, Query recursiveQuery, String recursiveURI);

	public void execRecQueryOptLim(Dataset ds, Query recursiveQuery, String recursiveURI, int limit);

	public void execRecQueryOptMaterializedLim(Dataset ds, Query recursiveQuery, String recursiveURI, int limit);

	public Query[] parseOpt(Query inQuery);
}
