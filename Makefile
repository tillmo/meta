CATALOG = catalog-v001.xml 

# converting OWL Manchester Syntax to RDF/XML
# this requires https://github.com/owlcollab/owltools
OMN2RDF_DEF = omn2rdf() { \
		owltools --catalog-xml $(CATALOG) $$1 -o $$2 ; \
	}
OMN2RDF = $(OMN2RDF_DEF); omn2rdf

# converting RDF/XML to N-Triples
# this requires rapper from http://librdf.org
RDF2NT_DEF = rdf2nt() { \
		rapper -i rdfxml -o ntriples "$$@" ; \
	}
RDF2NT = $(RDF2NT_DEF); rdf2nt

# converting N-Triples to RDF/XML
NT2RDF_DEF = nt2rdf() { \
		rapper -i ntriples -o rdfxml-abbrev $$1 ; \
	}
NT2RDF = $(NT2RDF_DEF); nt2rdf

all: dol-ontology.owl

dol-ontology.owl: dol-ontology.raw.owl dol-ontology.sed
	sed -f dol-ontology.sed $< \
	> $@

dol-ontology.raw.owl: dol-ontology.omn $(CATALOG)
	$(OMN2RDF) $< $@

# the same rule for other ontologies that we may have (and which don't require post-processing)
%.owl: %.omn $(CATALOG)
	$(OMN2RDF) $< $@

# make sure that rewriting the RDF/XML version dol-ontology.owl with sed doesn't break anything.
test: dol-ontology.omn.nt dol-ontology.owl.nt
	@echo "If the rule succeeds with empty output, then the test is passed.  We assume that blank nodes receive the same IDs in both ontologies being compared."
	diff $^

dol-ontology.omn.nt: dol-ontology.raw.owl
	$(RDF2NT_DEF); sed -f filter-out-annotation-properties.sed $< \
	| rdf2nt - $< \
	| sort \
	> $@

dol-ontology.owl.nt: dol-ontology.owl
	$(RDF2NT) $< \
	| sort \
	> $@
