"""
See also https://github.com/RDFLib/rdflib/blob/main/rdflib/tools/csv2rdf.py in the RDFlib family of tools
"""

import csv
import fileinput
import re
import sys
import time
import warnings
import argparse
import rdflib


def n3_term_type(string):
    if re.match(r'^[a-zA-Z]+://', string):
        return 'iri'
    elif string.startswith('_:'):
        return 'bnode'
    return 'literal'


def n3_term(string):
    string = string.strip()
    term_type = n3_term_type(string)
    match(term_type):
        case 'bnode':
            term = rdflib.BNode(string[2:])
        case 'iri':
            term = rdflib.URIRef(string)
        case _:
            term = rdflib.Literal(string)
    return term


def n3_list(elements):
    return "(" + " ".join([element.n3() if isinstance(element, rdflib.term.Node) else element for element in elements]) + " )"


def csv_reader(csv_data, dialect=csv.excel, **kwargs):
    csv_reader = csv.reader(csv_data, dialect=dialect, **kwargs)
    for row in csv_reader:
        yield row


class RESRDF:
    def __init__(self, out, ordered=False):
        self.BASE = rdflib.Namespace("http://example.org/gmark/")
        self.RES_PROP = self.BASE['result']
        self.IDENT = "auto"
        self.OUT = out
        self.ORDERED = ordered
        self.triples = 0

    def result(self, subj, cells):
        o = n3_list([n3_list(cell) for cell in cells])
        self.OUT.write("%s %s %s .\n" % (subj.n3(), self.RES_PROP.n3(), o))
        self.triples += 1

    def convert(self, csvreader):
        start = time.time()
        # if self.OUT:
        #     sys.stderr.write("Starting conversion.\n")
        try:
            # in case of no results
            header_labels = list(next(csvreader))
        except:
            return

        rows = 0
        for l_ in csvreader:
            try:
                if self.IDENT == "auto":
                    if self.ORDERED == True:
                        subj = self.BASE["%d" % rows]
                    else:
                        subj = rdflib.BNode()
                else:
                    sys.stderr.write("unknown IDENT:", self.IDENT)
                    return

                cells = [(n3_term(header_labels[i]), n3_term(x))
                         for i, x in enumerate(l_)]
                self.result(subj, cells)

                rows += 1
                if rows % 100000 == 0:
                    sys.stderr.write(
                        "%d rows, %d triples, elapsed %.2fs.\n"
                        % (rows, self.triples, time.time() - start)
                    )
            except Exception:
                sys.stderr.write("Error processing line: %d\n" % rows)
                raise
        self.OUT.close()
        # sys.stderr.write("Converted %d rows into %d triples.\n" % (rows, self.triples))
        # sys.stderr.write("Took %.2f seconds.\n" % (time.time() - start))


def convert(file, ordered, out):
    with open(out, 'w') as out, open(file, 'r') as input:
        if ordered:
            csv2rdf = RESRDF(out=out, ordered=True)
        else:
            csv2rdf = RESRDF(out=out)

        # ASK
        contents = input.read()
        if match := re.search("result: (true|false)", contents):
            out.write(f"PREFIX : <http://example.org/gmark/> \n\n :x :result {match.group(1)} .")
        # SELECT 
        else:
            with open(file, 'r') as input:
                csv2rdf.convert(csv_reader(input))