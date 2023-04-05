#!/bin/bash

query=$1
data=$2

spin_file="out/tmp.spin"
echo -e ">> getting spin <<"
$(java -jar sparql2spin.jar -sparql $query > $spin_file)
echo -e "(stored at $spin_file)"

n3_file="out/tmp.n3"
echo -e "\n\n>> getting n3 <<"
eye out/tmp.spin auxiliary-files/aux.n3 auxiliary-files/aux-pp.n3 \
    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
    > $n3_file
echo -e "(stored at $n3_file)"

echo -e "\n\n>> executing n3 <<"
eye auxiliary-files/runtime-pp.n3 \
    $data --query out/tmp.n3 --nope