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

all: DOL-terms.rdf

DOL-terms.rdf: DOL-terms.raw.owl DOL-terms.sed
	sed -f DOL-terms.sed $< \
	> $@

DOL-terms.raw.owl: DOL-terms.omn $(CATALOG)
	$(OMN2RDF) $< $@

# the same rule for other ontologies that we may have (and which don't require post-processing)
%.owl: %.omn $(CATALOG)
	$(OMN2RDF) $< $@

# make sure that rewriting the RDF/XML version DOL-terms.rdf with sed doesn't break anything.
test: DOL-terms.omn.nt DOL-terms.owl.nt
	@echo "If the rule succeeds with empty output, then the test is passed.  We assume that blank nodes receive the same IDs in both ontologies being compared."
	diff $^

DOL-terms.omn.nt: DOL-terms.raw.owl
	$(RDF2NT_DEF); sed -f filter-out-annotation-properties.sed $< \
	| rdf2nt - $< \
	| sort \
	> $@

DOL-terms.owl.nt: DOL-terms.rdf
	$(RDF2NT) $< \
	| sort \
	> $@
