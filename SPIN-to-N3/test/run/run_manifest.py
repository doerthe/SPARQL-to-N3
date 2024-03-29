import sys, os, argparse, subprocess
from rdflib import Graph, Literal, URIRef, RDF, Namespace

MF = Namespace("http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#")
QT = Namespace("http://www.w3.org/2001/sw/DataAccess/tests/test-query#")

class Collection:
    def __init__(self, g, list):
        self.g = g
        self.list = list

    def __iter__(self):
        return self

    def __next__(self):
        if self.list == RDF.nil:
            raise StopIteration
        ret = self.g.value(self.list, RDF.first)
        self.list = self.g.value(self.list, RDF.rest)
        return ret;

def get_name(path):
    cmps = os.path.normpath(path).split(os.sep)
    return cmps[-2] + os.sep + cmps[-1]

def to_path(el):
    return str(el)[len("file://"):]

def run_manifest(path, engine):
    print(f">> loading manifest: {get_name(path)}<<")
    g = Graph()
    g.parse(path, format='turtle')

    for mf in g.subjects(RDF.type, MF.Manifest):
        # manifest files
        lst = g.value(mf, MF.include)
        if lst is not None:
            for el in Collection(g=g, list=lst):
                path = str(el)
                run_manifest(path, engine)
        # test entries
        lst = g.value(mf, MF.entries)
        if lst is not None:
            for el in Collection(g=g, list=lst):
                run_test(g, el, engine)

def run_test(g, test, engine):   
    # if (g.value(test, RDF.type) == MF.QueryEvaluationTest):
    name = str(g.value(test, MF.name))
    action = g.value(test, MF.action)
    query = to_path(g.value(action, QT.query))
    data = to_path(g.value(action, QT.data))
    ordered = str(g.value(action, QT.ordered))
    # result = to_path(g.value(test, MF.result))
    
    print(f">> running test: {name}")
    subprocess.run(['./test_select.sh', query, data, engine, ordered])
    print("\n")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Run test manifest.")
    parser.add_argument('--manifest', help="Path to the test manifest file.", required=True)
    parser.add_argument('--engine', help="SPARQL execution engine to compare results to.", choices=["rdflib", "jena"], required=True)
    #parser.add_argument('--ordered', help='Consider result ordering during comparison', action="store_true")

    args = parser.parse_args()
    path = args.manifest
    engine = args.engine

    run_manifest(path, engine)

