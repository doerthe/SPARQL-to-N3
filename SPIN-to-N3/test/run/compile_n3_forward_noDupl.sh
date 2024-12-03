#!/bin/bash

query=$1
verbose=$3

mkdir -p results
mkdir -p tmp

spin_file="tmp/query.spin"
new_spin_file="tmp/query_ground.spin"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting spin <"
fi
# java -jar sparql2spin.jar -sparql $query  > $spin_file
time_gen_spin=$( TIMEFORMAT="%R"; { time { java -jar sparql2spin.jar -sparql $query  > $spin_file; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

# eye $spin_file --nope --pass --no-qvars > $new_spin_file
time_gen_spin2=$( TIMEFORMAT="%R"; { time { eye $spin_file --nope --pass --no-qvars > $new_spin_file 2>/dev/null; } } 2>&1 )
sed -i'' -e 's|https://eyereasoner.github.io/.well-known/genid/|https://example.org/|g' $new_spin_file

n3_file="tmp/n3query.n3"
n3_file_new="tmp/n3OptimisedQuery.n3"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting n3 rules <"
fi
# eye $new_spin_file ../../auxiliary-files/aux_2.n3 --query ../../queries/query_general_2.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_file
time_gen_n3=$( TIMEFORMAT="%R"; { time { eye $new_spin_file ../../auxiliary-files/aux_2.n3 --query ../../queries/query_general_2.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_file 2>/dev/null; } } 2>&1 )
eye $n3_file --nope --pass-all > $n3_file_new
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_file)"
fi

n3_run="tmp/runtime.n3"
n3_run_new="tmp/runtimeNoDuplicates.n3"
# eye $new_spin_file ../../auxiliary-files/aux_2.n3 --query ../../queries/produce-runtime-rules.n3 ../../queries/query_general_2.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_run
time_n3_run=$( TIMEFORMAT="%R"; { time { eye $new_spin_file ../../auxiliary-files/aux_2.n3 --query ../../queries/produce-runtime-rules.n3 ../../queries/query_general_2.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_run 2>/dev/null; } } 2>&1 )
eye $n3_run --nope --pass-all > $n3_run_new
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $n3_run)"
fi