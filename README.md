# Final Project By Danyang Chen

This repository contains the R Markdown analysis for my final project. It includes a `Makefile` to streamline running the analysis, and separate folders for code and outputs.

## Description 

The final project focuses on analyzing COVID-19 mortality data from the dataset titled "Provisional COVID-19 Deaths by Place of Death and State". This dataset, sourced from official records, provides insights into COVID-19 deaths.

- Analyze trends in COVID-19 mortality by state.
- Visualize changes in death rates over time.


## Repository Structure

The repository is organized as follows:

-   **report.Rmd**: The main R Markdown file for the analysis.
-   **Makefile**: Automates the process of running the analysis and generating the output.
-   **Code/**: Contains any supporting R scripts or functions used in the analysis.
-   **Data/**: Contains raw data.
-   **Derived_data/**: Contains cleaned data for analysis.
-   **Output/**: Stores the results and generated files from the analysis.

## Locating the Required Table and Figure Code

- Required Table:
  - The code for creating the required table is located in the **code/table_code.R file**.
  - The table is generated automatically when running the **Makefile** or **knitting final_project_2.Rmd**.
- Required Figure:
  - The code for creating the required figure is located in the **code/figure_code.R file**.
  - The figure is generated automatically when running the **Makefile** or **knitting final_project_2.Rmd**.
 
## Generate Report

 - Ensure all necessary R packages are installed.
   - **dplyr**
   - **lubridate**
   - **webshot2**
   - **gt**
   - **ggplot2**
   - **here**
   - will update with **renv** later
- Use the Makefile to execute the analysis and generate the report
  - use **make** command
