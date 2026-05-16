# ................ Environment Setup ................
# Run this script before anything else to install and load
# all R packages needed to reproduce this project.

# Install packages (run once)
install.packages("tidyverse")
install.packages("readxl")
install.packages("here")
install.packages("janitor")
install.packages("DBI")
install.packages("duckdb")
install.packages("dbplyr")
install.packages("scales")

# Load packages
library(tidyverse)   # data manipulation and ggplot2 visualizations
library(readxl)      # read raw Excel files
library(here)        # file paths relative to project root
library(janitor)     # clean column names
library(DBI)         # database connection interface
library(duckdb)      # DuckDB database engine
library(dbplyr)      # use dplyr verbs on database tables
library(scales)      # format axis labels in plots
