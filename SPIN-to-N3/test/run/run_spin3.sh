#!/bin/bash

query=$1
data=$2
verbose=$3
recursion=$4
preproc=$5
result_file=$6

mkdir -p results
mkdir -p tmp

nt_file=$data
if [[ $preproc == "true" ]]; then
    
    if [[ ! "${data}" =~ \.nt$ ]]; then
        nt_file="tmp/ntriples.nt"
        if [[ $verbose == "true" ]]; then
            echo -e "> getting n-triples data <"
        fi
        time_gen_nt=$( TIMEFORMAT="%R"; { time { java -jar turtle2nt.jar -turtle $data  > $nt_file; } } 2>&1 )
        if [[ $verbose == "true" ]]; then
            echo -e "(stored at $nt_file)"
        fi
    fi
    if [[ $verbose == "true" ]]; then
        echo -e "> preprocessing n-triples <"
    fi
    sed -i'' -e 's|<http://www.w3.org/1999/02/22-rdf-syntax-ns#first>|<http://www.w3.org/1999/02/22-rdf-syntax-ns#f1rst>|g' $nt_file
    sed -i'' -e 's|<http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>|<http://www.w3.org/1999/02/22-rdf-syntax-ns#r3st>|g' $nt_file
fi

spin_file="tmp/query.spin"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting spin <"
fi
time_gen_spin=$( TIMEFORMAT="%R"; { time { java -jar sparql2spin.jar -sparql $query  > $spin_file; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

n3_file="tmp/n3query.n3"
n3_stderr="tmp/n3query-output.txt"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting n3 rules <"
fi
time_gen_n3=$( TIMEFORMAT="%R"; { time { eye $spin_file ../../auxiliary-files/aux.n3 --query ../../queries/query_general.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_file 2>$n3_stderr; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_file)"
fi

sed -i'' -e 's|rdf:first|rdf:f1rst|g' $n3_file
sed -i'' -e 's|rdf:rest|rdf:r3st|g' $n3_file

if [[ -z $result_file ]]; then
    result_file="tmp/results.n3"
fi
if [[ $verbose == "true" ]]; then
    echo -e "\n> executing n3 <"
fi

if [[ $recursion == "true" ]]; then
    # including query as data (new):
    time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime.n3 $n3_file --turtle $nt_file --pass-only-new --nope > $result_file 2>/dev/null; } } 2>&1 )
else
    # not including query as data (before):
    time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime.n3 --turtle $nt_file --query $n3_file --nope > $result_file 2>/dev/null; } } 2>&1 )
fi

if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi

if [[ $verbose == "true" ]]; then
    echo -e "\ngenerate nt: $time_gen_nt\ngenerate spin: $time_gen_spin\ngenerate n3: $time_gen_n3\nexec n3: $time_exec_n3"
fi