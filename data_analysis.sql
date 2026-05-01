-- EDS 213: Final Project Data Analysis
-- What a Waste 3.0 Database
-- Author: Aakriti Poudel
-- Date: 2026-04-23


-- Research Question:
-- How does waste composition differ across income groups and regions?
-- And does a country's waste composition predict its recycling or open dumping rates?

-- Table overview:
-- city_data columns: iso3c, country_name, city_name, city_code, income_id, region_id, food_pct, plastic_pct,
    -- paper_pct, glass_pct, metal_pct, other_pct, recycling_pct, open_dump_pct, income_label

-- country_data columns: iso3c, country_name, income_id, region_id, food_pct, plastic_pct, paper_pct,
    -- glass_pct, metal_pct, other_pct, open_dump_pct, recycling_pct, income_label

-- Join key: iso3c (shared by both tables)
-- Relationship: many cities belongs to one country (many-to-one)


-- QUERY 1: How does waste composition differ by income group?
-- I group cities by income level and calculate the average % of food, plastic, and paper in their waste.
-- This answers the first part of the research question.
-- Both tables are used: city_data provides the composition, and the JOIN to country_data confirms each city
-- has a valid country match.

SELECT
    c.income_id,
    c.income_label,
    COUNT(c.city_code) AS number_of_cities,
    ROUND(AVG(c.food_pct), 3) AS avg_food_pct,
    ROUND(AVG(c.plastic_pct), 3) AS avg_plastic_pct,
    ROUND(AVG(c.paper_pct), 3) AS avg_paper_pct
FROM city_data c
JOIN country_data n ON c.iso3c = n.iso3c
WHERE c.income_id IS NOT NULL
  AND c.food_pct IS NOT NULL
GROUP BY c.income_id, c.income_label
ORDER BY avg_food_pct DESC;


-- QUERY 2: How does waste composition differ by world region?
-- Same idea as Query 1 but grouped by region instead of income group. 
-- This shows whether geography, not just income, shapes what people throw away.

SELECT
    c.region_id,
    COUNT(c.city_code) AS number_of_cities,
    ROUND(AVG(c.food_pct), 3) AS avg_food_pct,
    ROUND(AVG(c.plastic_pct), 3) AS avg_plastic_pct,
    ROUND(AVG(c.paper_pct), 3) AS avg_paper_pct
FROM city_data c
JOIN country_data n ON c.iso3c = n.iso3c
WHERE c.region_id IS NOT NULL
  AND c.food_pct IS NOT NULL
GROUP BY c.region_id
ORDER BY avg_food_pct DESC;


-- QUERY 3: Does waste composition predict open dumping rates?
-- This helps answer second part of my research question.
-- I joined city-level food wastes % with country-level open dumping rates, grouped by income group.
-- If food waste goes up as open dumping goes up, that suggests
-- lower-income countries (which have more food waste) also rely more on open dumping.

SELECT
    c.income_id,
    c.income_label,
    ROUND(AVG(c.food_pct), 3) AS avg_city_food_pct,
    ROUND(AVG(c.plastic_pct), 3) AS avg_city_plastic_pct,
    ROUND(AVG(n.open_dump_pct), 3) AS avg_country_open_dump_pct,
    ROUND(AVG(n.recycling_pct), 3) AS avg_country_recycling_pct,
    COUNT(c.city_code) AS number_of_cities
FROM city_data c
JOIN country_data n ON c.iso3c = n.iso3c
WHERE c.income_id IS NOT NULL
  AND c.food_pct IS NOT NULL
  AND n.open_dump_pct IS NOT NULL
GROUP BY c.income_id, c.income_label
ORDER BY avg_country_open_dump_pct DESC;


-- QUERY 4: Which regions recycle the most and dump the most?
-- Shows whether open dumping and recycling rates differ by world region,
-- using country-level treatment data joined to city-level data.

SELECT
    c.region_id,
    ROUND(AVG(n.recycling_pct), 3) AS avg_country_recycling_pct,
    ROUND(AVG(n.open_dump_pct), 3) AS avg_country_open_dump_pct,
    COUNT(c.city_code) AS number_of_cities
FROM city_data c
JOIN country_data n ON c.iso3c = n.iso3c
WHERE c.region_id IS NOT NULL
  AND n.recycling_pct IS NOT NULL
GROUP BY c.region_id
ORDER BY avg_country_recycling_pct DESC;