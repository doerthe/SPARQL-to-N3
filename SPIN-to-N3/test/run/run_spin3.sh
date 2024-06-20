#!/bin/bash

query=$1
data=$2
verbose=$3
result_file=$4
recursion=$5

mkdir -p results
mkdir -p tmp

spin_file="tmp/query.spin"
if [[ $verbose == "true" ]]; then
    echo -e "> getting spin <"
fi
time_gen_spin=$( TIMEFORMAT="%R"; { time { java -jar sparql2spin.jar -sparql $query  > $spin_file; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

n3_file="tmp/n3query.n3"
n3_stderr="tmp/n3query-output.txt"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting n3 <"
fi
time_gen_n3=$( TIMEFORMAT="%R"; { time { eye $spin_file ../../auxiliary-files/aux.n3 --query ../../queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ > $n3_file 2>$n3_stderr; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_file)"
fi
sed -i'' -e 's|rdf:first|rdf:f7rst|g'  $n3_file
sed -i'' -e 's|rdf:rest|rdf:r4st|g'  $n3_file

sed -i'' -e 's|rdf:first|rdf:f7rst|g'  $data
sed -i'' -e 's|rdf:rest|rdf:r4st|g'  $data


if [[ -z $result_file ]]; then
    result_file="tmp/results.n3"
fi
if [[ $verbose == "true" ]]; then
    echo -e "\n> executing n3 <"
fi

if [[ $recursion == "true" ]];
    then
    # including query as data ( new ):
    time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime.n3 $data $n3_file --pass-only-new --nope   > $result_file 2>/dev/null; } } 2>&1 )
    else
    # not including query as data (before):
    time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime.n3 $data --query $n3_file --nope > $result_file 2>/dev/null; } } 2>&1 )
fi

if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi

if [[ $verbose == "true" ]]; then
    echo -e "\ngenerate spin: $time_gen_spin\ngenerate n3: $time_gen_n3\nexec n3: $time_exec_n3"
fi

sed -i'' -e 's|rdf:f7rst|rdf:first|g'  $n3_file
sed -i'' -e 's|rdf:r4st|rdf:rest|g'  $n3_file

sed -i'' -e 's|rdf:f7rst|rdf:first|g'  $data
sed -i'' -e 's|rdf:r4st|rdf:rest|g'  $data