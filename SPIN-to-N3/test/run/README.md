To run all tests in a given `manifest` file:
```
python3 run_manifest.py --manifest <manifest> --engine <engine> [--ordered]
```
Where `<manifest>` is the path to the manifest file, `<engine>` is the SPARQL engine to compare results with (`rdflib` or `jena`), and `[--ordered]` (optional) indicates whether result ordering should be considered in the comparison (default is no).

For instance:
```
python3 run_manifest.py --manifest ../cases/ARQ/GroupBy/manifest.ttl --engine rdflib --ordered
```
Will run tests in the listed manifest file and compare results with `rdflib` where result ordering is retained.