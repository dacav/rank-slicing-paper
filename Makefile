.PHONY : all clean dir pics

PDFS := paper.pdf

OUTDIR := ./out

COMPILER := pdflatex
OPTS := -halt-on-error -interaction nonstopmode
OPTS += -output-directory $(OUTDIR)

COMMON :=

all: dir $(PDFS)

paper.pdf : paper.tex settings/defs.tex

clean:
	rm -rf $(PDFS) $(OUTDIR)

%.pdf : %.tex $(COMMON)
	pdflatex $(OPTS) $<
	pdflatex $(OPTS) $< >/dev/null
	mv $(OUTDIR)/$@ .

dir:
	mkdir -p $(OUTDIR)
