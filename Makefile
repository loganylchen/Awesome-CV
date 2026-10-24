.PHONY: all examples clean
.DELETE_ON_ERROR:

LATEX = xelatex
LATEXFLAGS = -interaction=nonstopmode -halt-on-error -file-line-error
EXAMPLES_DIR = examples
CV_PDFS = $(EXAMPLES_DIR)/cv.pdf $(EXAMPLES_DIR)/cv_zh.pdf
SAMPLE_PDFS = $(EXAMPLES_DIR)/resume.pdf $(EXAMPLES_DIR)/coverletter.pdf
SECTION_SRCS = $(wildcard $(EXAMPLES_DIR)/cv/*.tex $(EXAMPLES_DIR)/cv-zh/*.tex $(EXAMPLES_DIR)/resume/*.tex)

# Personal documents only; upstream templates are available via make examples.
all: $(CV_PDFS)

examples: all $(SAMPLE_PDFS)

$(EXAMPLES_DIR)/%.pdf: $(EXAMPLES_DIR)/%.tex awesome-cv.cls $(EXAMPLES_DIR)/cv-common.tex $(EXAMPLES_DIR)/profile.jpg $(SECTION_SRCS)
	$(LATEX) $(LATEXFLAGS) -output-directory=$(EXAMPLES_DIR) $<
	$(LATEX) $(LATEXFLAGS) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -f $(CV_PDFS) $(SAMPLE_PDFS) $(EXAMPLES_DIR)/*.aux $(EXAMPLES_DIR)/*.log $(EXAMPLES_DIR)/*.out
