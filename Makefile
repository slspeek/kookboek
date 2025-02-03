MAINNAME=kookboek
RUNLATEX_IMAGE=docker run --rm -t --workdir=/tmp --user="$(shell id -u):$(shell id -g)" --net=none  -v "$(shell pwd):/tmp" leplusorg/latex:sha-4a17317 
RUNLATEX=$(RUNLATEX_IMAGE)bash -c "pdflatex  --interaction batchmode $(MAINNAME).tex ; ls -l kookboek.pdf"
RUN_BOOKLET=$(RUNLATEX_IMAGE)pdfbook2 --paper=a4paper kookboek.pdf


default: clean print

print:
		$(RUNLATEX); $(RUNLATEX)

viewpdf: 
		$(RUNLATEX)
		open $(MAINNAME).pdf

booklet: print
		$(RUN_BOOKLET)

clean:
		rm tex/*.aux  *.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc; exit 0
