# Phase 1 Project: Movie Data Pipeline & Foundation Analysis 🎬

## 📌 Project Overview
This project is part of the **Data Engineer Foundation Phase (Months 1–2)**.  
The main goal was to build a **localized ETL pipeline** to process raw movie datasets into a structured SQLite database.

Instead of simple data analysis, this project emphasizes the **engineering process**: cleaning semi-structured data, handling multi-valued attributes, and ensuring data types are correctly mapped for relational storage.

**Core Objectives:**
- **Data Cleaning:** Implement automated preprocessing using `pandas`.  
- **Schema Design:** Design a flat-file relational table in SQLite.  
- **ETL Workflow:** Transition data from raw CSV to a query-ready SQL environment (manual/scripted).

---

## 🛠️ Technical Stack
- **Language:** Python 3.x  
- **Data Manipulation:** Pandas  
- **Database Engine:** SQLite  
- **Environment:** Command-line / shell, Git, VS Code / Jupyter Notebook  
- **Data Source:** Raw Movie Dataset (CSV)  

---

## 🏗️ Data Pipeline (ETL) Workflow
The project follows a **standard local pipeline architecture**:

**Extract:**  
- Ingest raw, unformatted movie data from `data/raw/movies.csv`.

**Transform:**  
- **Date Standardization:** Convert strings to datetime objects and extract `release_year`.  
- **Data Normalization:** Normalize multi-valued genre column using `.explode()` to transform comma-separated strings into individual rows.  
- **Filtering:** Focus on the 2017–2022 timeframe.  
- **Quality Control:** Drop null values in critical columns (`genre`, `popularity`).  

**Load:**  
- Export the cleaned data to `data/processed/` and initialize a structured table in SQLite.

---

## 📂 Project Structure
Phase-1-project/
│
├── data/
│ ├── raw/ # Original CSV files
│ └── processed/ # Cleaned CSV files ready for SQL import
│
├── sql/
│ └── analysis.sql # DDL (Table Schema) and DML (Analytical Queries)
│
├── src/
│ └── clean_movies.py # Python script for the transformation logic
│
└── README.md

---

## 🗄️ Database Schema (SQLite)

The data is stored in the `movies` table with the following structure:

| Column        | Type | Description |
|---------------|------|-------------|
| title         | TEXT | Movie title |
| genre         | TEXT | Individual genre (normalized) |
| release_date  | TEXT | Full release date (ISO format) |
| popularity    | TEXT | Popularity score (to be cast during aggregation) |
| release_year  | TEXT | Extracted year for indexing/filtering |

---

## 📊 Analytical Query & Results

**Query: Top 10 most popular genres (2017–2022)**

```sql
SELECT
    genre,
    COUNT(*) AS total_movies,
    SUM(CAST(popularity AS REAL)) AS total_popularity
FROM movies
WHERE CAST(release_year AS INTEGER) >= 2017
GROUP BY genre
ORDER BY total_popularity DESC
LIMIT 10;
```
---

## 📊 Key Insights

- **Action** and **Adventure** dominate popularity metrics.  
- Normalizing multi-valued genres allowed for accurate counts per category.

---

## 🧠 Key Learnings (Data Engineering Foundation)

- **Normalization Basics:** Making data “atomic” for SQL operations.  
- **Type Casting:** Handling discrepancies between CSV strings and SQL types (REAL/INTEGER).  
- **Pipeline Reproducibility:** Structuring scripts to allow repeated ETL runs.  
- **Version Control:** Using Git to manage scripts and document project evolution.

---

## 🚀 Future Roadmap

- **Phase 2:** Migrate from SQLite to PostgreSQL/MySQL and design ERD for data modeling.  
- **Automation:** Implement Python-based database connector (`sqlite3` or `SQLAlchemy`) or Bash automation for local ETL.  
- **Validation:** Add data quality checks (e.g., ensuring popularity is never negative).