[ a  <http://spinrdf.org/sp#Select> ;
  <http://spinrdf.org/sp#groupBy>
          ( [ <http://spinrdf.org/sp#varName>
                      "z" ]
          ) ;
  <http://spinrdf.org/sp#resultVariables>
          ( [ <http://spinrdf.org/sp#varName>
                      "z" ]
          ) ;
  <http://spinrdf.org/sp#where>  ( [ <http://spinrdf.org/sp#object>  <http://example/X> ;
         <http://spinrdf.org/sp#predicate>
                 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "p" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example/p> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "q" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example/q> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
       [ <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "n" ] ;
         <http://spinrdf.org/sp#predicate>
                 <http://example/n> ;
         <http://spinrdf.org/sp#subject>
                 [ <http://spinrdf.org/sp#varName>
                           "x" ]
       ]
     )
] .
