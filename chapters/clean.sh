#!/bin/bash

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
find . -name "*.xml" -exec rm -rf {} \;