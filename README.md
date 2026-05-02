# Waste Composition and Treatment Across Income Groups and Regions

This repository contains materials for the final lab project for the course [EDS 213 - Databases and Data Management](https://ucsb-library-research-data-services.github.io/bren-eds213/). This course is part of the [UCSB Masters in Environmental Data Science](https://bren.ucsb.edu/masters-programs/master-environmental-data-science).

## Purpose

Solid waste management is one of the most visible and pressing environmental challenges facing cities and countries worldwide. How much food, plastic, or paper a community throws away — and what happens to it — varies enormously depending on where people live and how wealthy their country is.

This project uses the **What a Waste 3.0** database, published by the World Bank Group, to explore two connected questions:

> *How does waste composition differ across income groups and regions? And does a country's waste composition predict its recycling or open dumping rates?*

By building a relational database and querying it with SQL, this project connects city-level waste composition data with country-level treatment outcomes to surface patterns that cannot be seen by looking at either dataset alone.

## Repository Structure

```
eds213-final-project/
│
├── README.md                       # project overview and documentation
├── waste_data_cleaning.qmd         # data cleaning script (R/Quarto)
├── waste_data_analysis.sql         # analytical SQL queries
├── eds213-final-project.Rproj      # RStudio project file
├── RQ                              # research question notes
├── .gitignore
│
├── image/                          # figures and visuals
│
└── data/                           # not tracked by git (see Data Access below)
    ├── raw/                        # original Excel files downloaded from World Bank
    │   ├── what_a_waste_3_0_city_dataset.xlsx
    │   └── what_a_waste_3_0_country_dataset.xlsx
    ├── processed/                  # cleaned CSV files produced by waste_data_cleaning.qmd
    │   ├── city_cleaned.csv
    │   └── country_cleaned.csv
    └── database/                   # DuckDB database created in Lab 3
        └── waste_database.duckdb
```

## Data Access

A `data/` directory is created inside the `eds213-final-project` repository. Due to the large size of the files, the data folder is included in `.gitignore` and is not tracked by version control.

This project uses two datasets from the **What a Waste 3.0** global database, published by the World Bank Group.

**City Dataset** — One row per city (262 cities across 163 countries). Records waste composition by material type (food, plastic, paper, glass, metal, etc.) and waste treatment percentages (recycling, open dumping, landfill, etc.) at the city level.

**Country Dataset** — One row per country (217 countries). Records the same waste composition and treatment variables aggregated to the national level.

Both datasets are available for free download from the World Bank Data Catalog:

> World Bank Group. (2024). *What a Waste Global Database*. Retrieved from <https://datacatalog.worldbank.org/search/dataset/0039597/what-a-waste-global-database>

To reproduce this project:

1. Download both Excel files from the link above
2. Place them inside `data/raw/` in the project root
3. Run `waste_data_cleaning.qmd` to generate the cleaned CSVs in `data/processed/`
4. Open DuckDB and run the ingestion steps in `waste_data_analysis.sql` to create `data/database/waste_database.duckdb`
5. Run the remaining SQL queries in `waste_data_analysis.sql` to reproduce the analysis

## References & Acknowledgements

World Bank Group. (2024). *What a Waste Global Database*. World Bank Data Catalog. <https://datacatalog.worldbank.org/search/dataset/0039597/what-a-waste-global-database>

Kaza, S., Yao, L., Bhada-Tata, P., & Van Woerden, F. (2018). *What a Waste 2.0: A Global Snapshot of Solid Waste Management to 2050*. World Bank Publications. <https://openknowledge.worldbank.org/handle/10986/30317>

## Course Information

- **Course Title:** EDS 213 - Databases and Data Management
- **Term:** Spring 2026

### Teaching Team

- **Instructor:** Julien Brun ([jb160@ucsb.edu](mailto:jb160@ucsb.edu))
- **Instructor:** Greg Janée ([gjanee@ucsb.edu](mailto:gjanee@ucsb.edu))
- **Instructor:** Annie Adams ([aradams@ucsb.edu](mailto:aradams@ucsb.edu))
- **Instructor:** Renata Curty ([rcurty@ucsb.edu](mailto:rcurty@ucsb.edu))

Complete description for this project can be found on the **[EDS 213 Final Project](https://ucsb-library-research-data-services.github.io/bren-eds213/modules/labs/labs.html)**.

**Author:** Aakriti Poudel
