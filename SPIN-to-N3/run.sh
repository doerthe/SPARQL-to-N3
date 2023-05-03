#!/usr/bin/env bash

eye examples/select4.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ > out/result_select4.n3

eye examples/minus-spin.n3 auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ > out/result_minus-spin.n3