#!/bin/bash

data=$1

mkdir -p tmp

nt_file=$data
if [[ ! "${data}" =~ \.nt$ ]]; then
    nt_file="tmp/ntriples.nt"
    echo -e "> getting n-triples data <"
    time_gen_nt=$( TIMEFORMAT="%R"; { time { java -jar turtle2nt.jar -turtle $data  > $nt_file; } } 2>&1 )
    echo -e "(stored at $nt_file)"
fi
echo -e "> preprocessing n-triples <"
start=$(gdate +%s%N)
sed -i'' -e 's|<http://www.w3.org/1999/02/22-rdf-syntax-ns#first>|<http://www.w3.org/1999/02/22-rdf-syntax-ns#f1rst>|g' $nt_file
sed -i'' -e 's|<http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>|<http://www.w3.org/1999/02/22-rdf-syntax-ns#r3st>|g' $nt_file
end=$(gdate +%s%N)
time_preproc=$(bc -l <<< "scale = 2; ($end-$start)/1000000000")

echo -e "\ngenerate nt: $time_gen_nt s\npreproc: $time_preproc s"