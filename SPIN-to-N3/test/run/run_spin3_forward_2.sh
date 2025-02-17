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
        java -jar turtle2nt.jar -turtle $data  > $nt_file
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
eye $new_spin_file ../../auxiliary-files/aux_3.n3 --query ../../queries/query_general_3.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_file
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_file)"
fi

n3_run="tmp/runtime.n3"
eye $new_spin_file ../../auxiliary-files/aux_3.n3 --query ../../queries/produce-runtime-rules2.n3 ../../queries/query_general_3.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_run
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_run)"
fi
n3_run_short="tmp/runtime_short.n3"
eye $n3_run --pass-all --nope > $n3_run_short


sed -i'' -e 's|rdf:first|rdf:f1rst|g' $n3_file
sed -i'' -e 's|rdf:rest|rdf:r3st|g' $n3_file
sed -i'' -e 's|rdf:first|rdf:f1rst|g' $n3_run
sed -i'' -e 's|rdf:rest|rdf:r3st|g' $n3_run


if [[ -z $result_file ]]; then
    result_file="tmp/results.n3"
fi
if [[ $verbose == "true" ]]; then
    echo -e "\n> executing n3 <"
fi

if [[ $recursion == "true" ]]; then
simple_query="tmp/simpleQuery.n3"
n3_file_short="tmp/n3query_short.n3"
    eye $n3_file --nope --pass-all > $n3_file_short
    eye $n3_file_short --query ../../queires/makeSimpleQuery.n3 --nope > $simple_query
    # including query as data (new):
    eye ../../auxiliary-files/run.n3 $n3_file_short $n3_run_short --turtle $nt_file --query $simple_query --nope > $result_file
else
    # not including query as data (before):
    eye  ../../auxiliary-files/run.n3 $n3_run_short --turtle $nt_file --query $n3_file --nope > $result_file
fi

if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi

# if [[ $verbose == "true" ]]; then
#     echo -e "\ngenerate nt: $time_gen_nt\ngenerate spin: $time_gen_spin\ngenerate n3: $time_gen_n3\nexec n3: $time_exec_n3"
# fi