from rdflib import Graph, compare
import time

path = "SPARQL-to-N3/SPIN-to-N3/test/canonical/"
for file in [ "test1.ttl", "test2.ttl", "test3.ttl" ]:
    print("file:", file)

    graph1 = Graph()
    graph1.parse(f"{path}{file}", format='ttl')

    start = time.time()

    iso1 = compare.to_isomorphic(graph1)
    iso2 = compare.to_isomorphic(graph1)
    equal = (iso1 == iso2)

    end = time.time()
    print("isomorphic:", (end-start))

    start = time.time()

    compare.to_canonical_graph(graph1)

    end = time.time()
    print("canonical:", (end-start))

    print()