import os, argparse, subprocess, time

def run_exp(query, data_file, script, recursive, result_folder, result_tmpl, times_file):    
    fd = open(times_file, 'w')
    
    if script.startswith("run_spin3_forward"):
        fd.write("query,result_file,time_gen_spin,time_gen_spin2,time_gen_n3,time_n3_run,time_exec_n3\n")
    elif script.startswith("run_spin3_loops"):
        # get total time
        # fd.write("query,result_file,time_gen_spin,time_gen_n3,time_exec_n3\n")
        # get finegrained time
        fd.write("query,result_file,time_gen_spin,time_gen_n3,run_strt_time,run_netw_time,run_reas_time,time_exec_total\n")
    else:
        print(f"unknown script! {script}")
        return
    
    fd.close()
    
    if query.endswith(".sparql"):
        query_file = query[query.rindex("/")+1:]
        for i in range(0, 1):
            print(f"run {i}")
            run_query(query_file, query, data_file, script, recursive, result_folder, result_tmpl, times_file)
    else:
        for query_file in sorted(os.listdir(query)):
            if not query_file.endswith(".sparql"):
                continue
            
            if not query_file.startswith("yago5"):
                continue
            
            query_path = os.path.join(query, query_file)
            for i in range(0, 1):
                print(f"run {i}")
                run_query(query_file, query_path, data_file, script, recursive, result_folder, result_tmpl, times_file)
            
            # break
        
        
def run_query(query_file, query_path, data_file, script, recursive, result_folder, result_tmpl, times_file):
    print(">", query_file)
        
    data_name = data_file[data_file.rindex("/")+1:data_file.rindex(".")]
    query_name = query_file[0:query_file.index(".")]
    result_name = result_tmpl.format(data_name, query_name)
    result_file = result_folder + "/" + result_name
    
    # start = time.time()
    cmd = [f'./{script}', query_path, data_file, "false", recursive + "", "false", result_file ]
    # print(cmd)
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, error = [ b.decode('UTF-8') for b in process.communicate() ]
    out = out.rstrip()
    if error.strip() != "": print("error:", error)
    # end = time.time()
    # total_time = (end - start)
    
    # fd.write(f"{result_name},{out}")
    # fd.flush()
    # os.fsync(fd)
    
    # ... yes
    fd = open(times_file, 'a')
    fd.write(f"{query_name},{result_name},{out}\n")
    fd.close()
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Run test manifest.")
    parser.add_argument('--query', help="File or folder with experiment query(ies).", required=True)
    parser.add_argument('--data', help="Data file.", required=True)
    parser.add_argument('--script', help="Shell script to be run", required=False)
    parser.add_argument('--recursive', help="Whether CONSTRUCT queries are being tested", required=False)
    parser.add_argument('--result_folder', help="Folder for results.", required=True)
    parser.add_argument('--result_tmpl', help="Template for result files.", required=True)
    parser.add_argument('--times_file', help="File to store times.", required=True)

    args = parser.parse_args()
    query = args.query
    data_file = args.data
    script = args.script
    recursive = args.recursive
    result_folder = args.result_folder
    result_tmpl = args.result_tmpl
    times_file = args.times_file
    
    run_exp(query, data_file, script, recursive, result_folder, result_tmpl, times_file)