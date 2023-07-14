#!/bin/bash

spin=$1
data=$2
verbose=$3

result_file="tmp/results.n3"
if [[ $verbose == "true" ]]; then
    echo -e ">> executing SPIN <<"
fi
time $(java -jar spin.jar -spin $spin -data $data > $result_file)
if [[ $verbose == "true" ]]; then
    echo -e "(stored results at $result_file)"
fi