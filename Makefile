SHELL=/bin/bash
export PATH:=/sbin:/usr/sbin:${PATH}
MAINNAME=kookboek
RUNLATEX=pdflatex --interaction batchmode $(MAINNAME).tex

viewpdf:
		$(RUNLATEX); $(RUNLATEX);xpdf $(MAINNAME).pdf

prepare:
		sudo apt-get install $$(cat debian-dependencies)

clean:
		rm {tex/,}*.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc
