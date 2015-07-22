CATALOG = catalog-v001.xml 

# converting OWL Manchester Syntax to RDF/XML
# this requires https://github.com/owlcollab/owltools
OMN2RDF_DEF = omn2rdf() { \
		owltools --catalog-xml $(CATALOG) $$1 -o $$2 ; \
	}
OMN2RDF = $(OMN2RDF_DEF); omn2rdf

# converting RDF/XML to N-Triples
# this requires rapper from http://librdf.org
RDF2NT_STDOUT_DEF = rdf2nt() { \
		rapper -i rdfxml -o ntriples $$1 ; \
	}
RDF2NT_STDOUT = $(RDF2NT_STDOUT_DEF); rdf2nt
RDF2NT = $(RDF2NT_STDOUT_DEF); rdf2nt > $$2

# converting N-Triples to RDF/XML
NT2RDF_STDOUT_DEF = nt2rdf() { \
		rapper -i ntriples -o rdfxml-abbrev $$1 ; \
	}
NT2RDF_STDOUT = $(NT2RDF_STDOUT_DEF); nt2rdf
NT2RDF = $(NT2RDF_DEF); nt2rdf > $$2

all: dol-ontology.owl

dol-ontology.owl: dol-ontology.raw.owl dol-ontology.sed
	sed -f dol-ontology.sed $< > $@

dol-ontology.raw.owl: dol-ontology.omn $(CATALOG)
	$(OMN2RDF) $< $@

# the same rule for other ontologies that we may have (and which don't require post-processing)
%.owl: %.omn $(CATALOG)
	$(OMN2RDF) $< $@

# make sure that rewriting the RDF/XML version dol-ontology.owl with sed doesn't break anything.
test: dol-ontology.omn.nt dol-ontology.owl.nt
	@echo "If the rule succeeds with empty output, then the test is passed."
	diff $^

dol-ontology.omn.nt: dol-ontology.raw.owl
	$(RDF2NT_STDOUT) $< \
	| sort \
	> $@

dol-ontology.owl.nt: dol-ontology.owl
	$(RDF2NT_STDOUT) $< \
	| sort \
	> $@
