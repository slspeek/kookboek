export PATH:=/sbin:/usr/sbin:${PATH}

viewpdf:
		pdflatex vega-boek.tex; xpdf vega-boek.pdf

viewhtml:
		htlatex vega-boek.tex "vega-boek,charset=utf-8" "-cunihtf -utf8" ; x-www-browser vega-boek.html
			#htlatex vega-boek.tex vega-boek ; x-www-browser vega-boek.html

prepare:
		sudo apt-get install texlive xpdf 

clean:
		rm *.aux *.lg *.4* *.image.* *.htoc *.html *.css *.dvi *.haux *.pdf *.log *.out *.idv *.tmp *.xref *.toc

