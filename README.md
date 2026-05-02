# What a Waste

## Exploring waste composition across income groups and regions

This repository contains materials for the final project for the course [EDS 213: Databases and Data Management](https://ucsb-library-research-data-services.github.io/bren-eds213/). This course is part of the [UCSB Masters in Environmental Data Science](https://bren.ucsb.edu/masters-programs/master-environmental-data-science).

### Purpose

Solid waste is growing faster than cities can manage it and it's a problem no country has fully solved. What a community throws away and what happens to it varies widely depending on where people live and how wealthy their country is. Understanding these differences requires looking at the data closely.

This project uses the **What a Waste 3.0** database from the World Bank Group to explore the following research question:

> *How does waste composition differ across income groups and regions? And can a country's waste composition predict its recycling or open dumping rates?*

Using a relational database and SQL, it links city-level waste composition data with country-level treatment outcomes, revealing patterns that neither dataset could show alone.

### Repository Structure

```
eds213-final-project/
├── README.md                        
├── waste_data_cleaning.qmd          
├── waste_data_analysis.sql         
├── eds213-final-project.Rproj       
├── requirements.txt                 
├── image/                        
└── .gitignore
    └── data/
        ├── raw/                         
        │   ├── what_a_waste_3_0_city_dataset.xlsx
        │   └── what_a_waste_3_0_country_dataset.xlsx
        ├── processed/                   
        │   ├── city_cleaned.csv
        │   └── country_cleaned.csv
        └── database/                    
            └── waste_database.duckdb
```

### Data Access

A `data/` directory is created inside the `eds213-final-project` repository. Due to the large size of the files, the data folder is included in `.gitignore` and is not tracked by version control.

This project uses two datasets from the **What a Waste 3.0** global database, published by the World Bank Group.

**City Dataset:** The dataset has one row per city (262 cities across 163 countries). Records waste composition by material type (food, plastic, paper, glass, metal, etc.) and waste treatment percentages (recycling, open dumping, landfill, etc.) at the city level.

**Country Dataset:** The dataset has one row per country (217 countries). Records the same waste composition and treatment variables aggregated to the national level.

Both datasets are available for free download from the World Bank Data Catalog:

> World Bank Group. (2024). *What a Waste Global Database*. Retrieved from <https://datacatalog.worldbank.org/search/dataset/0039597/what-a-waste-global-database>

To reproduce this project:

1. Download both Excel files from the link above.
2. Place them inside `data/raw/` in the project root.
3. Run `waste_data_cleaning.qmd` to generate the cleaned CSVs in `data/processed/`.
4. Open DuckDB and run the ingestion steps in `waste_data_analysis.sql` to creat `data/database/waste_database.duckdb`.
5. Run the remaining SQL queries in `waste_data_analysis.sql` to reproduce the analysis.

### References & Acknowledgements

World Bank Group. (2024). *What a Waste Global Database*. World Bank Data Catalog. <https://datacatalog.worldbank.org/search/dataset/0039597/what-a-waste-global-database>

Kaza, S., Yao, L., Bhada-Tata, P., & Van Woerden, F. (2018). *What a Waste 2.0: A Global Snapshot of Solid Waste Management to 2050*. World Bank Publications. <https://openknowledge.worldbank.org/handle/10986/30317>

### Course Information

- **Course Title:** EDS 213: Databases and Data Management
- **Term:** Spring 2026

### Teaching Team

- **Instructor:** Julien Brun ([jb160@ucsb.edu](mailto:jb160@ucsb.edu))
- **Instructor:** Greg Janée ([gjanee@ucsb.edu](mailto:gjanee@ucsb.edu))
- **Instructor:** Annie Adams ([aradams@ucsb.edu](mailto:aradams@ucsb.edu))
- **Instructor:** Renata Curty ([rcurty@ucsb.edu](mailto:rcurty@ucsb.edu))

**Author:** Aakriti Poudel
