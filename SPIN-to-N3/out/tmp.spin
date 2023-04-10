<http://xmlns.com/foaf/0.1/knows_link>
        a <http://spinrdf.org/sp#LinkPath> ;
        <http://spinrdf.org/sp#node>  <http://xmlns.com/foaf/0.1/knows> .

<http://xmlns.com/foaf/0.1/worksWith_revlink>
        a <http://spinrdf.org/sp#ReverseLinkPath> ;
        <http://spinrdf.org/sp#node>  <http://xmlns.com/foaf/0.1/worksWith> .

[ a  <http://spinrdf.org/sp#Select> ;
  <http://spinrdf.org/sp#where>  ( [ a   <http://spinrdf.org/sp#TriplePath> ;
         <http://spinrdf.org/sp#object>  [ <http://spinrdf.org/sp#varName>
                           "x" ] ;
         <http://spinrdf.org/sp#path>    [ a       <http://spinrdf.org/sp#NegatedPath> ;
               <http://spinrdf.org/sp#subPath>
                       ( <http://xmlns.com/foaf/0.1/knows_link> <http://xmlns.com/foaf/0.1/worksWith_revlink> )
             ] ;
         <http://spinrdf.org/sp#subject>
                 <http://example.org/alice>
       ]
     )
] .
