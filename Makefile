MAINNAME=kookboek
LATEX_IMAGE=leplusorg/latex:sha-4a17317
RUN_LATEX_IMAGE=docker run \
						--rm \
						-t --workdir=/tmp \
						--user="$(shell id -u):$(shell id -g)" \
						--net=none \
						-v "$(shell pwd):/tmp" \
						$(LATEX_IMAGE)
RUN_LATEX=$(RUN_LATEX_IMAGE) pdflatex  --interaction batchmode $(MAINNAME).tex
RUN_BOOKLET=$(RUN_LATEX_IMAGE) pdfbook2 --paper=a4paper $(MAINNAME).pdf


default: clean print

print:
		$(RUN_LATEX); $(RUN_LATEX)

viewpdf: 
		$(RUN_LATEX)
		open $(MAINNAME).pdf

booklet: print
		$(RUN_BOOKLET)
		mv $(MAINNAME)-book.pdf $(MAINNAME)-a5boekje.pdf

clean:
		rm tex/*.aux  *.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc; exit 0
