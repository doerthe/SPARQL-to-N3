#!/bin/bash

query=$1
data=$2

spin_file="tmp/query.spin"
#echo -e ">> getting spin <<"
$(java -jar sparql2spin.jar -sparql $query > $spin_file)
#echo -e "(stored at $spin_file)"

n3_file="tmp/n3query.n3"
#echo -e "\n\n>> getting n3 <<"
# TODO add aux-pp as data input file
eye $spin_file ../auxiliary-files/aux.n3 \
    --query ../queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
    > $n3_file 2>/dev/null
#echo -e "(stored at $n3_file)"

result_file="tmp/results.n3"
#echo -e "\n\n>> executing n3 <<"
# TODO add runtime-pp as data input file
eye $data --query $n3_file --nope > $result_file 2>/dev/null

eye $result_file --nope ../auxiliary-files/csv-convert.n3 --strings 2>/dev/null