FROM rocker/rstudio:4.4.1


RUN mkdir /home/rstudio/final_project
WORKDIR /home/rstudio/final_project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

COPY Makefile . 
COPY report.Rmd .

RUN mkdir Code
RUN mkdir Data
RUN mkdir Derived_data
RUN mkdir Output

COPY Code Code
COPY Data Data
COPY Makefile .
COPY report.Rmd .

RUN mkdir -p /home/rstudio/final_project/report

CMD make && mv report.html /home/rstudio/final_project/report/

