export PATH:=/sbin:/usr/sbin:${PATH}

viewpdf:
		pdflatex vega-boek.tex; xpdf vega-boek.pdf

prepare:
		sudo apt-get install texlive xpdf 

clean:
		rm *.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc
