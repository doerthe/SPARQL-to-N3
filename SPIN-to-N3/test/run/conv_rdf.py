from rdflib import Graph
import argparse

def convert(input, output, format):
    g = Graph()
    g.parse(input)

    g.serialize(destination=output,format=format)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert between RDF formats.")
    parser.add_argument('--input', help="Input path.", required=True)
    parser.add_argument('--output', help="Output path.", required=False)
    parser.add_argument('--format', help="Target format.", required=True)
    
    args = parser.parse_args()
    input = args.input
    output = args.output if args.output is not None else args.input
    format = args.format
    
    convert(input, output, format)