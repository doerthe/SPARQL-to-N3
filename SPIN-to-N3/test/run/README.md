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
./run_spin3.sh <sparql> <data> <verbose> <result_file>
```

Directly run the `spin.jar` file (_SPIN (TopBraid)_) - this can be useful for debugging (the `verbose` option prints the number of rules and inferences):
```
java -jar spin.jar -spin <spin> -data <data> -verbose
```

To convert a particular file with SPARQL queries to SPIN:
```
java -jar sparql2spin.jar -sparql <sparql> -multi > <spin>
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
python3 run_manifest.py --manifest ../cases/ARQ/GroupBy/manifest.ttl --engine rdflib --ordered
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