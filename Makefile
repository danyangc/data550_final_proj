report.html: report.rmd Code/03_render_report.R clean_data make_figure make_table
	Rscript Code/03_render_report.R

clean_data: 
	Rscript Code/00_clean_data.R
	
make_table: clean_data
	Rscript Code/01_make_table.R

make_figure: clean_data make_table
	Rscript Code/02_make_figure.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f Output/*.png && rm -f report.html && rm -f Derived_data/*