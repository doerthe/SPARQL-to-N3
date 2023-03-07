[]    a       <http://spinrdf.org/sp#Select> ;
      <http://spinrdf.org/sp#groupBy>
              ([ <http://spinrdf.org/sp#varName>
                          "org"
                ]) ;
      <http://spinrdf.org/sp#resultVariables>
              ([ <http://spinrdf.org/sp#varName>
                          "org"
                ] [ <http://spinrdf.org/sp#expression>
                          [ a       <http://spinrdf.org/sp#Sum> ;
                            <http://spinrdf.org/sp#expression>
                                    [ <http://spinrdf.org/sp#varName>
                                              "lprice"
                                    ]
                          ] ;
                  <http://spinrdf.org/sp#varName>
                          "totalPrice"
                ] [ <http://spinrdf.org/sp#expression>
                          [ a       <http://spinrdf.org/sp#Sum> ;
                            <http://spinrdf.org/sp#expression>
                                    [ <http://spinrdf.org/sp#varName>
                                              "lpages"
                                    ]
                          ] ;
                  <http://spinrdf.org/sp#varName>
                          "totalPages"
                ]) ;
      <http://spinrdf.org/sp#where>
              ([ <http://spinrdf.org/sp#object>
                          [ <http://spinrdf.org/sp#varName>
                                    "auth"
                          ] ;
                  <http://spinrdf.org/sp#predicate>
                          <http://books.example/affiliates> ;
                  <http://spinrdf.org/sp#subject>
                          [ <http://spinrdf.org/sp#varName>
                                    "org"
                          ]
                ] [ <http://spinrdf.org/sp#object>
                          [ <http://spinrdf.org/sp#varName>
                                    "book"
                          ] ;
                  <http://spinrdf.org/sp#predicate>
                          <http://books.example/writesBook> ;
                  <http://spinrdf.org/sp#subject>
                          [ <http://spinrdf.org/sp#varName>
                                    "auth"
                          ]
                ] [ <http://spinrdf.org/sp#object>
                          [ <http://spinrdf.org/sp#varName>
                                    "lprice"
                          ] ;
                  <http://spinrdf.org/sp#predicate>
                          <http://books.example/price> ;
                  <http://spinrdf.org/sp#subject>
                          [ <http://spinrdf.org/sp#varName>
                                    "book"
                          ]
                ] [ <http://spinrdf.org/sp#object>
                          [ <http://spinrdf.org/sp#varName>
                                    "lpages"
                          ] ;
                  <http://spinrdf.org/sp#predicate>
                          <http://books.example/nrPages> ;
                  <http://spinrdf.org/sp#subject>
                          [ <http://spinrdf.org/sp#varName>
                                    "book"
                          ]
                ]) .
