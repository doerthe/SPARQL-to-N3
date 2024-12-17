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
./run_spin3.sh ../cases/zika/zika-queries-all.sparql ../cases/zika/zika-data.n3 true true true results/zika.nt
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
./preproc_data.sh ../../../other_systems/RecSPARQL/datasets/yagoFacts.nt
```

- **lmdb**  
```
./preproc_data.sh ../../../other_systems/RecSPARQL/datasets/linkedmdb-latest-dump-fixed.nt
```

- **gmark**  
```
./preproc_data.sh ../../../other_systems/RecSPARQL/datasets/GMark/graph3.nt
```


To run recSPARQL tests:  
__Note__: you can still do pre-processing as part of the run, by setting the attribute to true (same note as above applies).
(attributes: query, data, verbose, recursion, preproc, result_file)

- **yago**  
```
./run_spin3.sh ../../../other_systems/RecSPARQL/queries/sparql/yago/yago1.sparql ../../../other_systems/RecSPARQL/datasets/yagoFacts.nt true true false results/yago1.nt
```

- **lmdb**  
```
./run_spin3.sh ../../../other_systems/RecSPARQL/queries/sparql/lmdb/lmdb1.sparql ../../../other_systems/RecSPARQL/datasets/linkedmdb-latest-dump-fixed.nt true true false results/lmdb1.nt
```

- **gmark**  
```
./run_spin3_loops.sh ../../../other_systems/RecSPARQL/queries/sparql/gmark/gmark1.sparql ../../../other_systems/RecSPARQL/datasets/GMark/graph1-subset2.nt true false false results/gmark1-subset2.nt

./run_spin3_loops.sh ../../../other_systems/gmark-dominik/50/query-1.sparql ../../../other_systems/gmark-dominik/50.nt true false false results/gmark_50-q1.nt

`./run_spin3_forward.sh ../../../other_systems/RecSPARQL/queries/gmark/gmark1.sparql ../../../other_systems/RecSPARQL/datasets/GMark/graph1-subset2.nt true false false results/gmark1-subset2-forward.nt

./run_spin3_forward.sh ../../../other_systems/gmark-dominik/50/query-40.sparql ../../../other_systems/gmark-dominik/50.nt true false false results/gmark_50-q40-forward.nt

./run_spin3_forward-noDuplicates.sh ../../../other_systems/gmark-dominik/50/query-40.sparql ../../../other_systems/gmark-dominik/50.nt true false false results/gmark_50-q40-forward-noDupl.nt

nmo ./tmp/sin3-gmark1_subset2.nmo --export-dir results --overwrite-results

nmo ./tmp/gmark_50-query-1.nmo --export-dir results --overwrite-results
```

- **zika**

default vs. forward
```
./run_spin3_loops.sh ../cases/zika/zika-queries-all.sparql ../cases/zika/gen/full/gen1.n3 true true true results/zika-eye.n3

./run_spin3_forward.sh ../cases/zika/zika-queries-all.sparql ../cases/zika/gen/full/gen100.n3 true true true results/zika-eye-forward-sepquery.n3

./run_spin3_forward.sh ../cases/zika/zika-queries-all-red.sparql ../cases/zika/gen/red/gen1000.n3 true true true results/zika-eye-forward-sepquery-red.n3
```

forward vs. forward-noDuplicates:
```
./run_spin3_forward.sh ../cases/zika/zika-queries-all.sparql ../cases/zika/gen/full/gen100.n3 true true true results/zika-eye-forward.n3

./run_spin3_forward-noDuplicates.sh ../cases/zika/zika-queries-all.sparql ../cases/zika/gen/full/gen100.n3 true true true results/zika-eye-forward-noDupl.n3
```

try out different queries:
```
./query_spin3_forward.sh results/zika-query/n3query.n3 results/zika-query/runtime.n3 results/zika-query/ntriples.nt results/zika-query/n3query-query.n3 results/zika-eye-forward-query.n3
```

- **owl2 rl**
```
./run_spin3_loops.sh ../cases/owl2rl/owl2rl-reduced.sparql /Users/wvw/git/ontotools/kg-bioportal/data/raw/ontologies/IFAR/5/V3.0FAOntology.rdf-xml.owl true true true results/owl2rl/IFAR.nt

./run_spin3_forward-noDuplicates.sh ../cases/owl2rl/owl2rl-reduced.sparql /Users/wvw/git/ontotools/kg-bioportal/data/raw/ontologies/IFAR/5/V3.0FAOntology.rdf-xml.owl true true true results/owl2rl/IFAR.nt
```

- **deep taxonomy (dt)**
```
# (stop before execution finishes; it will run them in forward way)
./run_spin3_loops.sh ../cases/dt/test-rules.sparql ../cases/dt/test-dl-100000.n3 true true false results/dt-eye.n3 
./run_spin3_loops.sh ../cases/zika/zika-queries-all.sparql ../cases/zika/gen/full/gen100_0pt5.n3 true true false results/zika-eye.n3 

# manually change from forward to backward rule
# \{([\s\S\r]+?)\} => \{([\s\S\r]+?)\}
# ->
# { $2 } <= { $1 }

eye --turtle ../cases/dt/test-dl-100000.n3 --query tmp/n3query.n3 --nope
```

- **SNOMED**
```
eye ../cases/snomed/test-rules.n3 --turtle ../cases/snomed/test-sn-ind.ttl ../cases/snomed/ontology-2024-12-16_15-03-55--subclass.ttl --query ../cases/snomed/test-sn-query.n3 --nope
```

## Automate experiments

### SiN3 - eye

- **gmark**
```
python run_exp.py --query ../../../other_systems/gmark-dominik/50 --data ../../../other_systems/gmark-dominik/50.nt --script run_spin3_loops.sh --recursive false --result_folder results --result_tmpl "gmark_{0}-{1}.n3" --times_file "times/gmark_50-eye.csv"

python run_exp.py --query ../../../other_systems/gmark-dominik/50 --data ../../../other_systems/gmark-dominik/50.nt --script run_spin3_forward.sh --recursive false --result_folder results --result_tmpl "gmark_{0}-{1}-forward.n3" --times_file "times/gmark_50-eye-forward.csv"

python run_exp.py --query ../../../other_systems/gmark-dominik/50 --data ../../../other_systems/gmark-dominik/50.nt --script run_spin3_forward-noDuplicates.sh --recursive false --result_folder results --result_tmpl "gmark_{0}-{1}-forward-noDupl-resultList.n3" --times_file "times/gmark_50-eye-forward-noDupl-resultList.csv"

python run_exp.py --query ../../../other_systems/gmark-dominik/100 --data ../../../other_systems/gmark-dominik/100.nt --script run_spin3_forward-noDuplicates.sh --recursive false --result_folder results --result_tmpl "gmark_{0}-{1}-forward-noDupl-resultList.n3" --times_file "times/gmark_100-eye-forward-noDupl-resultList.csv"

python run_exp.py --query ../../../other_systems/gmark-dominik/500 --data ../../../other_systems/gmark-dominik/500.nt --script run_spin3_forward-noDuplicates.sh --recursive false --result_folder results --result_tmpl "gmark_{0}-{1}-forward-noDupl-resultList.n3" --times_file "times/gmark_500-eye-forward-noDupl-resultList.csv"
```

- **lmdb**
```
python run_exp.py --query ../../../other_systems/RecSPARQL/queries/sparql/lmdb --data ../../../other_systems/RecSPARQL/datasets/lmdb.nt --script run_spin3_forward-noDuplicates.sh --recursive true --result_folder results --result_tmpl "lmdb_{0}-{1}.n3" --times_file "times/lmdb-eye-sepquery.csv"
```

- **yago**
```
python run_exp.py --query ../../../other_systems/RecSPARQL/queries/sparql/yago --data ../../../other_systems/RecSPARQL/datasets/yagoFacts.nt --script run_spin3_forward-noDuplicates.sh --recursive true --result_folder results --result_tmpl "yago_{0}-{1}.n3" --times_file "times/yago-eye-sepquery.csv"
```

- **zika**
```
python run_exp.py --query ../cases/zika/zika-queries-all.sparql --data ../cases/zika/zika-data.n3 --script run_spin3_forward-noDuplicates.sh --recursive true --result_folder results --result_tmpl "zika.n3" --times_file "times/zika-eye-sepquery.csv"
```

### SiN3 - nmo
See `n3/n32nmo/N32MO` class for **nmo** experiments.


### SPIN:
see `SPIN/spinrdf/SPINExperiment` class for **SPIN** experiments.


### RecSPARQL:
See `RecSPARQL/Experiment` class for **RecSPARQL** experiments.


## Compare results:
```
python cmp_results.py --query_folder ../../../other_systems/gmark-dominik/50 --data ../../../other_systems/gmark-dominik/50.nt --result_folder results/gmark_50 --result_tmpls "gmark_{0}-{1}-forward-noDupl-resultList.n3","gmark_{0}-{1}.nmo" > cmp_results.txt

python cmp_results.py --query_folder ../../../other_systems/gmark-dominik/100 --data ../../../other_systems/gmark-dominik/100.nt --result_folder results/gmark_100 --result_tmpls "gmark_{0}-{1}-forward-noDupl-resultList.n3","gmark_{0}-{1}.nmo" > cmp_results.txt
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
