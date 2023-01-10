export PATH:=/sbin:/usr/sbin:${PATH}
RUNLATEX=pdflatex --interaction batchmode vega-boek.tex

viewpdf:
		$(RUNLATEX); $(RUNLATEX);xpdf vega-boek.pdf

prepare:
		sudo apt-get install $$(cat debian-dependencies)

clean:
		rm *.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc
