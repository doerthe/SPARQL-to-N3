# SPARQL to Vadalog Translation Engine

The code base is structured as follows:

* /src contains the source code of the translation engine, the SPARQL benchmarks and their Vadalog translations.

* /src/main/java/Translation contains all Java source code for translating SPARQL queries and RDF datasets to Vadalog.

* Before using the translation engine, set the working directory to SparqLog. 

* To translate all SPARQL benchmark queries to Vadalog, simply execute the main method of the TranslateQueries.java (in /src/main/java/Translation).

    * The translated queries will be saved at "SPARQL_Benchmark/Vadalog Translation of Benchmark Queries/<benchmark-name>".

* To translate all RDF benchmark datasets to Vadalog, simply execute the main method of the RDFDataTranslator.java (in /src/main/java/Translation).

    * The translated datasets will be saved at "SPARQL_Benchmark/Vadalog Translation of Benchmark Datasets/<benchmark-name>".

* The SPARQL and RDF data of the benchmarks can be found at "SPARQL_Benchmark/(BeSeppi | Feasible | SP2Bench)".
