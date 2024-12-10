package org.apache.jena.sparql.lang;

public class MyRecursiveNodeFactory extends RecursiveNodeFactory {

	@Override
	public IRecursiveNode createRecursiveNode() {
		return new MyRecursiveNode();
	}
}
