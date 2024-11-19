import sys, os, argparse, subprocess, logging
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

def get_category(path):
    cmps = os.path.normpath(path).split(os.sep)
    return cmps[-2]

def to_path(el):
    return str(el)[len("file://"):]

def get_logger(path):
    logpath = f'non-compl/{get_category(path)}'
    os.makedirs(logpath, exist_ok=True)
    logpath += "/output.log"
    
    logger = logging.getLogger(__name__)
    logging.basicConfig(filename=logpath, encoding='utf-8', level=logging.INFO)
    logging.getLogger().addHandler(logging.StreamHandler(sys.stdout))
    
    return logger

def run_manifest(path, test, check_compl, engine):
    total_num = 0; noncompl_num = 0
    global logger; logger = get_logger(path)
    
    logger.info(f">> loading manifest: {get_name(path)} <<")
    g = Graph()
    g.parse(path, format='turtle')

    for mf in g.subjects(RDF.type, MF.Manifest):
        # manifest files
        lst = g.value(mf, MF.include)
        if lst is not None:
            for el in Collection(g=g, list=lst):
                path = str(el)
                run_manifest(path, test, check_compl, engine)
        # test entries
        lst = g.value(mf, MF.entries)
        if lst is not None:
            for el in Collection(g=g, list=lst):
                if test is not None:
                    name = str(g.value(el, MF.name))
                    if name != test: continue
                is_compl = run_test(g, el, check_compl, engine)
                if not is_compl: noncompl_num += 1
                total_num += 1
    
    print(f"# total: {total_num}; # non-compliant: {noncompl_num}")

def run_test(g, test, compl, engine):   
    # if (g.value(test, RDF.type) != MF.QueryEvaluationTest):
    #     return True
    
    name = str(g.value(test, MF.name))
    action = g.value(test, MF.action)
    query = to_path(g.value(action, QT.query))
    data = to_path(g.value(action, QT.data) if g.value(action, QT.data) is not None else g.value(action, QT.graphData))
    ordered = str(g.value(action, QT.ordered))
    
    category = get_category(query)
    logger.info(f">> running test: {name}")
    logger.info(f"(query: {get_name(query)}, data: {data})")
    if compl:
        result = g.value(test, MF.result)
        if result is not None:
            cmd = ['./test_select_compl.sh', name, category, query, data, to_path(result)]
            process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, error = [ b.decode('UTF-8') for b in process.communicate() ]
            logger.info(out)
            if error.strip() != "": logger.error(error)
            return ("non compliant" not in out)
        else:
            logger.info("no normative results found")
    else:
        subprocess.run(['./test_select.sh', query, data, engine, ordered])
    logger.info("")
    
    return True

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