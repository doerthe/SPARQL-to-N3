#!/bin/bash

query=$1
verbose=$2

mkdir -p results
mkdir -p tmp

spin_file="tmp/query.spin"
new_spin_file="tmp/query_ground.spin"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting spin <"
fi
java -jar sparql2spin.jar -sparql $query  > $spin_file
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

eye $spin_file --nope --pass --no-qvars > $new_spin_file
sed -i'' -e 's|https://eyereasoner.github.io/.well-known/genid/|https://example.org/|g' $new_spin_file

n3_file="tmp/n3query.n3"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting n3 rules <"
fi
eye $new_spin_file ../../auxiliary-files/aux_2.n3 --query ../../queries/query_general_2.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_file
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_file)"
fi

n3_run="tmp/runtime.n3"
eye $new_spin_file ../../auxiliary-files/aux_2.n3 --query ../../queries/produce-runtime-rules.n3 ../../queries/query_general_2.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_run
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_run)"
fi