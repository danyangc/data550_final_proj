report.html: report.Rmd Code/03_render_report.R clean_data make_figure make_table
	Rscript Code/03_render_report.R

clean_data: 
	Rscript Code/00_clean_data.R
	
make_table: clean_data
	Rscript Code/01_make_table.R

make_figure: clean_data make_table
	Rscript Code/02_make_figure.R

.PHONY: install
install:
	Rscript -e 'if (!("renv" %in% row.names(installed.packages()))) {install.packages("renv")}'
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f Output/*.html && rm -f report.html && rm -f Derived_data/*
	
PROJECTFILES = report.Rmd Code/03_render_report.R Code/00_clean_data.R Code/01_make_table.R Code/02_make_figure.R
RENVFILES = renv.lock renv/activate.R renv/settings.json

final_project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t final_project_image .
	touch $@


report/report.html:
	docker run -v "$$(PWD)/report":/project/report danyangc/final_project_image

