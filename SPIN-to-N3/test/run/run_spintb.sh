#!/bin/bash

spin=$1
data=$2
verbose=$3
result_file=$4

mkdir -p results
mkdir -p tmp

if [[ -z $result_file ]]; then
    result_file="tmp/results.n3"
fi
if [[ $verbose == "true" ]]; then
    echo -e ">> executing SPIN <<"
fi
# rely on internal java timing
time_exec_spin=$( java -jar spin.jar -spin $spin -data $data -out $result_file )
if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi
echo -e "$time_exec_spin"