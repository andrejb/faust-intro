FILENAME = faust-intro
HTML_PREFIX = html
PANDOC_OPTS = -s --toc -m

html: $(HTML_PREFIX)/$(FILENAME).html

$(HTML_PREFIX)/%.html: %.mdwn
	pandoc -f markdown -t s5 $(PANDOC_OPTS) $< > $@

%.pdf: %.mdwn
	markdown2pdf $< > $@

clean:
	rm -rf $(HTML_PREFIX)/$(FILENAME).html
