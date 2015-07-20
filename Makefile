# this requires https://github.com/owlcollab/owltools
%.owl: %.omn
	owltools $< -o $@

# ^ once you import other ontologies, you'll need local copies of them and map their namespace URIs to these local files using a catalog XML file.  They you'll need the following rule:
# owltools --catalog-xml catalog-v001.xml $< -o $@
