from rdflib import Graph
import random, os

ns = """@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix fh: <http://hl7.org/fhir/> .
@prefix zk: <http://example.org/zika#> .
@prefix ut: <http://example.org/utils#> .
@prefix : <http://example.org/> .\n\n"""

cnt = 0


def new_pat():
    global cnt
    pat = f"Patient/p{cnt}"
    cnt += 1
    return pat


def add_snippet(path, params, graph):
    data = open(path).read().format(**params)
    graph.parse(data=data, format="n3")


def odds(chance):
    return random.random() < chance


def init_graph():
    g = Graph()
    # current time
    g.parse(data=ns + "ut:now rdf:value 1688478455140 .", format="n3")
    
    return g


def gen_cases(num, chances, path):
    g = init_graph()
    
    for _ in range(0, num):
        gen_case(chances, path, g)

    return g


def gen_case(chances, path, g=None):
    pat = new_pat()

    if g is None:
        g = init_graph()

    # new patient
    add_snippet(os.path.join(path, "patient.n3"), {'pat': pat}, g)

    if odds(chances['isPregnant']):
        add_snippet(os.path.join(path, "isPregnant.n3"), {'pat': pat}, g)

    if odds(chances['hasZikaSymptom']):
        add_snippet(os.path.join(path, "hasZikaSymptom1.n3"), {'pat': pat}, g)

    if odds(chances['hasZikaSymptom']):
        add_snippet(os.path.join(path, "hasZikaSymptom2.n3"), {'pat': pat}, g)

    if odds(chances['recentTravelToZikaArea']):
        add_snippet(os.path.join(path, "recentTravelToZikaArea.n3"), {'pat': pat}, g)

    if odds(chances['recentSexualEncounter']):
        # other sexy patient
        other_pat = new_pat()
        add_snippet(os.path.join(path, "patient.n3"), {'pat': other_pat}, g)

        if (odds(chances['recentSexualEncounter_recentTravelToZikaArea'])):
            add_snippet(os.path.join(path, "recentTravelToZikaArea.n3"), {'pat': other_pat}, g)
        else:
            add_snippet(os.path.join(path, "residentOfZikaArea.n3"), {'pat': other_pat}, g)

        add_snippet(os.path.join(path, "sexualEncounter.n3"), {
                    'pat': pat, 'other_pat': other_pat}, g)