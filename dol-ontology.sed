# make UTF-8 encoding explicit
1s/<?xml version="1.0"?>/<?xml version="1.0" encoding="UTF-8"?>/

# add entities for namespaces
1a\
<!DOCTYPE rdf:RDF [\
<!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#" >\
<!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#" >\
<!ENTITY owl "http://www.w3.org/2002/07/owl#" >\
<!ENTITY xsd "http://www.w3.org/2001/XMLSchema#" >\
<!ENTITY dct "http://purl.org/dc/terms/" >\
<!ENTITY skos "http://www.w3.org/2004/02/skos/core#" >\
<!ENTITY sm "http://www.omg.org/techprocess/ab/SpecificationMetadata/" >\
]>

# delete XML Base and some other prefixes that we don't need
0,/xml:base=/{//d;}
0,/xmlns:ontology2=/{//d;}

