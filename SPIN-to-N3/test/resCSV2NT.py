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

def guess_term_type(string):
    if re.match(r'^[a-zA-Z]+://', string):
        return 'iri'

    if string.startswith('_:'):
        return 'bnode'

    return 'literal'

def toProperty(label):
    label = re.sub(r"[^\w]", " ", label)
    label = re.sub("([a-z])([A-Z])", "\\1 \\2", label)
    label = label.split(" ")
    return "".join([label[0].lower()] + [x.capitalize() for x in label[1:]])

def csv_reader(csv_data, dialect=csv.excel, **kwargs):
    csv_reader = csv.reader(csv_data, dialect=dialect, **kwargs)
    for row in csv_reader:
        yield row

class RESRDF:
    def __init__(self):
        self.BASE = rdflib.Namespace("http://example.org/")
        self.PROPBASE = rdflib.Namespace("http://example.org/")
        self.IDENT = "auto"
        self.DEFAULT = None
        self.COLUMNS = {}
        self.OUT = sys.stdout
        self.triples = 0

    def triple(self, s, p, o):
        if guess_term_type(o) == 'bnode':
            o = rdflib.BNode(o[2:])
        elif guess_term_type(o) == 'iri':
            o = rdflib.URIRef(o)
        self.OUT.write("%s %s %s .\n" % (s.n3(), p.n3(), o.n3()))
        self.triples += 1

    def convert(self, csvreader):
        start = time.time()
        # if self.OUT:
        #     sys.stderr.write("Starting conversion.\n")
        header_labels = list(next(csvreader))
        headers = dict(enumerate([self.PROPBASE[toProperty(x)] for x in header_labels]))
        rows = 0
        for l_ in csvreader:
            try:
                if self.IDENT == "auto":
                    uri = self.BASE["%d" % rows]
                for i, x in enumerate(l_):
                    x = x.strip()
                    if x != "":
                        if self.COLUMNS.get(i, self.DEFAULT) == "ignore":
                            continue
                        try:
                            o = self.COLUMNS.get(i, rdflib.Literal)(x)
                            if isinstance(o, list):
                                for _o in o:
                                    self.triple(uri, headers[i], _o)
                            else:
                                self.triple(uri, headers[i], o)
                        except Exception as e:
                            warnings.warn(
                                "Could not process value for column "
                                + "%d:%s in row %d, ignoring: %s "
                                % (i, headers[i], rows, e.message)
                            )
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

def main():
    csv2rdf = RESRDF()
    parser = argparse.ArgumentParser(description='Convert CSV files to RDF.')
    parser.add_argument('files', metavar='FILE', type=str, nargs='+', help='CSV files to convert')
    args = parser.parse_args()
    csv2rdf.convert(csv_reader(fileinput.input(args.files)))

if __name__ == "__main__":
    main()
