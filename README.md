# STA304 Paper 1 MaxLI

## Overview

This repository is designed to accompany the analysis and reporting for STA304 Paper 1, focusing on the relationship between crime data and MHA (Mental Health Act) reports. It provides all necessary scripts and data to replicate the analysis.

## File Structure

The repository is organized as follows:

-   **data/raw_data**\
    Contains the original raw data files, including `raw_data_mha.csv` and `raw_data_mci.csv`. These datasets are used for cleaning and analysis.
    The raw data is too big to upload to Github, therefore please run 01-download_data.R to download them to this path.

-   **data/analysis_data**\
    Holds the cleaned and processed datasets generated from the raw data after running the cleaning scripts.

-   **data/replication**\
    Stores the cleaned data along with prediction results. For example, `clean_data_with_predictions.csv` contains the results of model predictions based on cleaned data.

-   **data/simulated_data**\
    Stores the simulated data along with simulation results. For example, `simulated_data.csv` contains the results of simulations based on cleaned data.

-   **model**\
    Contains fitted models created from the regression analysis, including files like `crime_model.rds`.

-   **other**\
    Contains supplementary material such as literature reviews, datasheets, sketches, and LLM (Language Model) interaction logs. Subfolders include:

    -   **datasheet**: Contains `datasheet_template.qmd` and `datasheet_template.pdf`, providing motivation and composition details about the data.
    -   **lim**: A folder for limitation-related files.
    -   **literature**: Relevant literature reviewed for the project.
    -   **sketches**: Visual sketches for the paper's analysis.

-   **paper**\
    Contains the files for generating the paper, including Quarto documents, bibliographies, and final PDF versions of the report.

-   **scripts**\
    Holds the R scripts used for data simulation, cleaning, and analysis:

    -   `00-simulated_data.R`: Script for simulating datasets.
    -   `01-download_data.R`: Script for downloading raw data.
    -   `02-clean_data.R`: Script for cleaning and processing raw data.
    -   `03-analyze_data.R`: Script for analyzing the cleaned data.
    -   `04-model_data.R`: Script for fitting regression models.
    -   `05-visualize_results.R`: Script for visualizing analysis and model results.

## Statement on LLM Usage

Some aspects of this project were developed with assistance from Language Models. For example, sections of code and written summaries were supported by auto-complete and chat tools like Codriver and ChatGPT. The complete chat interaction history, providing transparency into how these tools were used, is available in `other/llms/usage.txt`.
