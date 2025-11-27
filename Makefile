.PHONY: examples all clean

CC = xelatex
CN_CC = 
EXAMPLES_DIR = examples


# Find all .tex files directly in examples directory (not subdirectories)
TEX_FILES = $(shell find $(EXAMPLES_DIR) -maxdepth 1 -name '*.tex' -type f)
# Convert .tex files to .pdf targets
PDF_TARGETS = $(patsubst $(EXAMPLES_DIR)/%.tex,%.pdf,$(TEX_FILES))

all: $(PDF_TARGETS)
examples: all

# Generic rule to build PDF from any .tex file
%.pdf: $(EXAMPLES_DIR)/%.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
