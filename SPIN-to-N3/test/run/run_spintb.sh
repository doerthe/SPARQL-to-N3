#!/bin/bash

query=$1
data=$2
verbose=$3
result_file=$4

mkdir -p results
mkdir -p tmp

spin_file="tmp/query.spin"
if [[ $verbose == "true" ]]; then
    echo -e "> getting spin <"
fi
time_gen_spin=$( TIMEFORMAT="%R"; { time { java -jar sparql2spin.jar -sparql $query -multi > $spin_file; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

if [[ -z $result_file ]]; then
    result_file="tmp/results.n3"
fi
if [[ $verbose == "true" ]]; then
    echo -e "\n> executing SPIN <"
fi
# rely on internal java timing
time_exec_spin=$( java -jar spin.jar -spin $spin_file -data $data -out $result_file )
if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi
echo -e "\ngenerate spin: $time_gen_spin\n$time_exec_spin"