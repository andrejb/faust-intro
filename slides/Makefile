FILENAME = faust-intro
HTML_PREFIX = html
PANDOC_OPTS = -s --toc -m
TMP_EXTENSIONS = aux,log,nav,out,snm,tex,toc,vrb

all: pdf

html: $(HTML_PREFIX)/$(FILENAME).html

$(HTML_PREFIX)/%.html: %.mdwn
	pandoc -f markdown -t s5 $(PANDOC_OPTS) $< > $@

pdf: $(FILENAME).pdf

%.pdf: %.tex
	pdflatex $^
	pdflatex $^

%.tex: %.mdwn
	pandoc -f markdown -t beamer $(PANDOC_OPTS) $< > $@

clean:
	rm -rf *.{${TMP_EXTENSIONS}}

wipe: clean
	rm -rf $(HTML_PREFIX)/$(FILENAME).html *.pdf
