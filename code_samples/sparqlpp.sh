#!/bin/bash

query=$1
# data=$2

spin_file="tmp.spin"
echo -e ">> getting spin <<"
$(java -jar ../SPIN-to-N3/sparql2spin.jar -sparql $query > $spin_file)
echo -e "(stored at $spin_file)"

# n3_file="out/tmp.n3"
echo -e "\n\n>> getting n3 <<"
eye $spin_file property_paths.n3 --nope --pass-only-new --quantify http://eyereasoner.github.io/.well-known/genid/
    # > $n3_file
# echo -e "(stored at $n3_file)"

# echo -e "\n\n>> executing n3 <<"
# eye auxiliary-files/aux-aggr.n3 \
#     $data out/tmp.n3 --nope --pass-only-new