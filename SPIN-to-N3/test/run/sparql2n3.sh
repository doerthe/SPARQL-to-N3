#!/bin/bash

query=$1
data=$2
verbose=$3

spin_file="tmp/query.spin"
if [[ $verbose == "true" ]]; then
    echo -e ">> getting spin <<"
fi
$(java -jar sparql2spin.jar -sparql $query -multi > $spin_file)
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

n3_file="tmp/n3query.n3"
if [[ $verbose == "true" ]]; then
    echo -e "\n\n>> getting n3 <<"
fi
eye $spin_file ../../auxiliary-files/aux.n3 \
    --query ../../queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
    > $n3_file 2>/dev/null
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_file)"
fi

result_file="tmp/results.n3"
if [[ $verbose == "true" ]]; then
    echo -e "\n\n>> executing n3 <<"
fi
# TODO add runtime-pp as data input file
eye ../../auxiliary-files/runtime.n3 $data --query $n3_file --nope > $result_file 2>/dev/null
if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi

eye $result_file --nope ../../auxiliary-files/csv-convert.n3 --strings 2>/dev/null