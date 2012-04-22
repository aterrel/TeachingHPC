TALKS=20120323_TACC_Training.pdf

default: ${TALKS}

%.pdf: %.tex
	TEXINPUTS=../tex:${TEXINPUTS} pdflatex -shell-escape $<
	TEXINPUTS=../tex:${TEXINPUTS} pdflatex -shell-escape $<


clean:
	rm -f *.aux *.bbl *.log *.blg *.toc *.nav *.out *.snm *.vrb *~

cleaner: clean
	rm -f ${TALKS}
