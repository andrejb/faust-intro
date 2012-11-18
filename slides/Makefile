FILENAME = faust-intro
HTML_PREFIX = html
PDF_PREFIX = pdf
PANDOC_OPTS = -s --toc -m --slide-level=1
TMP_EXTENSIONS = aux,log,nav,out,snm,tex,toc,vrb

all: pdf html

html: $(HTML_PREFIX)/$(FILENAME).html

$(HTML_PREFIX)/%.html: %.mdwn
	pandoc -f markdown -t s5 $(PANDOC_OPTS) $< > $@

pdf: $(FILENAME).pdf

%.pdf: $(PDF_PREFIX)/%.pdf
	cp $< $@

$(PDF_PREFIX)/%.pdf: %.tex
	pdflatex -output-directory=$(PDF_PREFIX) $^
	pdflatex -output-directory=$(PDF_PREFIX) $^
	pdflatex -output-directory=$(PDF_PREFIX) $^

%.tex: %.mdwn
	pandoc -f markdown -t beamer $(PANDOC_OPTS) $< > $@

clean-pdf:
	rm -rf $(PDF_PREFIX)/*


clean-html:
	rm -rf $(HTML_PREFIX)/$(FILENAME).html

clean: clean-pdf clean-html

wipe: clean
	rm -f *.pdf
