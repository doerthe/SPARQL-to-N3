help:
	@echo "  make example1"

example1:
	eye examples/construct-1.ttl examples/ask-1.ttl auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
		> out/example1.n3

aggr:
	eye examples/select-aggr-1.n3 examples/select-aggr-1_data.n3 auxiliary-files/aux.n3 \
	    --query queries/query_general.n3 --nope --quantify http://eyereasoner.github.io/.well-known/genid/ \
