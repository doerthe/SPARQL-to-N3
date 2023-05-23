import argparse
from rdflib import Graph
from rdflib.plugins.sparql import prepareQuery, processUpdate

parser = argparse.ArgumentParser(description='Execute a SPARQL query against a Turtle data file')
parser.add_argument('-query', type=str, required=True, help='Path to the SPARQL query file')
parser.add_argument('-data', type=str, required=True, help='Path to the Turtle data file')
args = parser.parse_args()

data_graph = Graph()
with open(args.data, 'r') as f:
    data_graph.parse(f, format='turtle')

with open(args.query, 'r') as f:
    query_str = f.read()

query = prepareQuery(query_str)

result = data_graph.query(query)

print(result.serialize(format='csv').decode('utf-8'))
