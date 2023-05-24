#!/bin/bash

query=$1
data=$2


echo -e "(executing sparql)"
sp_res_csv="results/sparql_results.csv"
python3 sparql.py -query $query -data $data > $sp_res_csv


echo -e "(executing N3 queries)"
n3_res_csv="results/n3q_results.csv"
./sparql2n3.sh $query $data > $n3_res_csv


echo -e "(comparing results)"
sp_res_nt="results/sparql_results.nt"
python3 resCSV2NT.py $sp_res_csv > $sp_res_nt

n3_res_nt="results/n3q_results.nt"
python3 resCSV2NT.py $n3_res_csv > $n3_res_nt

python3 NTCompare.py $sp_res_nt $n3_res_nt