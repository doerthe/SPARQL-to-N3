/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.jena.query;

import org.apache.jena.sparql.lang.RecursiveNodeFactory;
import org.apache.jena.sparql.lang.IRecursiveNode;

import recsparql.ExecRecursive;

/** Place to make QueryExecution objects from Query objects or a string. */

public class MyQueryExecutionFactory extends QueryExecutionFactory {
	protected MyQueryExecutionFactory() {
	}

	// ---------------- Query + Dataset

	/**
	 * Create a QueryExecution to execute over the Dataset.
	 * 
	 * @param query   Query
	 * @param dataset Target of the query
	 * @return QueryExecution
	 */
	static public QueryExecution create(Query query, Dataset dataset) {
		if (query.isRecursive) {
			IRecursiveNode rn = RecursiveNodeFactory.create();
			
			for (int i = 0; i < query.ConstructRecursiveQueries.size(); i++) {
				if (ExecRecursive.RECURSIVE_METHOD.equalsIgnoreCase("MEM-OPT")) {
					rn.execRecQueryOpt(dataset, (query.ConstructRecursiveQueries).get(i),
							(query.ConstructRecursiveQueries).get(i).recursiveURI);
				} else if (ExecRecursive.RECURSIVE_METHOD.equalsIgnoreCase("DISK-OPT")) {
					rn.execRecQueryOptMaterialized(dataset, (query.ConstructRecursiveQueries).get(i),
							(query.ConstructRecursiveQueries).get(i).recursiveURI);
				} else if (ExecRecursive.RECURSIVE_METHOD.equalsIgnoreCase("MEM-OPT-LIMIT")) {
					rn.execRecQueryOptLim(dataset, (query.ConstructRecursiveQueries).get(i),
							(query.ConstructRecursiveQueries).get(i).recursiveURI, ExecRecursive.NUMBER_OF_ITERATIONS);
				} else if (ExecRecursive.RECURSIVE_METHOD.equalsIgnoreCase("DISK-OPT-LIMIT")) {
					rn.execRecQueryOptMaterializedLim(dataset, (query.ConstructRecursiveQueries).get(i),
							(query.ConstructRecursiveQueries).get(i).recursiveURI, ExecRecursive.NUMBER_OF_ITERATIONS);
				} else {
					rn.execRecQueryWithoutUnion(dataset, (query.ConstructRecursiveQueries).get(i),
							(query.ConstructRecursiveQueries).get(i).recursiveURI);
				}

			}

		}
		return make(query, dataset);
	}
}
