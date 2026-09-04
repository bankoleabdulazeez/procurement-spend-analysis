-- procurement_analysis.sql
-- Queries to reproduce the key figures in the README

-- 1) Total procurement spend
SELECT SUM(TotalCost) AS total_spend
FROM purchases;

-- 2) Spend by category (descending)
SELECT Category, SUM(TotalCost) AS spend, ROUND(SUM(TotalCost) / (SELECT SUM(TotalCost) FROM purchases) * 100, 2) AS pct_of_total
FROM purchases
GROUP BY Category
ORDER BY spend DESC;

-- 3) Top suppliers (by spend)
SELECT Supplier, SUM(TotalCost) AS spend, ROUND(SUM(TotalCost) / (SELECT SUM(TotalCost) FROM purchases) * 100, 2) AS pct_of_total
FROM purchases
GROUP BY Supplier
ORDER BY spend DESC
LIMIT 20;

-- 4) Supplier × Category spend (heatmap source)
SELECT Supplier, Category, SUM(TotalCost) AS spend
FROM purchases
GROUP BY Supplier, Category
ORDER BY Supplier, spend DESC;

-- 5) Top items by spend
SELECT ItemName, SUM(TotalCost) AS spend, COUNT(*) AS transactions
FROM purchases
GROUP BY ItemName
ORDER BY spend DESC
LIMIT 20;

-- 6) Electronics spend and percentage of total
SELECT
  SUM(CASE WHEN Category = 'Electronics' THEN TotalCost ELSE 0 END) AS electronics_spend,
  ROUND( SUM(CASE WHEN Category = 'Electronics' THEN TotalCost ELSE 0 END) / (SELECT SUM(TotalCost) FROM purchases) * 100, 2) AS electronics_pct
FROM purchases;

-- 7) Savings scenarios for Electronics
-- Replace 0.05 with desired savings rate
SELECT
  SUM(CASE WHEN Category = 'Electronics' THEN TotalCost ELSE 0 END) AS electronics_spend,
  SUM(CASE WHEN Category = 'Electronics' THEN TotalCost ELSE 0 END) * 0.03 AS savings_3pct,
  SUM(CASE WHEN Category = 'Electronics' THEN TotalCost ELSE 0 END) * 0.05 AS savings_5pct,
  SUM(CASE WHEN Category = 'Electronics' THEN TotalCost ELSE 0 END) * 0.10 AS savings_10pct
FROM purchases;

-- 8) ABC classification at item level (A <= 80%, B <= 95%, C > 95%)
WITH item_spend AS (
  SELECT ItemName, SUM(TotalCost) AS spend
  FROM purchases
  GROUP BY ItemName
),
ranked AS (
  SELECT
    ItemName,
    spend,
    SUM(spend) OVER (ORDER BY spend DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_spend,
    SUM(spend) OVER () AS total_spend
  FROM item_spend
)
SELECT
  ItemName,
  spend,
  cumulative_spend,
  ROUND(cumulative_spend / total_spend, 4) AS cumulative_pct,
  CASE
    WHEN cumulative_spend / total_spend <= 0.80 THEN 'A'
    WHEN cumulative_spend / total_spend <= 0.95 THEN 'B'
    ELSE 'C'
  END AS abc_class
FROM ranked
ORDER BY spend DESC;

-- 9) Top supplier contribution to electronics
SELECT Supplier, SUM(TotalCost) AS electronics_spend, ROUND(SUM(TotalCost) / (SELECT SUM(TotalCost) FROM purchases WHERE Category = 'Electronics') * 100, 2) AS pct_of_electronics
FROM purchases
WHERE Category = 'Electronics'
GROUP BY Supplier
ORDER BY electronics_spend DESC;

-- 10) Helper: Check data quality — rows where TotalCost differs from Quantity * UnitPrice by > 0.5
SELECT TransactionID, ItemName, Quantity, UnitPrice, TotalCost, (Quantity * UnitPrice) AS expected_total, (TotalCost - (Quantity * UnitPrice)) AS delta
FROM purchases
WHERE ABS(TotalCost - (Quantity * UnitPrice)) > 0.5;
