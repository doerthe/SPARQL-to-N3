#!/bin/bash

folder=$1

for entry in "$folder"/*
do
    echo -e ">> $entry <<"
    ./test_case.sh "$entry/query.sparql" "$entry/data.n3"
    printf "\n\n"
done