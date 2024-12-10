import argparse
from rdflib import Graph, URIRef

def convert_to_ntriples(input_file, output_file):
    # Initialize RDF graph
    g = Graph()

    # Read input file
    with open(input_file, 'r') as file:
        for line in file:
            # Parse each line into subject, predicate suffix, and object
            subject, predicate_suffix, obj = line.strip().split()
            # Create RDF URIs
            subject_uri = URIRef(f"http://example.org/gmark/{subject}")
            predicate_uri = URIRef(f"http://example.org/gmark/p{predicate_suffix}")
            object_uri = URIRef(f"http://example.org/gmark/{obj}")
            # Add triple to the graph
            g.add((subject_uri, predicate_uri, object_uri))

    # Serialize graph to N-Triples and write to output file
    g.serialize(destination=output_file, format="nt")
    print(f"Data has been successfully converted to N-Triples and saved to {output_file}")

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description="Convert data to N-Triples format")
    parser.add_argument("input_file", help="Path to the input file")
    parser.add_argument("output_file", help="Path to the output N-Triples file")

    # Parse arguments
    args = parser.parse_args()

    # Convert data to N-Triples
    convert_to_ntriples(args.input_file, args.output_file)

if __name__ == "__main__":
    main()

