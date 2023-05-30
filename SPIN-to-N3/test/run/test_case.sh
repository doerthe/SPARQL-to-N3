#!/bin/bash

query=$1
data=$2
engine=$3

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
n3_res_csv="results/n3q_results.csv"
./sparql2n3.sh $query $data > $n3_res_csv

echo -e "(comparing results)"
sp_res_nt="results/sparql_results.nt"
python3 resCSV2NT.py $sp_res_csv > $sp_res_nt

n3_res_nt="results/n3q_results.nt"
python3 resCSV2NT.py $n3_res_csv > $n3_res_nt

python3 NTCompare.py $sp_res_nt $n3_res_nt