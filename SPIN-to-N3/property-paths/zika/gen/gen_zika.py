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
    
    all_symptoms = open("all_symptoms.txt").read().split(",")
    # print(all_symptoms)
    for _ in range(0, num):
        gen_case(chances, path, all_symptoms, g)

    return g

def gen_symptom_zika(path, params, g):
    all_symptoms = [
        [1204160001, 1204158003, 441313008, 1144976006, 199102004, 723857007, 413587002, 235118001, 724428007, 32482005, 1204188007, 1204156004, 733175002, 1204191007], # 84387000 
        [271749004], # 271749004 
        [47725002], # 47725002
        [433017009], # 57676002
        [421632000, 193876005], # 9826008
        [28221000119103, 95421005, 54981004, 702549002, 279070004], # 68962001
        [112101004, 54012000, 162311003, 445511002, 103011009, 38823002, 95670000, 129610005, 267096005, 443095000, 124081000119107, 425365009, 445322004, 424699007, 425007008, 124171000119105, 83351003, 425936006, 230462002, 699314009, 230465000, 230464001, 1260329005, 1260330000, 1260327007, 124081000119107, 49605003, 124171000119105, 95657009, 711545001, 145611000119107, 79267007, 26150009, 193039006, 230468003, 124171000119105, 95653008, 122731000119104, 103012002, 44538002, 703182002, 230481005, 103007003, 86925001, 1263575002, 95658004, 162301005, 43242008, 169464001, 162299003, 279016001, 294081000119102, 129612002, 162211001, 712831003, 103008008, 162310002, 162300006, 13322008, 395688005] # 25064002
    ]
    sub_symptoms = random.choice(all_symptoms)
    symptom = random.choice(sub_symptoms)
    
    params['snomed'] = f"http://snomed.info/id/{symptom}"
    
    add_snippet(os.path.join(path, "hasZikaSymptom_snomed.n3"), params, g)
    

def gen_symptom_any(path, params, all_symptoms, g):
    symptom = random.choice(all_symptoms)
    
    params['snomed'] = f"http://snomed.info/id/{symptom}"
    
    add_snippet(os.path.join(path, "hasZikaSymptom_snomed.n3"), params, g)
    

def gen_case(chances, path, all_symptoms, g=None):
    pat = new_pat()

    if g is None:
        g = init_graph()

    # new patient
    add_snippet(os.path.join(path, "patient.n3"), {'pat': pat}, g)

    if odds(chances['isPregnant']):
        add_snippet(os.path.join(path, "isPregnant.n3"), {'pat': pat}, g)

    if odds(chances['hasZikaSymptom']):
        gen_symptom_zika(path, {'pat': pat}, g)
        # add_snippet(os.path.join(path, "hasZikaSymptom1.n3"), {'pat': pat}, g)

    if odds(chances['hasZikaSymptom']):
        gen_symptom_zika(path, {'pat': pat}, g)
        # add_snippet(os.path.join(path, "hasZikaSymptom2.n3"), {'pat': pat}, g)
        
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)
    gen_symptom_any(path, {'pat': pat}, all_symptoms, g)

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