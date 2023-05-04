#!/usr/bin/env bash

#combined files (to test interaction)
eye examples/construct-2.ttl examples/construct-1.ttl examples/ask-1.ttl examples/union.ttl examples/union_1.ttl auxiliary-files/aux.n3 --nope --query queries/query_general.n3 --quantify http://eyereasoner.github.io/.well-known/genid/ > out/result_all.n3


#select
eye examples/simple_select.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_simple_select.n3
eye examples/select2.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_select2.n3
eye examples/select4.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ > out/result_select4.n3

#construct
eye examples/construct-2.ttl auxiliary-files/aux.n3 --nope --query queries/query_general.n3 --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_construct2.n3
eye examples/construct_blank.ttl auxiliary-files/aux.n3 --nope --query queries/query_general.n3 --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_blank.n3

# union
    #(with construct)
eye examples/union_1.ttl auxiliary-files/aux.n3 --nope --query queries/query_general.n3 --quantify http://eyereasoner.github.io/.well-known/genid/ > out/result_union1.n3
eye examples/union.ttl auxiliary-files/aux.n3 --nope --query queries/query_general.n3 --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_u.n3

#bind
eye examples/bind-concat.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/out_bind-concat.n3


# aggregates
eye examples/select-aggr-5.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/select-aggr-5-rule.n3
eye examples/select-aggr-4.spin auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_select-aggr-4.n3

# not exists
eye examples/not-exists-spin.n3 auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/not-exists-rule.n3

# optional
eye examples/optional_spin.n3 auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eye >out/optional-rule.n3


# minus
eye examples/minus-spin.n3 auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ > out/result_minus-spin.n3
eye examples/minus-2.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_minus2.n3
eye examples/minus-nested.ttl auxiliary-files/aux.n3 --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ >out/result_minus-nested.n3