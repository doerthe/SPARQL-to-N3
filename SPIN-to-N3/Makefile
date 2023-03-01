help:
	@echo "  make example1"

example1:
	eye examples/construct-1.ttl examples/ask-1.ttl auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
		> out/example1.n3

example2:
	eye examples/select2.ttl auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
		> out/select2.n3

	eye examples/select2_data.n3 out/select2.n3 --nope --pass-only-new 

aggr:
	eye examples/select-aggr-1.n3 auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
		> out/aggr-1.n3

	eye auxiliary-files/aux-aggr.n3 \
	    examples/select-aggr-1_data.n3 out/aggr-1.n3 --nope --pass-only-new 

aggr2:
	eye examples/select-aggr-2.n3 auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
		> out/aggr-2.n3

	eye auxiliary-files/aux-aggr.n3 \
	    examples/select-aggr-2_data.n3 out/aggr-2.n3 --nope --pass-only-new

aggr3:
	eye examples/select-aggr-3.n3 auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
		> out/aggr-3.n3

	eye auxiliary-files/aux-aggr.n3 \
	    examples/select-aggr-3_data.n3 out/aggr-3.n3 --nope --pass-only-new 
