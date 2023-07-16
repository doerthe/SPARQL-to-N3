#!/bin/bash

sparql=$1
data=$2

echo -e "- executing sparql using spin (topbraid)"
sp_res_ttl="results/spintb_inf_results.ttl"
spintb_out=$( ./run_spintb.sh $sparql $data true $sp_res_ttl )
echo -e "$spintb_out"

time_spin3=0
echo -e "\n\n- executing sparql using n3 (eye)"
n3_res_n3="results/spin3_inf_results.ttl"
n3_out=$( ./run_spin3.sh $sparql $data true $n3_res_n3 )
echo -e "$n3_out"

# python3 NTCompare.py $sp_res_ttl $n3_res_n3 --format2 'n3'