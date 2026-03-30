MAINNAME=kookboek
TARGET=pdf
LATEX_IMAGE=leplusorg/latex:sha-4a17317
RUN_LATEX_IMAGE=docker run \
						--rm \
						-t --workdir=/tmp \
						--user="$(shell id -u):$(shell id -g)" \
						--net=none \
						-v "$(shell pwd):/tmp" \
						-e "TEXINPUTS=/tmp/tex:$$TEXINPUTS" \
						 $(LATEX_IMAGE)
RUN_LATEX=$(RUN_LATEX_IMAGE) pdflatex  --interaction batchmode --output-directory=/tmp/pdf $(MAINNAME).tex
RUN_BOOKLET=$(RUN_LATEX_IMAGE) sh -c 'cd /tmp/$(TARGET) && pdfbook2 --paper=a4paper $(MAINNAME).pdf'
SPELLCHECK_CMD=aspell check -t -p $(PWD)/aspell.ignore.list -l nl 
LINKCHECK_CMD=$(HOME)/.local/bin/pdfx -c $(TARGET)/$(MAINNAME).pdf


default: clean print

install_deps:
	sudo apt update
	sudo apt install -y aspell aspell-nl pipx
	pipx install pdfx

spellcheck:
	for FILE in $(MAINNAME).tex $(shell ls tex/*.tex); do \
		$(SPELLCHECK_CMD) $$FILE; \
	done

linkcheck: print
	$(LINKCHECK_CMD)

print:
	mkdir -p $(TARGET)
	$(RUN_LATEX); $(RUN_LATEX)

viewpdf: 
	mkdir -p $(TARGET)
	$(RUN_LATEX)
	open $(TARGET)/$(MAINNAME).pdf

booklet: print
	$(RUN_BOOKLET)
	mv $(TARGET)/$(MAINNAME)-book.pdf $(TARGET)/$(MAINNAME)-a5boekje.pdf

clean:
	rm -rf $(TARGET)
