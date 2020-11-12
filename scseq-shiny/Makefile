run: scseq-shiny.R
	cp scseq-shiny.R app.R
	Rscript -e 'library(shiny);runApp("app.R")'

clean:
	rm -rf ._*
	rm -rf *.zip

install:
	cp -r * ../../shiny-server/

