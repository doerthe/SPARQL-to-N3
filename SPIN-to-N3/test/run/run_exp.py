import os, argparse, subprocess

def run_exp(query_folder, data_file, script, recursive, result_folder, result_tmpl, times_file):
    data_name = data_file[data_file.rindex("/")+1:data_file.rindex(".")]
    
    fd = open(times_file, 'w')
    
    if script == "run_spin3_forward.sh":
        fd.write("query,result_file,time_gen_spin,time_gen_spin2,time_gen_n3,time_n3_run,time_exec_n3\n")
    elif script == "run_spin3_loops.sh":
        fd.write("query,result_file,time_gen_spin,time_gen_n3,time_exec_n3\n")
    else:
        print(f"unknown script! {script}")
        return
    
    fd.close()
    
    # query_file = "query-1.sparql"
    
    for query_file in sorted(os.listdir(query_folder)):
        if not query_file.endswith(".sparql"):
            continue
        
        print(">", query_file)
        
        query_name = query_file[0:query_file.index(".")]
        result_name = result_tmpl.format(data_name, query_name)
        result_file = result_folder + "/" + result_name
        
        query_file = os.path.join(query_folder, query_file)
        
        cmd = [f'./{script}', query_file, data_file, "false", recursive + "", "false", result_file ]
        # print(cmd)
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, error = [ b.decode('UTF-8') for b in process.communicate() ]
        if error.strip() != "": print("error:", error)
        
        # fd.write(f"{result_name},{out}")
        # fd.flush()
        # os.fsync(fd)
        
        # ... yes
        fd = open(times_file, 'a')
        fd.write(f"{query_name},{result_name},{out}")
        fd.close()
        
        # break
        

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Run test manifest.")
    parser.add_argument('--query_folder', help="Folder with experiment queries.", required=True)
    parser.add_argument('--data', help="Data file.", required=True)
    parser.add_argument('--script', help="Shell script to be run", required=False)
    parser.add_argument('--recursive', help="Whether CONSTRUCT queries are being tested", required=False)
    parser.add_argument('--result_folder', help="Folder for results.", required=True)
    parser.add_argument('--result_tmpl', help="Template for result files.", required=True)
    parser.add_argument('--times_file', help="File to store times.", required=True)

    args = parser.parse_args()
    query_folder = args.query_folder
    data_file = args.data
    script = args.script
    recursive = args.recursive
    result_folder = args.result_folder
    result_tmpl = args.result_tmpl
    times_file = args.times_file
    
    run_exp(query_folder, data_file, script, recursive, result_folder, result_tmpl, times_file)