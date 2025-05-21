from rdflib.plugins.sparql import parser

class Print_Visitor:
    
    def visit(self, ast, lvl=0):
        if type(ast) == parser.ParseResults:
            self.results(ast, lvl)
            for j in ast.as_list(): self.visit(j, lvl+1)
        
        elif type(ast) == list:
            for j in ast: self.visit(j, lvl+1)
       
        elif hasattr(ast, 'items') and len(ast) > 0:
            self.node(ast, lvl)
            for j in ast.values(): self.visit(j, lvl+1)
        
        else:
            return self.leaf(ast, lvl)
    
    def __indent(self, lvl):
        return " ".join([ "" for _ in range(lvl) ])
    
    def results(self, ast, lvl):
        print(self.__indent(lvl), "results:", ast)
        
    def node(self, ast, lvl):
        print(self.__indent(lvl), "node:", ast.name)
    
    def leaf(self, ast, lvl):
        print(self.__indent(lvl), "leaf:", ast)
        
        
class To_N3_Visitor:
    
    def convert(self, query):
        if 'projection' not in query:
            head = "{ :x :result true }"
        else:
            vars = [ f"('{var.var}' {var.var.n3()})" for var in query['projection'] ]
            vars = "( " + " ".join(vars) + " )"
            head = "{ " + f"_:x :result {vars}" + " }"
        
        body = self.visit(query['where'])
        body = "{ " + body + " }"
        
        return f"{body}\n => {head} ."
    
    def visit(self, ast):
        if type(ast) == parser.ParseResults:
            ret = [ self.visit(j) for j in ast.as_list() ]
            return " . ".join([ " ".join(ret[n*3 : (n+1)*3]) for n in range(int(len(ret)/3)) ])
                    
        elif type(ast) == list:
            return " ".join([ self.visit(j) for j in ast ])
       
        elif hasattr(ast, 'name'): # node
            if ast.name == 'pname':
                return self.leaf(ast)        
            elif ast.name == 'TriplesBlock':
                ret = [ self.visit(j) for j in ast['triples'] ]
                return " . ".join(ret)
            else:
                return self.node(ast)
        
        else:
            return self.leaf(ast)
        
    def node(self, ast):        
        symbol = None; infix = False
        match(ast.name):
            case 'PathAlternative':
                symbol = "|"; infix = True
            case 'PathSequence':
                symbol = "/"; infix = True
            case 'PathNegatedPropertySet':
                symbol = "!"; infix = False
            case 'PathEltOrInverse':
                symbol = "^"; infix = False
                
        # kleene-star: represented using "mod" key
        
        key = list(ast.keys())[0]
        is_list = (type(ast[key]) == list)
        nodes = [ self.visit(j) for j in ast[key] ] if is_list else [ self.visit(ast[key]) ]

        if symbol is not None:
            symbol = f" '{symbol}' "
            sep = symbol if infix else " "
            nodes_str = "(" + sep.join(nodes) + ")" if len(nodes) > 1 else sep.join(nodes)
            if not infix:
                nodes_str = "(" + symbol + nodes_str + ")"
            return nodes_str
        else:
            return nodes[0]
        
    def leaf(self, ast):
        if hasattr(ast, "n3") and ast.n3 is not None:
            return ast.n3()
        elif ast.name == "pname":
            return ":" + ast['localname']
        else:
            return ast.__str__()