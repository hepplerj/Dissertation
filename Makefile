MD   := $(wildcard *.md)
PDF  := $(patsubst %.md,%.md.pdf, $(wildcard *.md))
TEX  := $(patsubst %.md,%.md.tex, $(wildcard *.md))
DOCX := $(patsubst %.md,%.md.docx, $(wildcard *.md))

dissertation.Heppler.pdf: dissertation.Heppler.tex $(TEX) epigraph.dissertation.Heppler.tex
	latexmk $<

all: dissertation.Heppler.pdf $(PDF) $(DOCX)

%.md.pdf: %.md
	pandoc $< -o $@ -V documentclass:acadpaper -V fontsize:12pt

%.md.tex: %.md
	pandoc $< --bibliography="/Users/jasonheppler/Dropbox/acad/bib/master.bib" --csl=chicago-jah.csl -o $@

%.md.docx: %.md
	pandoc $< --filter pandoc-citeproc --bibliography="/Users/jasonheppler/Dropbox/acad/bib/master.bib" --csl=chicago-jah.csl -o $@ --smart

clean:
	latexmk -c

clobber: clean
	rm -f $(PDF)
	rm -f $(TEX)
	rm -f $(DOCX)
	rm -f dissertation.Heppler.pdf

.PHONY : clean clobber

