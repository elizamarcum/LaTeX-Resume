JUNK_FILES := $(wildcard *.aux *.fls *.log styles/*.aux *.dvi *.pdf)
TEX_FILES := $(wildcard *.tex)
OUTPUT_FILES = $(TEX_FILES:tex=pdf)

release: clear view

view: $(OUTPUT_FILES)
	@echo "The list of files: $^"
	open $^

%.pdf: %.tex
	lualatex $<

clear:
	rm -rf $(OUTPUT_FILES)

clean:
	rm -rf $(JUNK_FILES)

# Future Eliza: Next time you've forgotten all of this stuff,
# remember https://makefiletutorial.com/
