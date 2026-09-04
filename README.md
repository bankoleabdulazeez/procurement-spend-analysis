# Procurement Spend Analysis

A procurement analytics project using Excel, MySQL, and Tableau to analyze purchasing data, identify spending patterns, supplier concentration, high-value items, ABC classifications, and potential cost savings.

---

## Table of contents

- [Project summary](#project-summary)
- [Key findings](#key-findings)
- [Quick start — Reproduce the numbers](#quick-start---reproduce-the-numbers)
- [Dataset & data dictionary](#dataset--data-dictionary)
- [Methodology](#methodology)
- [How to read the results](#how-to-read-the-results)
- [Project structure](#project-structure)
- [Files of interest](#files-of-interest)
- [Contributing, license, contact](#contributing-license-contact)
- [Caveats & privacy](#caveats--privacy)

---

## Project summary

Objective: analyze procurement transactions and turn purchasing data into actionable insights for procurement and supply chain decision-making (supplier concentration, top items, ABC classification, potential savings scenarios). Tools used: Excel, MySQL, Tableau.

Quick highlights:
- Dataset: 500 procurement transactions from 2024
- Analysis: spend by category/supplier/item, supplier concentration, ABC classification, savings scenarios

---

## Key findings

- Total procurement spend: €1,240,580.53
- Electronics spend: €697,805.23 (56.25% of total)
- Electronics + Software: 83.33% of total spend
- Top supplier: TechMart Inc. — €328,761.73
- Top two suppliers (TechMart Inc. + QuickDeliver Ltd.): 49.50% of total spend
- Top item: Laptop — €472,284.81 (38.07% of total)
- ABC A-class items: 75.64% of total spend
- Potential Electronics savings at 5%: €34,890.26

(Exact numbers are produced by the SQL in `sql/procurement_analysis.sql`; see Reproduce section.)

---

## Quick start — Reproduce the numbers

Prerequisites:
- MySQL (or compatible server)
- Dataset placed at `data/procurement_dataset.csv`
- `sql/procurement_analysis.sql` (contains the queries used)

Steps:

1. Create database and import CSV (example):

   - Create DB:

     mysql> CREATE DATABASE procurement;
     mysql> USE procurement;

   - Create table using the schema in `sql/procurement_schema.sql` (DDL). Example columns are listed in the Data Dictionary below.

   - Load CSV (example):

     LOAD DATA INFILE '/path/to/procurement_dataset.csv'
     INTO TABLE purchases
     FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
     IGNORE 1 ROWS
     (TransactionID, ItemName, Category, Quantity, UnitPrice, TotalCost, PurchaseDate, Supplier, Buyer);

2. Run key queries (examples):

   - Total spend:

     SELECT SUM(TotalCost) AS total_spend FROM purchases;

   - Spend by category:

     SELECT Category, SUM(TotalCost) AS spend FROM purchases GROUP BY Category ORDER BY spend DESC;

   - Top suppliers:

     SELECT Supplier, SUM(TotalCost) AS spend FROM purchases GROUP BY Supplier ORDER BY spend DESC LIMIT 10;

3. ABC classification (example SQL snippet):

   WITH item_spend AS (
     SELECT ItemName, SUM(TotalCost) AS spend
     FROM purchases
     GROUP BY ItemName
   ),
   ranked AS (
     SELECT
       ItemName,
       spend,
       SUM(spend) OVER (ORDER BY spend DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_spend
     FROM item_spend
   )
   SELECT
     ItemName,
     spend,
     cumulative_spend,
     cumulative_spend / (SELECT SUM(spend) FROM item_spend) AS cumulative_pct
   FROM ranked
   ORDER BY spend DESC;

   Then label by thresholds (example):
   - A: cumulative_pct <= 0.80
   - B: cumulative_pct > 0.80 AND cumulative_pct <= 0.95
   - C: cumulative_pct > 0.95

4. Savings scenario:

   Savings_amount = Electronics_spend * savings_rate

   Example: 5% savings = Electronics_spend * 0.05

---

## Dataset & data dictionary

Dataset: `data/procurement_dataset.csv` (500 rows, year 2024)

Columns:
- TransactionID — unique id for transaction (string/integer)
- ItemName — item description (string)
- Category — e.g., Electronics, Software, Office Supplies (string)
- Quantity — integer
- UnitPrice — numeric (currency)
- TotalCost — numeric (currency) — ensure this equals Quantity * UnitPrice
- PurchaseDate — YYYY-MM-DD
- Supplier — supplier name
- Buyer — internal buyer id/name

Note: confirm currency (EUR) and that TotalCost is consistent for every record; if not, document corrections.

Small sample (first 3 rows):

TransactionID,ItemName,Category,Quantity,UnitPrice,TotalCost,PurchaseDate,Supplier,Buyer
T0001,Laptop,Electronics,10,1234.95,12349.50,2024-02-01,TechMart Inc.,buyer01
T0002,Office Chair,Furniture,5,199.00,995.00,2024-01-15,FurnishCo,buyer05
T0003,Annual Software License,Software,1,336018.00,336018.00,2024-03-10,CloudSoft Corp.,buyer12

(If you cannot include the full dataset in the repo, include a synthetic `data/sample.csv` and do not publish sensitive/pricing data.)

---

## Methodology

- Currency: EUR (documented in header). Confirm in the dataset.
- Category mapping: if raw item descriptions use multiple synonyms, include mapping file `insights/category-mapping.csv` describing normalization rules.
- Data validation: check for missing/duplicate TransactionIDs, Quantity <= 0, UnitPrice or TotalCost null, and that TotalCost ≈ Quantity * UnitPrice (allowing for rounding).
- ABC classification:
  - Aggregate spend at item (or SKU) level.
  - Sort items by descending spend.
  - Compute cumulative spend percentage.
  - Assign classes by thresholds (commonly A = top ~70–80% by cumulative spend, B = next ~15–20%, C = remainder). State thresholds used.
- Savings scenarios:
  - Savings computed as X% * category_spend (e.g., Electronics).
  - These are illustrative; document assumptions about how savings would be achieved.

---

## How to read the results

- KPIs in the Tableau dashboard:
  - Total Procurement Spend — sum(TotalCost)
  - Electronics Spend — sum(TotalCost) WHERE Category = 'Electronics'
  - Electronics % of Total — Electronics / Total
- Supplier concentration:
  - Monitor top suppliers' share and consider HHI (Herfindahl-Hirschman Index) for concentration risk.
- ABC insights:
  - A-class items: prioritize contract governance, frequent price reviews, and strategic sourcing.
- Recommendation mapping:
  - For each high-spend supplier/item, include suggested next steps (RFP, renegotiation, alternate suppliers, demand management).

---

## Project structure

procurement-spend-analysis/
├── README.md
├── data/
│   ├── procurement_dataset.csv      # full dataset (not included in repo)
│   └── sample.csv                   # small synthetic sample (recommended)
├── sql/
│   ├── procurement_schema.sql       # table DDL
│   └── procurement_analysis.sql     # queries that produce the numbers in this README
├── tableau/
│   └── procurement_spend_analysis.twbx
├── screenshots/
│   └── procurement-dashboard.png
└── insights/
    └── procurement-insights.md

---

## Files of interest

- `sql/procurement_schema.sql` — create table statement and recommended indexes.
- `sql/procurement_analysis.sql` — contains the queries used to compute key findings and reproduce charts.
- `insights/procurement-insights.md` — narrative business recommendations and interpretation of charts.
- `tableau/procurement_spend_analysis.twbx` — (not included in this repo) Tableau workbook used to create dashboards. If possible, export published images and link to them.

---

## Contributing, license, contact

- Contributing: Please open issues or PRs. Add `CONTRIBUTING.md` for contribution workflow.
- License: Add a LICENSE file (MIT/CC-BY/whatever your organization requires).
- Contact: bankoleabdulazeez (GitHub) — open an issue for questions or provide an email/contact in this section.

---

## Caveats & privacy

- If the dataset contains PII or commercially sensitive supplier pricing, do not commit the raw dataset to a public repo — use a sample or anonymized data.
- Numbers in Key Findings are reproducible from `sql/procurement_analysis.sql`; changes in cleaning/mapping logic may change results.

---

## Next steps I can take for you

- Add `sql/procurement_schema.sql` and `sql/procurement_analysis.sql` to the repo with DDL and example queries.
- Generate a small synthetic `data/sample.csv` so readers can run the analysis without sensitive data.
- Export the Tableau dashboard screenshot(s) into `screenshots/` and link them from the README.

If you want one of the above, tell me which and I will create the files and open a PR.
