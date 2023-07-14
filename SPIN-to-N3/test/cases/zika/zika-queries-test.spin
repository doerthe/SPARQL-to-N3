@prefix owl: <http://www.w3.org/2002/07/owl#> .

<http://hl7.org/fhir/Patient> <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  true ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/zika#isPregnant> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://hl7.org/fhir/Patient> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "id" ] ;
         <http://spinrdf.org/sp#path>    [ a  <http://spinrdf.org/sp#SeqPath> ;
               <http://spinrdf.org/sp#path1>  <http://hl7.org/fhir/id> ;
               <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/v>
             ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "id" ] ;
         <http://spinrdf.org/sp#path>    [ a  <http://spinrdf.org/sp#SeqPath> ;
               <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                    <http://spinrdf.org/sp#path1>  <http://hl7.org/fhir/subject> ;
                    <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/reference>
                  ] ;
               <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/v>
             ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  77386006 ;
         <http://spinrdf.org/sp#path>    [ a  <http://spinrdf.org/sp#SeqPath> ;
               <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                    <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                         <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                              <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
       <http://spinrdf.org/sp#path1>  <http://hl7.org/fhir/code> ;
       <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/coding>
                                 ] ;
                              <http://spinrdf.org/sp#path2>  [ a   <http://spinrdf.org/sp#ModPath> ;
       <http://spinrdf.org/sp#modMax>  -2 ;
       <http://spinrdf.org/sp#modMin>  0 ;
       <http://spinrdf.org/sp#subPath>
               <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>
                                 ]
                            ] ;
                         <http://spinrdf.org/sp#path2>  <http://www.w3.org/1999/02/22-rdf-syntax-ns#first>
                       ] ;
                    <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/code>
                  ] ;
               <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/v>
             ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  "active" ;
         <http://spinrdf.org/sp#path>    [ a  <http://spinrdf.org/sp#SeqPath> ;
               <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                    <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                         <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                              <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
       <http://spinrdf.org/sp#path1>  <http://hl7.org/fhir/clinicalStatus> ;
       <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/coding>
                                 ] ;
                              <http://spinrdf.org/sp#path2>  [ a   <http://spinrdf.org/sp#ModPath> ;
       <http://spinrdf.org/sp#modMax>  -2 ;
       <http://spinrdf.org/sp#modMin>  0 ;
       <http://spinrdf.org/sp#subPath>
               <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>
                                 ]
                            ] ;
                         <http://spinrdf.org/sp#path2>  <http://www.w3.org/1999/02/22-rdf-syntax-ns#first>
                       ] ;
                    <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/code>
                  ] ;
               <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/v>
             ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  "confirmed" ;
         <http://spinrdf.org/sp#path>    [ a  <http://spinrdf.org/sp#SeqPath> ;
               <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                    <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                         <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
                              <http://spinrdf.org/sp#path1>  [ a  <http://spinrdf.org/sp#SeqPath> ;
       <http://spinrdf.org/sp#path1>  <http://hl7.org/fhir/verificationStatus> ;
       <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/coding>
                                 ] ;
                              <http://spinrdf.org/sp#path2>  [ a   <http://spinrdf.org/sp#ModPath> ;
       <http://spinrdf.org/sp#modMax>  -2 ;
       <http://spinrdf.org/sp#modMin>  0 ;
       <http://spinrdf.org/sp#subPath>
               <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>
                                 ]
                            ] ;
                         <http://spinrdf.org/sp#path2>  <http://www.w3.org/1999/02/22-rdf-syntax-ns#first>
                       ] ;
                    <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/code>
                  ] ;
               <http://spinrdf.org/sp#path2>  <http://hl7.org/fhir/v>
             ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
     )
] .
