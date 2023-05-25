import sys
import argparse
from rdflib import Graph, compare


def dump_nt_sorted(g):
    for l in sorted(g.serialize(format='nt').splitlines()):
        if l:
            print(l)


def compare_rdf_graphs(file1, file2):
    graph1 = Graph()
    graph1.parse(file1, format='turtle')

    graph2 = Graph()
    graph2.parse(file2, format='turtle')
    iso1 = compare.to_isomorphic(graph1)
    iso2 = compare.to_isomorphic(graph2)

    if iso1 == iso2:
        print("Results are identical")
    else:
        print("Results are different")

        in_both, in_first, in_second = compare.graph_diff(iso1, iso2)

        print("\nThe same triples in both files:")
        dump_nt_sorted(in_both)
        print(f"\nDifferent in {file1}:")
        dump_nt_sorted(in_first)
        print(f"\nDifferent in {file2}:")
        dump_nt_sorted(in_second)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Compare two RDF Turtle files.")
    parser.add_argument('file1', help="Path to the first RDF Turtle file.")
    parser.add_argument('file2', help="Path to the second RDF Turtle file.")

    args = parser.parse_args()
    file1 = args.file1
    file2 = args.file2

    compare_rdf_graphs(file1, file2)

