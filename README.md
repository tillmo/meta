# meta repository for ontohub
meta repository for ontohub; contains ontologies for metadata, for DOL etc.

## overview of some files in the repository
ad-15-10-03.rdf - DOL ontology as submitted to OMG in Dec 2015 and published on OMG website (snapshot of DOL-terms.rdf)
DOL-terms.omn -  original source file of DOL ontology, shall no longer be modified 
DOL-terms.rdf - current source file of DOL ontology. Modify only through dedicated workflow above
DOL-terms.sed - script for adapting DOL-terms.rdf according to OMG's needs
DOL-terms.ttl - outdated file, resulting from an attempt to switch to ttl as main input syntax

Domain_Fields_Core.owl - ontology of subjects for Ontohub; currently not used
Domain_Fields_Extension.owl - dto.

OntohubMetadataOntology.owl - preliminary file for Domain_Fields_Core.owl ?

SZS.omn - proof status ontology
SZS.owl - dto.
proof_statuses.owl - dto.?

dol-metamodel.xmi - abstract syntax in DOL, written as a MOF metamodel

filter-out-annotation-properties.sed - script for filtering DOL-terms.rdf according to OMG's needs

imports/ - imported ontologies
lola/ - Language and Logic ontology LoLa
src/ - IDL specification of an API for Ontohub
test/ 
