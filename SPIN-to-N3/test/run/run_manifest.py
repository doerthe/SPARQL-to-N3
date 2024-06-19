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

def run_manifest(path, test, compl, engine):
    print(f">> loading manifest: {get_name(path)}<<")
    g = Graph()
    g.parse(path, format='turtle')

    for mf in g.subjects(RDF.type, MF.Manifest):
        # manifest files
        lst = g.value(mf, MF.include)
        if lst is not None:
            for el in Collection(g=g, list=lst):
                path = str(el)
                run_manifest(path, test, compl, engine)
        # test entries
        lst = g.value(mf, MF.entries)
        if lst is not None:
            for el in Collection(g=g, list=lst):
                if test is not None:
                    name = str(g.value(el, MF.name))
                    if name != test: continue
                run_test(g, el, compl, engine)

def rel_path(path):
    return path[path.rfind("/", 0, path.rfind("/")-1)+1:]

def run_test(g, test, compl, engine):   
    if (g.value(test, RDF.type) != MF.QueryEvaluationTest):
        return
    
    name = str(g.value(test, MF.name))
    action = g.value(test, MF.action)
    query = to_path(g.value(action, QT.query))
    data = to_path(g.value(action, QT.data))
    ordered = str(g.value(action, QT.ordered))
    
    print(f">> running test: {name}")
    print(f"(query: {rel_path(query)}, data: {rel_path(data)})")
    if compl:
        result = g.value(test, MF.result)
        if result is not None:
            subprocess.run(['./test_select_compl.sh', name, query, data, to_path(result)])
        else:
            print("no normative results found")
    else:
        subprocess.run(['./test_select.sh', query, data, engine, ordered])
    print()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Run test manifest.")
    parser.add_argument('--manifest', help="Path to the test manifest file.", required=True)
    parser.add_argument('--test', help="Label of test to be run", required=False)
    parser.add_argument('--compliance', help="Check compliance with result files from manifest", required=False, action=argparse.BooleanOptionalAction)
    parser.add_argument('--engine', help="SPARQL execution engine to compare results to.", choices=["rdflib", "jena"], required=False)
    #parser.add_argument('--ordered', help='Consider result ordering during comparison', action="store_true")

    args = parser.parse_args()
    path = args.manifest
    test = args.test
    compl = args.compliance
    engine = args.engine
    
    if compl is None and engine is None:
        print("error: require '--engine' if not checking compliance")
    elif engine is not None and compl is not None:
        print("error: either provide '--engine' or check for '--compliance'")
    else:
        run_manifest(path, test, compl, engine)

