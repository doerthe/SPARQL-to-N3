#!/bin/bash

sparql=$1
data=$2

echo -e "- executing sparql using spin (topbraid)"
sp_res_ttl="results/spintb_inf_results.ttl"
./run_spintb.sh $sparql $data true $sp_res_ttl

echo -e "\n\n- producing N3 with first-rest pairs"
data2="results/data_first-rest.ttl"
eye $data --pass --nope --rdf-list-output >$data2


 echo -e "\n\n- executing sparql using n3 (eye)"
 n3_res_n3="results/spin3_inf_results.ttl"
 ./run_spin3.sh $sparql $data2 true $n3_res_n3

  echo -e "\n\n- Producing RDF-only output for SIN3 (eye)"
 RDF_res_n3="results/spin3_inf_results_rdf.ttl"
eye  $n3_res_n3 --query comparison/rdf-filter.n3  --nope > $RDF_res_n3
sed -i'' -e 's|rdf:f7rst|rdf:first|g'  $RDF_res_n3
sed -i'' -e 's|rdf:r4st|rdf:rest|g'  $RDF_res_n3

sp_res_ttl2="results/spintb_inf_results_no_duplicates.ttl"
eye --nope $sp_res_ttl --pass --rdf-list-output > $sp_res_ttl2

 echo -e "\n"
 python3 NTCompare.py $sp_res_ttl2 $RDF_res_n3 --format2 'n3'
