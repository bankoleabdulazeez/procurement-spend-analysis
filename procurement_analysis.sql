-- Procurement Spend Analysis
-- Dataset table: spend_analysis_dataset
-- MySQL

-- 1. Total procurement spend
SELECT SUM(TotalCost) AS TotalSpend
FROM spend_analysis_dataset;

-- 2. Spend by category
SELECT
    Category,
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
GROUP BY Category
ORDER BY Spend DESC;

-- 3. Spend by supplier
SELECT
    Supplier,
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
GROUP BY Supplier
ORDER BY Spend DESC;

-- 4. Supplier transaction count
SELECT
    Supplier,
    COUNT(*) AS Transactions
FROM spend_analysis_dataset
GROUP BY Supplier
ORDER BY Transactions DESC;

-- 5. Supplier performance
SELECT
    Supplier,
    SUM(TotalCost) AS TotalSpend,
    COUNT(*) AS Transactions,
    AVG(TotalCost) AS AvgTransactionValue
FROM spend_analysis_dataset
GROUP BY Supplier
ORDER BY TotalSpend DESC;

-- 6. Supplier share of total spend
SELECT
    Supplier,
    ROUND(SUM(TotalCost), 2) AS Spend,
    ROUND(
        SUM(TotalCost) / SUM(SUM(TotalCost)) OVER () * 100,
        2
    ) AS SpendPercentage
FROM spend_analysis_dataset
GROUP BY Supplier
ORDER BY Spend DESC;

-- 7. Supplier x category spend
SELECT
    Supplier,
    Category,
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
GROUP BY Supplier, Category
ORDER BY Spend DESC;

-- 8. Highest supplier-category combination
SELECT
    Supplier,
    Category,
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
GROUP BY Supplier, Category
ORDER BY Spend DESC
LIMIT 1;

-- 9. Electronics spend
SELECT
    SUM(TotalCost) AS ElectronicsSpend
FROM spend_analysis_dataset
WHERE Category = 'Electronics';

-- 10. TechMart Electronics spend
SELECT
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
WHERE Category = 'Electronics'
  AND Supplier = 'TechMart Inc.';

-- 11. TechMart share of Electronics spend
SELECT
    SUM(CASE
        WHEN Category = 'Electronics'
         AND Supplier = 'TechMart Inc.'
        THEN TotalCost
        ELSE 0
    END)
    /
    SUM(CASE
        WHEN Category = 'Electronics'
        THEN TotalCost
        ELSE 0
    END)
    * 100 AS TechMart_Electronics_Percentage
FROM spend_analysis_dataset;

-- 12. Electronics savings scenarios
SELECT
    SUM(TotalCost) * 0.03 AS `3%_Potential_Savings`,
    SUM(TotalCost) * 0.05 AS `5%_Potential_Savings`,
    SUM(TotalCost) * 0.10 AS `10%_Potential_Savings`
FROM spend_analysis_dataset
WHERE Category = 'Electronics';

-- 13. Spend by item
SELECT
    ItemName,
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
GROUP BY ItemName
ORDER BY Spend DESC;

-- 14. Top 5 items by spend
SELECT
    ItemName,
    SUM(TotalCost) AS Spend
FROM spend_analysis_dataset
GROUP BY ItemName
ORDER BY Spend DESC
LIMIT 5;

-- 15. Laptop spend by supplier
SELECT
    Supplier,
    ROUND(SUM(TotalCost), 2) AS Total_Laptop_Spend,
    SUM(Quantity) AS Total_Laptop_Quantity,
    ROUND(SUM(TotalCost) / SUM(Quantity), 2) AS Effective_Price_Per_Laptop
FROM spend_analysis_dataset
WHERE ItemName = 'Laptop'
GROUP BY Supplier
ORDER BY Effective_Price_Per_Laptop ASC;

-- 16. ABC classification by item
WITH item_spend AS (
    SELECT
        ItemName,
        SUM(TotalCost) AS Spend
    FROM spend_analysis_dataset
    GROUP BY ItemName
),
item_percentage AS (
    SELECT
        ItemName,
        Spend,
        Spend / SUM(Spend) OVER () * 100 AS SpendPercentage
    FROM item_spend
),
item_cumulative AS (
    SELECT
        ItemName,
        Spend,
        SpendPercentage,
        SUM(SpendPercentage) OVER (
            ORDER BY Spend DESC
        ) AS CumulativePercentage
    FROM item_percentage
)
SELECT
    ItemName,
    Spend,
    SpendPercentage,
    CumulativePercentage,
    CASE
        WHEN CumulativePercentage <= 80 THEN 'A'
        WHEN CumulativePercentage <= 95 THEN 'B'
        ELSE 'C'
    END AS ABC_Class
FROM item_cumulative
ORDER BY Spend DESC;

-- 17. ABC spend summary
WITH item_spend AS (
    SELECT
        ItemName,
        SUM(TotalCost) AS Spend
    FROM spend_analysis_dataset
    GROUP BY ItemName
),
item_percentage AS (
    SELECT
        ItemName,
        Spend,
        Spend / SUM(Spend) OVER () * 100 AS SpendPercentage
    FROM item_spend
),
item_cumulative AS (
    SELECT
        ItemName,
        Spend,
        SpendPercentage,
        SUM(SpendPercentage) OVER (
            ORDER BY Spend DESC
        ) AS CumulativePercentage
    FROM item_percentage
),
item_classified AS (
    SELECT
        ItemName,
        Spend,
        SpendPercentage,
        CumulativePercentage,
        CASE
            WHEN CumulativePercentage <= 80 THEN 'A'
            WHEN CumulativePercentage <= 95 THEN 'B'
            ELSE 'C'
        END AS ABC_Class
    FROM item_cumulative
)
SELECT
    ABC_Class,
    ROUND(SUM(Spend), 2) AS TotalSpend,
    ROUND(
        SUM(Spend) / SUM(SUM(Spend)) OVER () * 100,
        2
    ) AS SpendPercentage
FROM item_classified
GROUP BY ABC_Class
ORDER BY ABC_Class;
