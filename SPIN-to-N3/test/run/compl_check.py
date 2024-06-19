import io, os, rdflib, argparse, csv_diff, shutil
import rdflib.plugins
import rdflib.plugins.sparql
import rdflib.plugins.sparql.algebra

def query_type(query):
    parsed = rdflib.plugins.sparql.parser.parseQuery(open(query))
    for expr in parsed:
        if expr.name.endswith("Query"):
            return expr.name
    
    return None

def check(name, query_path, data_path, norm_path, actual_path):
    qtype = query_type(query_path)
    if qtype != 'SelectQuery':
        print(f"skipping non-select query ({qtype})")
        return
    
    norm_results = rdflib.query.Result.parse(norm_path)
    
    norm_name = norm_path[norm_path.rfind("/")+1:norm_path.rfind(".")]
    if not norm_path.endswith(".csv"):
        # buffer = io.BytesIO() # (doesn't work with compare lib)
        folder = actual_path[0:actual_path.rfind("/")+1]
        norm_path = folder + norm_name + ".csv"
        norm_results.serialize(format='csv', destination=norm_path)

    norm_results_csv = csv_diff.load_csv(open(norm_path))
    actual_results_csv = csv_diff.load_csv(open(actual_path))
    if len(actual_results_csv) == 0:
        diff = "missing rows: " + str([ row for row in norm_results_csv.values() ])
        compl = False
    else:
        diff = csv_diff.compare(norm_results_csv, actual_results_csv)
        compl = all(len(values) == 0 for values in diff.values())
    
    if compl:
        print("compliant!")
    else:
        print("non compliant :-("); print(diff);
        fldr = f"./non-compl/{name}/"; os.makedirs(fldr, exist_ok=True)
        shutil.copyfile(query_path, f'{fldr}/{os.path.split(query_path)[1]}')
        shutil.copyfile(data_path, f'{fldr}/{os.path.split(data_path)[1]}')
        shutil.copyfile(norm_path, f'{fldr}/{norm_name}-norm.csv')
        shutil.copyfile(actual_path, f'{fldr}/{norm_name}-actual.csv')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Check compliance.")
    parser.add_argument('--label', help="The label of the test case.", required=True)
    parser.add_argument('--query', help="The SPARQL query.", required=True)
    parser.add_argument('--data', help="Path to the data file.", required=True)
    parser.add_argument('--norm', help="Path to the normative results file.", required=True)
    parser.add_argument('--actual', help="Path to the actual results file.", required=True)
    
    args = parser.parse_args()
    name = args.label
    query_path = args.query
    data_path = args.data
    norm_path = args.norm
    actual_path = args.actual
    
    check(name, query_path, data_path, norm_path, actual_path)