#!/bin/bash

sparql=$1
data=$2

echo -e "- executing sparql using spin (topbraid)"
sp_res_ttl="results/spintb_inf_results.ttl"
./run_spintb.sh $sparql $data true $sp_res_ttl

# echo -e "\n\n- executing sparql using n3 (eye)"
# n3_res_n3="results/spin3_inf_results.ttl"
# ./run_spin3.sh $sparql $data true $n3_res_n3

# echo -e "\n"
# python3 NTCompare.py $sp_res_ttl $n3_res_n3 --format2 'n3'