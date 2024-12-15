# Final Project By Danyang Chen

This repository contains the R Markdown analysis for my final project. It includes a `Makefile` to streamline running the analysis, and separate folders for code and outputs.

## Description

The final project focuses on analyzing COVID-19 mortality data from the dataset titled "Provisional COVID-19 Deaths by Place of Death and State". This dataset, sourced from official records, provides insights into COVID-19 deaths.

-   Analyze trends in COVID-19 mortality by state.
-   Visualize changes in death rates over time.

## Automated report generation using Docker

Navigate to the this project directory using `cd /.../this folder` command in the Terminal.

The docker image for this project is located at <https://hub.docker.com/repository/docker/danyangc/final_report_image/general>.

But you do not need pull this image manually

Use `make report/report.html` command in Terminal and the report will be build automatically.

## Automated report generation using Docker

Use `make final_report_image` command in Terminal to build the image locally.

Then run `docker run -v "$(pwd)/report":/home/rstudio/final_project/report final_report_image` in the terminal to generate the report

## Repository Structure

The repository is organized as follows:

-   **report.Rmd**: The main R Markdown file for the analysis.
-   **Makefile**: Automates the process of running the analysis and generating the output.
-   **Code/**: Contains any supporting R scripts or functions used in the analysis.
-   **Data/**: Contains raw data.
-   **Derived_data/**: Contains cleaned data for analysis.
-   **Output/**: Stores the results and generated files from the analysis.
-   **renv/**: Locking package versions

## Locating the Required Table and Figure Code

-   Required Table:
    -   The code for creating the required table is located in the **code/table_code.R file**.
    -   The table is generated automatically when running the **Makefile** or **knitting final_project_2.Rmd**.
-   Required Figure:
    -   The code for creating the required figure is located in the **code/figure_code.R file**.
    -   The figure is generated automatically when running the **Makefile** or **knitting final_project_2.Rmd**.

## Synchronize Your Package Repository

To ensure your R environment is consistent and all necessary packages are synchronized:

1.  **Install the `renv` package**:

    ``` r
    install.packages("renv")
    ```

2.  Use **make install** command to synchronize package repository

## Generate Report

-   Use the Makefile to execute the analysis and generate the report
    -   use **make** command
