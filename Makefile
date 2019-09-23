BUILD_DIR = ./build

.PHONY: all

all: $(BUILD_DIR)/exportlist.bib $(BUILD_DIR)/iconip_2019.pdf

$(BUILD_DIR)/exportlist.bib: exportlist.bib
	mkdir -p $(BUILD_DIR)
	cp exportlist.bib $(BUILD_DIR)/
    
$(BUILD_DIR)/iconip_2019.pdf: iconip_2019.tex
	mkdir -p $(BUILD_DIR)
	xelatex -output-directory=$(BUILD_DIR) iconip_2019.tex
	cd $(BUILD_DIR) && bibtex iconip_2019.aux && cd ..
	xelatex -output-directory=$(BUILD_DIR) iconip_2019.tex
	xelatex -output-directory=$(BUILD_DIR) iconip_2019.tex