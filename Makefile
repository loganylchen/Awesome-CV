.PHONY: examples all clean

CC = xelatex
CN_CC = 
EXAMPLES_DIR = examples
PDF_DIR = pdfout
RESUME_DIR = examples/resume
CV_DIR = examples/cv
CV_ZH_DIR = examples/cv-zh
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CV_ZH_SRCS = $(shell find $(CV_ZH_DIR) -name '*.tex')
# Find all .tex files directly in examples directory (not subdirectories)
TEX_FILES = $(shell find $(EXAMPLES_DIR) -maxdepth 1 -name '*.tex' -type f)
# Convert .tex files to .pdf targets
PDF_TARGETS = $(patsubst $(EXAMPLES_DIR)/%.tex,%.pdf,$(TEX_FILES))

all: $(PDF_TARGETS)
examples: all PRINT

PRINT: 
	echo $(TEX_FILES)  


# Generic rule to build PDF from any .tex file
%.pdf: $(EXAMPLES_DIR)/%.tex  $(RESUME_SRCS) $(CV_SRCS) $(CV_ZH_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR)/ $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
