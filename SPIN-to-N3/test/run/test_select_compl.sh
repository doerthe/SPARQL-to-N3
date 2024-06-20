#!/bin/bash

name=$1
category=$2
query=$3
data=$4
norm=$5

n3_res_nt="results/spin3_results.nt"
n3_res_csv="results/spin3_results.csv"

# (get rdf output)
./run_spin3.sh $query $data false $n3_res_nt false

# (convert rdf output to csv)
eye $n3_res_nt --nope ../../auxiliary-files/csv-convert.n3 --strings > $n3_res_csv 2>/dev/null

python3 compl_check.py --label="$name" --category="$category" --query="$query" --data="$data" --actual="$n3_res_csv" --norm="$norm"