@prefix owl: <http://www.w3.org/2002/07/owl#> .

owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "s" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "s" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "o" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "o" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "o" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "s" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "z" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "z" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "o" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "s2" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "s2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "s" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "o" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "s" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "o" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p2" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "s" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "o" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "s" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "o2" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "s" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "o2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "o" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "o" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "s" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#differentFrom>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#differentFrom>
            ]
            [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#differentFrom>
            ]
            [ <http://spinrdf.org/sp#object>  "Violates <http://www.w3.org/2002/07/owl#differentFrom>" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#differentFrom>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#differentFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
            [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#members> ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
            [ <http://spinrdf.org/sp#object>  "Violation of <http://www.w3.org/2002/07/owl#AllDifferent>" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#AllDifferent> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "list" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#members> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "list" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "list" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "y1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "y2" ]
                 ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
            [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#distinctMembers> ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
            [ <http://spinrdf.org/sp#object>  "Violation of <http://www.w3.org/2002/07/owl#AllDifferent>" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDifferent>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#AllDifferent> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "list" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#distinctMembers> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "list" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "list" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "y1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "y2" ]
                 ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sameAs> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#domain> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#range> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#FunctionalProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "y1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "y2" ]
                 ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#InverseFunctionalProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x2" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "x1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "x2" ]
                 ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#irreflexiveProperty>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#irreflexiveProperty>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#irreflexiveProperty>
            ]
            [ <http://spinrdf.org/sp#object>  "Irreflexive property" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#irreflexiveProperty>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#IrreflexiveProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#SymmetricProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#asymmetricProperty>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#asymmetricProperty>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#asymmetricProperty>
            ]
            [ <http://spinrdf.org/sp#object>  "Asymmetric property" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#asymmetricProperty>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#AsymmetricProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "z" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#TransitiveProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "z" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p2" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p2" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#equivalentProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#equivalentProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#propertyDisjointWith>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#propertyDisjointWith>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#propertyDisjointWith>
            ]
            [ <http://spinrdf.org/sp#object>  "Property declared disjoint with" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#propertyDisjointWith>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#propertyDisjointWith> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointProperties>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointProperties>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointProperties>
            ]
            [ <http://spinrdf.org/sp#object>  "Violation of <http://www.w3.org/2002/07/owl#AllDisjointProperties>" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointProperties>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#AllDisjointProperties> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "z" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "members" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#members> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "z" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "members" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "members" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "p1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "p2" ]
                 ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p2" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#inverseOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#inverseOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "i1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
            [ <http://spinrdf.org/sp#object>  "Negative Property Assertion" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "i1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sourceIndividual> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#assertionProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "i2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#targetIndividual> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "i2" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "i1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "i" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
            [ <http://spinrdf.org/sp#object>  "Negative Property Assertion" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#negativePropertyAssertion>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "i" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#sourceIndividual> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#assertionProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "lt" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#targetValue> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "lt" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "i" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#nothingType>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#nothingType>
            ]
            [ <http://spinrdf.org/sp#object>  "Resource with type Nothing" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#nothingType>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#Nothing> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "ci" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#intersectionOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "ci" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#unionOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "ci" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "ci" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
            [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#complementOf> ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
            [ <http://spinrdf.org/sp#object>  "Resource is instance of two disjoint classes" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#complementOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "u" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#someValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "v" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "v" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "u" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#Thing> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#someValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "v" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "v" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#allValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "v" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y" ] ;
              <http://spinrdf.org/sp#predicate>
                      [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "u" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#hasValue> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "u" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#hasValue> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxCardinality0>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxCardinality0>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxCardinality0>
            ]
            [ <http://spinrdf.org/sp#object>  "<http://www.w3.org/2002/07/owl#maxCardinality> of 0" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxCardinality0>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  "0"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#maxCardinality> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  "1"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#maxCardinality> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "y1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "y2" ]
                 ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0>
            ]
            [ <http://spinrdf.org/sp#object>  "Maximum qualified cardinality of 0" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  "0"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0Thing>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "u" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0Thing>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0Thing>
            ]
            [ <http://spinrdf.org/sp#object>  "Qualified max cardinality 0" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#maxQualifiedCardinality0Thing>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  "0"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#Thing> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  "1"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "y1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "y2" ]
                 ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y2" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "y2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#sameAs> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "y1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  "1"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#Thing> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "u" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "y1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "y2" ]
                 ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "yi" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#oneOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "yi" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#equivalentClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "x" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#equivalentClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
            [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#disjointWith> ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationPath> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
            [ <http://spinrdf.org/sp#object>  "Resource is instance of two disjoint classes" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#disjointClass>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#disjointWith> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  <http://example.org/violation#ConstraintViolation> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointClasses>
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "x" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/violation#violationRoot> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointClasses>
            ]
            [ <http://spinrdf.org/sp#object>  "Shared instance of classes from an AllDisjointClasses block" ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#label> ;
              <http://spinrdf.org/sp#subject>
                      <http://example.org/violation#allDisjointClasses>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#AllDisjointClasses> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "members" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#members> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "members" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "members" ]
       ]
       [ a       <http://spinrdf.org/sp#Filter> ;
         <http://spinrdf.org/sp#expression>
                 [ a <http://spinrdf.org/sp#ne> ;
                   <http://spinrdf.org/sp#arg1>  [ <http://spinrdf.org/sp#varName>
         "c1" ] ;
                   <http://spinrdf.org/sp#arg2>  [ <http://spinrdf.org/sp#varName>
         "c2" ]
                 ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#equivalentClass> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c" ]
            ]
            [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#Thing> ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      <http://www.w3.org/2002/07/owl#Nothing>
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#Class> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c3" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c3" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c2" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#equivalentClass> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#equivalentClass> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#equivalentProperty> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#ObjectProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#equivalentProperty> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://www.w3.org/2002/07/owl#DatatypeProperty> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p3" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p3" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ]
            ]
            [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p2" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#equivalentProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "p2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2002/07/owl#equivalentProperty> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#domain> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#domain> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#domain> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#domain> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#range> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#range> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#range> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "p1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "c" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#range> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "i" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#hasValue> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "i" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#hasValue> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#someValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#someValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#someValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#someValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c2" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c1" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#allValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#allValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "y1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c1" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c2" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#allValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p1" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c1" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "y" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#allValuesFrom> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#onProperty> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c2" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p2" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "p1" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "cl" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "c" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#intersectionOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "cl" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "c" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://www.w3.org/2000/01/rdf-schema#subClassOf> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "cl" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/2002/07/owl#unionOf> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "c" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "cl" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example.org/list#hasMember> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
owl:Class <http://spinrdf.org/spin#rule>
[ a  <http://spinrdf.org/sp#Construct> ;
  <http://spinrdf.org/sp#templates>
          ( [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
    "m" ] ;
              <http://spinrdf.org/sp#predicate>
                      <http://example.org/list#hasMember> ;
              <http://spinrdf.org/sp#subject>
                      [ <http://spinrdf.org/sp#varName>
    "l" ]
            ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "m" ] ;
         <http://spinrdf.org/sp#path>    [ a  <http://spinrdf.org/sp#SeqPath> ;
               <http://spinrdf.org/sp#path1>  [ a   <http://spinrdf.org/sp#ModPath> ;
                    <http://spinrdf.org/sp#modMax>  -2 ;
                    <http://spinrdf.org/sp#modMin>  0 ;
                    <http://spinrdf.org/sp#subPath>
                            <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest>
                  ] ;
               <http://spinrdf.org/sp#path2>  <http://www.w3.org/1999/02/22-rdf-syntax-ns#first>
             ] ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "l" ]
       ]
     )
] .
