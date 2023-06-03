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
./test_case.sh <query> <data> <engine> <ordered>
```
Where `<query>` is the path to the query test file, `<data>` is the path to the data test file, `<engine>` is the SPARQL engine to compare results with (`rdflib` or `jena`), and `[--ordered]` (optional) indicates whether result ordering should be considered in the comparison (default is no).

For instance:
```
./test_case.sh ../cases/ARQ/GroupBy/group-03.rq ../cases/ARQ/GroupBy/data-1.ttl jena
```
Will run the listed test and compare results with `jena` where result ordering is not retained.