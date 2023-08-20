#!/bin/bash

sparql=$1
query=$2
data=$3
verbose=$4
result_file=$5

gen_spin () {
    local time=$( TIMEFORMAT="%R"; { time { java -jar sparql2spin.jar -sparql $1 -multi > $2; } } 2>&1 )
    # echo "java -jar sparql2`spin.jar -sparql $1 -multi"
    if [[ $verbose == "true" ]]; then
        echo -e "(stored at $2)"
    fi
    local __resultVar=$3
    eval $__resultVar="$time"
}

gen_n3() {
    local time=$( TIMEFORMAT="%R"; { time { eye $1 ../../auxiliary-files/aux.n3 --query ../../queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ > $2 2>/dev/null; } } 2>&1 )
    # echo "eye $1 ../../auxiliary-files/aux.n3 --query ../../queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/"
    if [[ $verbose == "true" ]]; then
        echo -e "(stored at $2)"
    fi
    local __resultVar=$3
    eval $__resultVar="$time"
}

mkdir -p results
mkdir -p tmp

if [[ $verbose == "true" ]]; then
    echo -e "> getting spin <"
fi

sparql_spin_file="tmp/sparql.spin"
gen_spin $sparql $sparql_spin_file time_sparql_spin

if [[ "$sparql" != "$query" ]]; then
    query_spin_file="tmp/query.spin"
    gen_spin $query $query_spin_file time_query_spin
else
    query_spin_file=$sparql_spin_file
fi

if [[ $verbose == "true" ]]; then
    echo -e "\n> getting n3 <"
fi
sparql_n3_file="tmp/sparql.n3"
gen_n3 $sparql_spin_file $sparql_n3_file time_sparql_n3

if [[ "$sparql" != "$query" ]]; then
    query_n3_file="tmp/query.n3"
    gen_n3 $query_spin_file $query_n3_file time_query_n3
else
    query_n3_file=$sparql_n3_file
fi

if [[ -z $result_file ]]; then
    result_file="tmp/results.n3"
fi
if [[ $verbose == "true" ]]; then
    echo -e "\n> executing n3 <"
fi
time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime.n3 $data $sparql_n3_file --query $query_n3_file --nope > $result_file 2>/dev/null; } } 2>&1 )
echo "eye ../../auxiliary-files/runtime.n3 $data $sparql_n3_file --query $query_n3_file --nope"
# not including query as data:
#time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime.n3 $data --query $sparql_n3_file --nope > $result_file 2>/dev/null; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi
echo -e "\ngenerate spin: $time_sparql_spin, $time_query_spin\ngenerate n3: $time_sparql_n3, $time_query_n3\nexec n3: $time_exec_n3"