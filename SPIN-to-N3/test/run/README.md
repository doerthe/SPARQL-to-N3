# Inferencing

Run _spin3_ on `<sparql>` and _SPIN (TopBraid)_ on `<spin>` given `<data>` and compare the inference results.
```
./test_inf.sh <sparql> <data>
```

For instance:
```
./test_inf.sh ../cases/zika/zika-queries.sparql ../cases/zika/zika-data.n3
```

**Note**: SPIN (TopBraid) will loop infinitely on the default version of `zika-queries.sparql` as a blank node is being inferred by one of the queries. 
For now, you can comment out the relevant SPARQL query for SPIN (TopBraid).

Run only _SPIN (TopBraid)_:
```
./run_spintb.sh <spin> <data> <verbose> <result_file>
```

Run only _spin3_:
```
./run_spin3.sh <sparql> <data> <verbose> <recursion> <preprocess> (<result_file>)
```
`<preprocess>`: whether `<data>` needs to be preprocessed first (convert first/rest pairs into harmless properties)

For instance:
```
./run_spin3.sh ../cases/zika/zika-queries.sparql ../cases/zika/zika-data.n3 true true true results/zika-queries.nt
./run_spin3.sh ../cases/prp_path/1/query.sparql ../cases/prp_path/1/data.n3 true false false
```
(by default, the results will appear under `tmp/results.n3`)

Directly run the `spin.jar` file (_SPIN (TopBraid)_) - this can be useful for debugging (the `verbose` option prints the number of rules and inferences):
```
java -jar spin.jar -spin <spin> -data <data> -verbose
```

To convert a particular file with SPARQL queries to SPIN:
```
java -jar sparql2spin.jar -sparql <sparql> -multi <spin>
```

# Experiments

Currently, SiN3 also involves preprocessing the data (converting into n-triples, and then replacing first/rest pairs).
This step only has to take place once.

To pre-process files:  
__Note__: create a copy of the file first as it will be updated by the script.  
__Note__: if turtle has to be translated first, the result will show up under `tmp/ntriples.nt`

(attributes: data)  

- **yago**  
```
./preproc_data.sh /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/yagoFacts.nt
```

- **lmdb**  
```
./preproc_data.sh /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/linkedmdb-latest-dump-fixed.nt
```

- **gmark**  
```
./preproc_data.sh /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/GMark/graph3.nt
```


To run recSPARQL tests:  
__Note__: you can still do pre-processing as part of the run, by setting the attribute to true (same note as above applies).
(attributes: query, data, verbose, recursion, preproc, result_file)

- **yago**  
```
./run_spin3.sh /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/queries/yago1.sparql /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/yagoFacts.nt true true false results/yago1.nt
```

- **lmdb**  
```
./run_spin3.sh /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/queries/lmdb1.sparql /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/linkedmdb-latest-dump-preproc.nt true true false results/lmdb1.nt
```

- **gmark**  
```
./run_spin3.sh /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/queries/gmark1.sparql /Users/wvw/git/n3/sparql2n3/SPARQL-to-N3/other_systems/RecSPARQL/datasets/GMark/graph3.nt true false false results/gmark1.nt
```

For now, to try out a recursive property path query with loops:
```
./run_spin3_loops.sh ../cases/custom/query.sparql ../cases/custom/data.n3 true true true
```


# SELECT queries

## Run manifest file

To run all tests in a given `manifest` file:
```
python3 run_manifest.py --manifest <manifest> --engine <engine> [--ordered]
```
Where `<manifest>` is the path to the manifest file, `<engine>` is the SPARQL engine to compare results with (`rdflib` or `jena`), and `[--ordered]` (optional) indicates whether result ordering should be considered in the comparison (default is no). The `manifest` file can be recursive, i.e., keep links to other `manifest` files.

For instance:
```
python3 run_manifest.py --manifest ../cases/ARQ/GroupBy/manifest.ttl --engine rdflib
```
Will run all tests in the listed `manifest` file and compare results with `rdflib` where result ordering is retained.


## Run individual test

To run an individual test:
```
./test_select.sh <query> <data> <engine> <ordered>
```
Where `<query>` is the path to the query test file, `<data>` is the path to the data test file, `<engine>` is the SPARQL engine to compare results with (`rdflib` or `jena`), and `[--ordered]` (optional) indicates whether result ordering should be considered in the comparison (default is no).

For instance:
```
./test_select.sh ../cases/ARQ/GroupBy/group-03.rq ../cases/ARQ/GroupBy/data-1.ttl jena
```
Will run the listed test and compare results with `jena` where result ordering is not retained.


## Run individual query on engine

Using Jena:
```
java -jar sparql.jar -n3 <data> -query <query>
```

For instance:
```
java -jar sparql.jar -n3 ../cases/test/data.n3 -query ../cases/test/optional.sparql
```

# forward-chaining alternatives
For all the scirpts mentioned above which use Sin3, we there exist new forward chaing versions which are most likely more performant. These are:

run_spin3_forward.sh
run_manifest_fw.py
test_select_fw.sh   

These can be used as described above.
