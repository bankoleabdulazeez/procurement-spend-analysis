# Procurement Spend Analysis

A procurement analytics project using Excel, SQL, and Tableau to analyze purchasing data, identify spending patterns, supplier concentration, high-value items, ABC classifications, and potential cost-saving opportunities.

## Objective

Analyze procurement transactions and turn purchasing data into actionable insights for procurement and supply chain decision-making.

## Tools

- Excel
- MySQL
- Tableau

## Dataset

The analysis uses a company purchasing dataset containing 500 procurement transactions from 2024.

Columns:
- TransactionID
- ItemName
- Category
- Quantity
- UnitPrice
- TotalCost
- PurchaseDate
- Supplier
- Buyer

## Key Findings

- **Total procurement spend:** €1,240,580.53
- **Electronics spend:** €697,805.23
- **Electronics share of total spend:** 56.25%
- **Electronics + Software:** 83.33% of total spend
- **Top supplier:** TechMart Inc. — €328,761.73
- **Top two suppliers:** TechMart Inc. + QuickDeliver Ltd. — 49.50% of total spend
- **Top item:** Laptop — €472,284.81
- **Laptop share of total spend:** 38.07%
- **ABC A-class items:** 75.64% of total spend
- **Potential Electronics savings at 5%:** €34,890.26

## Analysis Performed

### Spend Analysis
- Total procurement spend
- Spend by category
- Spend by supplier
- Spend by item
- Supplier/category concentration

### Supplier Analysis
- Supplier transaction volume
- Average transaction value
- Supplier share of total spend
- Supplier-category spending

### Inventory / Spend Prioritization
- ABC classification based on cumulative spend
- Identification of high-value purchasing categories and items

### Savings Analysis
Illustrative savings scenarios were calculated for Electronics:
- 3% savings: €20,934.16
- 5% savings: €34,890.26
- 10% savings: €69,780.52

These are scenario estimates, not realized savings.

## Business Recommendations

1. Prioritize Electronics and Software because together they represent the majority of procurement spend.
2. Review TechMart Inc. as a strategic supplier because it has the highest overall spend and the highest Electronics spend.
3. Focus sourcing and negotiation efforts on high-value A-class items, especially laptops and software licenses.
4. Review supplier concentration because the top two suppliers account for almost half of total spend.
5. Use competitive bidding, volume negotiation, and supplier benchmarking to evaluate potential savings in Electronics.

## Tableau Dashboard

The Tableau dashboard contains:
- Total Procurement Spend KPI
- Electronics Spend KPI
- Electronics % of Total Spend KPI
- Spend by Category
- Spend by Supplier
- Top 5 Items by Spend
- Supplier × Category heatmap
- ABC Analysis
- Electronics Savings Scenarios

## Project Structure

```text
procurement-spend-analysis/
├── README.md
├── data/
│   └── procurement_dataset.csv
├── sql/
│   └── procurement_analysis.sql
├── tableau/
│   └── procurement_spend_analysis.twbx
├── screenshots/
│   └── procurement-dashboard.png
└── insights/
    └── procurement-insights.md
```

## Note

The Tableau workbook and original dataset are not included in this generated package because they were not available as files in this chat.
