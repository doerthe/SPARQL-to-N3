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
    start=$(gdate +%s%N)
    sed -i'' -e 's|<http://www.w3.org/1999/02/22-rdf-syntax-ns#first>|<http://www.w3.org/1999/02/22-rdf-syntax-ns#f1rst>|g' $nt_file
    sed -i'' -e 's|<http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>|<http://www.w3.org/1999/02/22-rdf-syntax-ns#r3st>|g' $nt_file
    end=$(gdate +%s%N)
    time_preproc=$(bc -l <<< "scale = 2; ($end-$start)/1000000000")
fi

spin_file="tmp/query.spin"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting spin <"
fi
# java -jar sparql2spin.jar -sparql $query  > $spin_file
time_gen_spin=$( TIMEFORMAT="%R"; { time { java -jar sparql2spin.jar -sparql $query  > $spin_file; } } 2>&1 )
if [[ $verbose == "true" ]]; then
    echo -e "(stored at $spin_file)"
fi

n3_file="tmp/n3query.n3"
n3_stderr="tmp/n3query-output.txt"
if [[ $verbose == "true" ]]; then
    echo -e "\n> getting n3 rules <"
fi
# eye $spin_file ../../auxiliary-files/aux.n3 --query ../../queries/query_general.n3 --nope --quantify https://eyereasoner.github.io/.well-known/genid/ > $n3_file
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

start=$(gdate +%s%N)

if [[ $recursion == "true" ]]; then
    # including query as data (new):
    
    # simply run command
    # eye ../../auxiliary-files/runtime-loops.n3 $n3_file --turtle $nt_file --pass-only-new --nope > $result_file
    # get total time
    # time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime-loops.n3 $n3_file --turtle $nt_file --pass-only-new --nope > $result_file 2>/dev/null; } } 2>&1 )
    # get finegrained time
    echo "eye ../../auxiliary-files/runtime-loops.n3 $n3_file --turtle $nt_file --pass-only-new --nope"
    error=$( { eye ../../auxiliary-files/runtime-loops.n3 $n3_file --turtle $nt_file --pass-only-new --nope > $result_file; } 2>&1 )
else
    # not including query as data (before):

    # simply run command
    # eye ../../auxiliary-files/runtime-loops.n3 --turtle $nt_file --query $n3_file --nope > $result_file
    # get total time
    # time_exec_n3=$( TIMEFORMAT="%R"; { time { eye ../../auxiliary-files/runtime-loops.n3 --turtle $nt_file --query $n3_file --nope > $result_file 2>/dev/null; } } 2>&1 )
    # get finegrained time
    error=$( { eye ../../auxiliary-files/runtime-loops.n3 --turtle $nt_file --query $n3_file --nope > $result_file; } 2>&1 )
fi

end=$(gdate +%s%N)
time_exec_total=$(bc -l <<< "scale = 2; ($end-$start)/1000000000")

if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi

time_rx='.*starting [^ ]+ \[msec cputime\] ([^ ]+) \[msec walltime\].*networking [^ ]+ \[msec cputime\] ([^ ]+) \[msec walltime\].*reasoning [^ ]+ \[msec cputime\] ([^ ]+) \[msec walltime\]'
[[ $error =~ $time_rx ]]
run_strt_time=${BASH_REMATCH[1]}
run_netw_time=${BASH_REMATCH[2]}
run_reas_time=${BASH_REMATCH[3]}

run_strt_time=$(bc -l <<< "scale = 2; $run_strt_time/1000")
run_netw_time=$(bc -l <<< "scale = 2; $run_netw_time/1000")
run_reas_time=$(bc -l <<< "scale = 2; $run_reas_time/1000")

# get total time
# echo -e "$time_gen_spin,$time_gen_n3,$time_exec_total"
# get finegrained time
if [[ $verbose == "true" ]]; then
    echo -e "\ntime_gen_spin,time_gen_n3,run_strt_time,run_netw_time,run_reas_time,time_exec_total"
fi

echo -e "$time_gen_spin,$time_gen_n3,$run_strt_time,$run_netw_time,$run_reas_time,$time_exec_total"

if [[ $verbose == "true" ]]; then
    if [[ $preproc == "true" ]]; then
        echo -e "\ngenerate nt: $time_gen_nt s\npreproc: $time_preproc s"
    fi
    echo -e "\ngenerate spin: $time_gen_spin s\ngenerate n3: $time_gen_n3 s\nexec n3: $time_exec_total s"
fi