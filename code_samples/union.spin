[]    a       <http://spinrdf.org/sp#Select> ;
      <http://spinrdf.org/sp#resultVariables>
              ([ <http://spinrdf.org/sp#varName>
                          "title"
                ] [ <http://spinrdf.org/sp#varName>
                          "author"
                ]) ;
      <http://spinrdf.org/sp#where>
              ([ a       <http://spinrdf.org/sp#Union> ;
                  <http://spinrdf.org/sp#elements>
                          (
                                ([ <http://spinrdf.org/sp#object>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "title"
                                        ] ;
                                <http://spinrdf.org/sp#predicate>
                                        <http://purl.org/dc/elements/1.0/title> ;
                                <http://spinrdf.org/sp#subject>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "book"
                                        ]
                              ] [ <http://spinrdf.org/sp#object>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "author"
                                        ] ;
                                <http://spinrdf.org/sp#predicate>
                                        <http://purl.org/dc/elements/1.0/author> ;
                                <http://spinrdf.org/sp#subject>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "book"
                                        ]
                              ]) 
                              ([ <http://spinrdf.org/sp#object>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "title"
                                        ] ;
                                <http://spinrdf.org/sp#predicate>
                                        <http://purl.org/dc/elements/1.1/title> ;
                                <http://spinrdf.org/sp#subject>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "book"
                                        ]
                              ] [ <http://spinrdf.org/sp#object>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "author"
                                        ] ;
                                <http://spinrdf.org/sp#predicate>
                                        <http://purl.org/dc/elements/1.1/author> ;
                                <http://spinrdf.org/sp#subject>
                                        [ <http://spinrdf.org/sp#varName>
                                                  "book"
                                        ]
                              ])
                        )
                ]) .
