#!/bin/bash

query=$1
data=$2
engine=$3
ordered=$4


echo -e "(executing sparql using $engine)"
sp_res_csv="results/sparql_results.csv"
if [[ $engine == "rdflib" ]]; then
    python3 sparql.py -query $query -data $data > $sp_res_csv
elif [[ $engine == "jena" ]]; then
    java -jar sparql.jar -n3 $data -query $query > $sp_res_csv
else
    echo -e "unknown engine: $engine"
    exit 1
fi

echo -e "(executing N3 queries)"
n3_res_nt0="results/spin3_results_init.nt"
n3_res_csv="results/spin3_results.csv"
# (get rdf output)
./run_spin3_forward.sh $query $data false false  true $n3_res_nt0
# (convert rdf output to csv)
eye $n3_res_nt0 --nope ../../auxiliary-files/csv-convert.n3 --strings > $n3_res_csv 2>/dev/null

extra=""
if [[ $ordered == "true" ]]; then
    extra="--ordered"
    echo -e "(comparing ordered results)"
else
    echo -e "(comparing non-ordered results)"
fi

sp_res_nt="results/sparql_results.nt"
python3 resCSV2NT.py $sp_res_csv $extra > $sp_res_nt

n3_res_nt="results/spin3_results.nt"
python3 resCSV2NT.py $n3_res_csv $extra > $n3_res_nt

python3 NTCompare.py $sp_res_nt $n3_res_nt