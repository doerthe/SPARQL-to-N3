#!/bin/bash

# regex:
#\{([\s\S\r]*?)\} => \{([\s\S\r]*?)\}
#->
#{$2} => {$2}

n3_file=$1
n3_run=$2
nt_file=$3
n3_query=$4
result_file=$5

eye ../../auxiliary-files/optional.n3 $n3_file $n3_run --turtle $nt_file --query $n3_query --nope > $result_file