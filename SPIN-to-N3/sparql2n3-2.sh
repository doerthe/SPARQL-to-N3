#!/bin/bash

conv_query=$1
query=$2
data=$3

spin_file="out/tmp.spin"
echo -e ">> getting spin <<"
$(java -jar sparql2spin.jar -sparql $query > $spin_file)
echo -e "(stored at $spin_file)"

n3_file="out/tmp.n3"
echo -e "\n\n>> getting n3 <<"
eye out/tmp.spin auxiliary-files/aux.n3 \
    --query $conv_query --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
    > $n3_file
echo -e "(stored at $n3_file)"

echo -e "\n\n>> executing n3 <<"
eye auxiliary-files/aux-aggr.n3 \
    $data out/tmp.n3 --nope --pass-only-new