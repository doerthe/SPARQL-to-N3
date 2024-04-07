import sys
import argparse
from rdflib import Graph, compare


def dump_nt_sorted(g):
    for l in sorted(g.serialize(format='nt').splitlines()):
        if l:
            print(l)


def compare_rdf_graphs(file1, format1, file2, format2):
    graph1 = Graph()
    graph1.parse(file1, format=format1)

    graph2 = Graph()
    graph2.parse(file2, format=format2)
    iso1 = compare.to_isomorphic(graph1)
    iso2 = compare.to_isomorphic(graph2)

    if iso1 == iso2:
        print("Results are identical")
    else:
        print("Results are different")
        in_both, in_first, in_second = compare.graph_diff(graph1, graph2)

        print("\nThe same triples in both files:")
        dump_nt_sorted(in_both)
        print(f"\nDifferent in {file1}:")
        dump_nt_sorted(in_first)
        print(f"\nDifferent in {file2}:")
        dump_nt_sorted(in_second)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Compare two RDF Turtle files.")
    parser.add_argument('file1', help="Path to the first RDF file.")
    parser.add_argument('--format1', help="Format of the first RDF file.", required=False, default='turtle')
    parser.add_argument('file2', help="Path to the second RDF file.")
    parser.add_argument('--format2', help="Format of the second RDF file.", required=False, default='turtle')

    args = parser.parse_args()
    file1 = args.file1
    format1 = args.format1
    file2 = args.file2
    format2 = args.format2

    compare_rdf_graphs(file1, format1, file2, format2)

