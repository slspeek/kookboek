SHELL=/bin/bash
MAINNAME=kookboek
RUNLATEX=docker run -i --rm -t --workdir=/tmp --user="$(shell id -u):$(shell id -g)" --net=none  -v "$(shell pwd):/tmp" leplusorg/latex bash -c "pdflatex  --interaction batchmode $(MAINNAME).tex ; ls -l kookboek.pdf"

default: clean print

print:
		$(RUNLATEX); $(RUNLATEX)

viewpdf: 
		$(RUNLATEX)
		open $(MAINNAME).pdf

clean:
		rm {tex/,}*.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc; exit 0
