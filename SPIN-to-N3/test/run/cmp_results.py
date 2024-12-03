import os, argparse, subprocess

# NOTE assumes that the naming convention in README (result_tmpl) is followed

def cmp_results(query_folder, data_file, result_folder, result_tmpls):
    data_name = data_file[data_file.rindex("/")+1:data_file.rindex(".")]
    
    for query_file in sorted(os.listdir(query_folder)):
        if not query_file.endswith(".sparql"):
            continue
        
        query_name = query_file[0:query_file.rindex(".")]
        
        result_files = [ result_tmpl.format(data_name, query_name) for result_tmpl in result_tmpls ]
        result_metrics = [ get_metrics(result_folder, result_file) for result_file in result_files ]
        
        inconsists = []
        for i in range(0, len(result_metrics)):
            if result_metrics[i] == -1:
                inconsists.append(f"{result_files[i]}: didn't finish")
                continue
            for j in range(i+1, len(result_metrics)):
                if result_metrics[j] == -1:
                    continue                
                elif result_metrics[i] != result_metrics[j]:
                    inconsists.append(f"{result_files[i]}: {result_metrics[i]} <> {result_files[j]}: {result_metrics[j]}")
        
        # print(f"> {query_name}")
        if len(inconsists) > 0:
            print(f"> {query_name}:")
            for inconsist in inconsists:
                print(inconsist)
            print()
            
def get_metrics(result_folder, result_file):
    path = os.path.join(result_folder, result_file)
    if not os.path.exists(path):
        return -1
    
    fd = open(path, 'r')
    results = fd.read()
    fd.close()
    
    # yeah yeah ...
    return results.count("ex:result") + results.count("http://example.org/spin#result")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Run test manifest.")
    parser.add_argument('--query_folder', help="Folder with experiment queries.", required=True)
    parser.add_argument('--data', help="Data file.", required=True)
    parser.add_argument('--result_folder', help="Folder for results.", required=True)
    parser.add_argument('--result_tmpls', type=lambda a: a.split(","), help="Templates for result files to be compared.", required=True)

    args = parser.parse_args()
    query_folder = args.query_folder
    data_file = args.data
    result_folder = args.result_folder
    result_tmpls = args.result_tmpls
    
    cmp_results(query_folder, data_file, result_folder, result_tmpls)