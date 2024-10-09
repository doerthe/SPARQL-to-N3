package org.apache.jena.sparql.lang;

public abstract class RecursiveNodeFactory {

	private static RecursiveNodeFactory factory;

	public static void set(RecursiveNodeFactory factory) {
		RecursiveNodeFactory.factory = factory;
	}
	
	public static IRecursiveNode create() {
		return factory.createRecursiveNode();
	}

	public abstract IRecursiveNode createRecursiveNode();
}
