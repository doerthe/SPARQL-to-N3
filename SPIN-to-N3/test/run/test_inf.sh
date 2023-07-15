#!/bin/bash

sparql=$1
spin=$2
data=$3

time_spintb=0
echo -e "(executing sparql using spin (topbraid))"
sp_res_ttl="results/spintb_inf_results.ttl"
time_spintb=$( ./run_spintb.sh $spin $data false $sp_res_ttl )
echo -e "spintb:\n$time_spintb\n"

time_spin3=0
echo -e "(executing sparql using n3 (eye))"
n3_res_n3="results/spin3_inf_results.ttl"
time_spin3=$( ./run_spin3.sh $sparql $data false $n3_res_n3 )
echo -e "spin3:\n$time_spin3"

python3 NTCompare.py $sp_res_ttl $n3_res_n3 --format2 'n3'