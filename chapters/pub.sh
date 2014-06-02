#!/bin/bash
# A bash script for publishing the dissertation.

# Version control information
echo "Updating revision information"
sh vc

file="$1"

echo "Generating PDF files"
#file="$1"
pandoc $file \
	--bibliography=/Users/jheppler/acad/bib/master.bib \
	--template xelatex.template \
	--csl=chicago-jah.csl \
	--latex-engine=xelatex \
	-o drafts/$file.pdf

echo "Generating Word files"
#file="$1"
pandoc $file \
	--bibliography=/Users/jheppler/acad/bib/master.bib \
	--csl=chicago-jah.csl \
	-o drafts/$file.docx

# hide the log
echo "Hiding log files"
mv "*.log" ".logged"

# delete all the junk files
echo "Removing temp files"
find . -name "*.log" -exec rm -rf {} \;
find . -name "*.aux" -exec rm -rf {} \;
find . -name "*.toc" -exec rm -rf {} \;
find . -name "*.blg" -exec rm -rf {} \;
find . -name "*.bbl" -exec rm -rf {} \;
find . -name "*.out" -exec rm -rf {} \;
find . -name "*.brf" -exec rm -rf {} \;
find . -name "*.tex-e" -exec rm -rf {} \;
find . -name "*.lof" -exec rm -rf {} \;
find . -name "*.lot" -exec rm -rf {} \;
find . -name "*.loa" -exec rm -rf {} \;
find . -name "*.bcf" -exec rm -rf {} \;
find . -name "*.gz" -exec rm -rf {} \;
find . -name "*.run.xml" -exec rm -rf {} \;
