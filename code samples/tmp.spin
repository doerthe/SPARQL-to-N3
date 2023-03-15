[]    a       <http://spinrdf.org/sp#Select> ;
      <http://spinrdf.org/sp#resultVariables>
              ([ <http://spinrdf.org/sp#varName>
                          "x"
                ] [ <http://spinrdf.org/sp#varName>
                          "name"
                ]) ;
      <http://spinrdf.org/sp#where>
              ([ <http://spinrdf.org/sp#object>
                          <mailto:alice@example> ;
                  <http://spinrdf.org/sp#predicate>
                          <http://xmlns.com/foaf/0.1/mbox> ;
                  <http://spinrdf.org/sp#subject>
                          [ <http://spinrdf.org/sp#varName>
                                    "x"
                          ]
                ] [ a       <http://spinrdf.org/sp#TriplePath> ;
                  <http://spinrdf.org/sp#object>
                          [ <http://spinrdf.org/sp#varName>
                                    "name"
                          ] ;
                  <http://spinrdf.org/sp#path>
                          [ a       <http://spinrdf.org/sp#SeqPath> ;
                            <http://spinrdf.org/sp#path1>
                                    [ a       <http://spinrdf.org/sp#SeqPath> ;
                                      <http://spinrdf.org/sp#path1>
                                              [ a       <http://spinrdf.org/sp#SeqPath> ;
                                                <http://spinrdf.org/sp#path1>
                                                        <http://xmlns.com/foaf/0.1/knows> ;
                                                <http://spinrdf.org/sp#path2>
                                                        <http://xmlns.com/foaf/0.1/knows>
                                              ] ;
                                      <http://spinrdf.org/sp#path2>
                                              <http://xmlns.com/foaf/0.1/knows>
                                    ] ;
                            <http://spinrdf.org/sp#path2>
                                    <http://xmlns.com/foaf/0.1/name>
                          ] ;
                  <http://spinrdf.org/sp#subject>
                          [ <http://spinrdf.org/sp#varName>
                                    "x"
                          ]
                ]) .
