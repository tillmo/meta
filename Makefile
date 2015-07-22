# this requires https://github.com/owlcollab/owltools
dol-ontology.owl: dol-ontology.omn dol-ontology.sed
	owltools $< -o $@.$$$$.tmp ; \
	sed -f dol-ontology.sed $@.$$$$.tmp > $@ ; \
	rm -f $@.$$$$.tmp
# ^ once you import other ontologies, you'll need local copies of them and map their namespace URIs to these local files using a catalog XML file.  They you'll need the following rule:
# owltools --catalog-xml catalog-v001.xml $< -o $@

# the same rule for other ontologies that we may have (and which don't require post-processing)
%.owl: %.omn
	owltools $< -o $@

