[ a                              <http://spinrdf.org/sp#Select> ;
  <http://spinrdf.org/sp#where>  ( [ a                               <http://spinrdf.org/sp#TriplePath> ;
                                     <http://spinrdf.org/sp#object>  <http://example.org/alice> ;
                                     <http://spinrdf.org/sp#path>    [ a                             <http://spinrdf.org/sp#NegatedPath> ;
                                                                       <http://spinrdf.org/sp#node>  <http://xmlns.com/foaf/0.1/knows>
                                                                     ] ;
                                     <http://spinrdf.org/sp#subject>
                                             [ <http://spinrdf.org/sp#varName>
                                                       "x" ]
                                   ]
                                 )
] .
