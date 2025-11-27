.PHONY: examples

CC = xelatex
CN_CC = 
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
PDF_DIR= pdfout
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv cv_2page_zh resume cv_cn cv_compute_zh, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(PDF_DIR) $<

cv_2page_zh.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(PDF_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv_2page_zh.tex $(CV_SRCS)
	$(CC) -output-directory=$(PDF_DIR) $<


cv_cn.pdf: $(EXAMPLES_DIR)/cv_cn.tex $(CV_SRCS)
	$(CC) -output-directory=$(PDF_DIR) $<


cv_compute_zh.pdf: $(EXAMPLES_DIR)/cv_compute_zh.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(PDF_DIR) $<

clean:
	rm -rf $(PDF_DIR)/*.pdf
