# Procurement Spend Analysis

A procurement analytics case study using SQL, Excel, and Tableau to identify supplier concentration, high-value spend categories, purchasing priorities, and potential cost-saving opportunities.

⸻

# Project Overview

Procurement teams manage thousands of purchasing transactions, suppliers, products, and categories. Without structured spend analysis, organizations can miss opportunities to reduce costs, consolidate suppliers, improve negotiations, and better control high-value purchases.

This project analyzes 500 procurement transactions from 2024 with a total procurement spend of €1.24M.

The analysis uses SQL, Excel, and Tableau to transform raw transaction-level purchasing data into actionable procurement insights.

The objective was not simply to report what the company purchased, but to answer a more important question:

Where is the money going, what is driving procurement spend, and where should procurement focus its attention?

⸻

# Business Questions

The analysis was designed to answer the following procurement questions:

* How much does the company spend in total?
* Which categories consume the most procurement budget?
* Which suppliers account for the largest share of spend?
* Are there signs of supplier concentration?
* Which supplier-category combinations drive the most spend?
* Which individual items represent the greatest financial exposure?
* Which items should receive the highest procurement control?
* What does an ABC analysis reveal about purchasing priorities?
* Where could supplier negotiations generate meaningful savings?
* How much could the company potentially save under different savings scenarios?

⸻

# Executive Summary

The analysis identified several important procurement opportunities.

Total Procurement Spend

€1,240,580.53

The company processed 500 transactions across multiple suppliers, categories, and purchasing items.

Biggest Spend Categories

Category	Spend	Share
Electronics	€697,805.23	56.25%
Software	€336,018.00	27.08%
Furniture	€172,818.61	13.93%
Accessories	€20,857.24	1.68%
Stationery	€6,753.18	0.54%
Office Supplies	€6,328.27	0.51%

Key Finding

Electronics and Software account for approximately 83.3% of total procurement spend.

This means procurement management should prioritize these two categories rather than distributing negotiation and monitoring efforts evenly across all categories.

⸻
# Supplier Analysis

Supplier concentration is another major finding.

Supplier	Spend	Share
TechMart Inc.	€328,761.73	26.50%
QuickDeliver Ltd.	€285,353.59	23.00%
OfficeSupplies Co.	€223,580.85	18.02%
FurniWorks Ltd.	€202,810.72	16.35%
CloudSoft Corp.	€200,073.64	16.13%

Key Finding

The two largest suppliers, TechMart Inc. and QuickDeliver Ltd., represent approximately 49.5% of total procurement spend.

This creates an opportunity for procurement to:

* Strengthen supplier negotiations
* Review pricing agreements
* Evaluate volume-based discounts
* Establish strategic supplier relationships
* Assess supplier dependency and business continuity risk
* Benchmark pricing between suppliers where products overlap

⸻

# Supplier × Category Analysis

The supplier-category analysis identifies where specific suppliers have the greatest financial impact.

The largest supplier-category combination is:

TechMart Inc. → Electronics

€196,020.50

TechMart also represents significant Software spend:

€95,297.54

This makes TechMart a particularly important supplier for procurement negotiations.

Procurement implication

Rather than negotiating with suppliers based only on total supplier spend, procurement should focus on the supplier-category combinations that create the greatest financial leverage.

For example:

TechMart + Electronics represents a stronger negotiation target than simply saying “TechMart is our largest supplier.”

⸻

# Electronics Spend Analysis

Electronics represents the company’s largest procurement category.

Electronics spend

€697,805.23

This represents:

56.25% of total procurement spend.

TechMart Inc. accounts for approximately:

28.1% of Electronics spend.

This makes Electronics the first category that should be investigated for cost-reduction opportunities.

Potential Savings Scenarios

Savings Scenario	Potential Savings
3%	€20,934.16
5%	€34,890.26
10%	€69,780.52

These figures represent scenario-based savings, not realized savings.

Even a relatively small percentage improvement in Electronics purchasing could therefore create a meaningful financial impact.

⸻

# Item Spend Analysis

The analysis also identified the highest-value purchasing items.

Rank	Item	Spend	Share
1	Laptop	€472,284.81	38.07%
2	Annual Software License	€336,018.00	27.09%
3	Monitor	€130,072.59	10.48%
4	Printer	€95,447.83	7.69%
5	Desk Chair	€91,857.82	7.40%

Key Finding

The Laptop category alone represents 38.07% of total procurement spend.

The top five items account for the majority of overall spend, making them strong candidates for:

* Strategic sourcing
* Supplier negotiations
* Price benchmarking
* Contract review
* Volume discounts
* Demand planning
* Standardization

⸻

# ABC Analysis

An ABC classification was performed to identify which purchasing items deserve different levels of procurement control.

The classification follows the principle that a relatively small number of items often account for a large proportion of total spend.

A Items

The analysis identified the following high-value items as A-class items:

* Laptop
* Annual Software License
* Monitor

Together, these items represent approximately:

75.64% of total procurement spend.

B Items

B-class items include:

* Printer
* Desk Chair

These items bring cumulative spend to approximately:

90.73%

C Items

Lower-value items such as:

* Whiteboard
* Laptop Bag
* Stapler
* Printer Ink
* Notepad

represent a much smaller share of total spend.

Procurement implication

Procurement resources should not be allocated equally across every item.

A-class items should receive the greatest attention because they have the greatest financial impact.

This could include:

* More frequent price reviews
* Formal supplier negotiations
* Contract monitoring
* Demand forecasting
* Strategic sourcing
* Management approval

⸻

# Procurement Recommendations

Based on the analysis, five priority actions are recommended.

1. Prioritize Electronics negotiations

Electronics represents 56.25% of total spend.

Procurement should prioritize:

* Volume-based pricing
* Framework agreements
* Competitive bidding
* Supplier benchmarking
* Standardized product specifications

⸻

2. Negotiate strategically with TechMart

TechMart is the largest supplier at 26.50% of total spend.

Its high Electronics and Software exposure makes it a strong candidate for a strategic supplier review.

Potential negotiation areas include:

* Volume discounts
* Contract pricing
* Payment terms
* Bundled purchasing
* Rebates
* Longer-term agreements

⸻

3. Review laptop procurement

Laptops represent approximately 38.07% of total procurement spend.

Because of this concentration, procurement should investigate:

* Supplier price differences
* Volume discounts
* Standard laptop specifications
* Preferred supplier agreements
* Total cost of ownership
* Warranty and support costs

⸻

4. Apply differentiated procurement controls

The ABC analysis suggests that procurement should use different management approaches depending on item value.

A items: Strategic management and frequent review
B items: Regular monitoring
C items: Simplified purchasing processes

This allows procurement teams to spend more time where the financial impact is highest.

⸻

5. Investigate supplier concentration

The top two suppliers represent approximately 49.5% of total spend.

Procurement should evaluate whether this concentration creates:

* Supply disruption risk
* Pricing dependency
* Reduced negotiating leverage
* Operational dependency

Where practical, alternative suppliers should be evaluated for critical categories.

⸻

# Tableau Dashboard

The Tableau dashboard brings the analysis together into an interactive procurement overview.

It includes:

* Total Procurement Spend
* Spend by Category
* Spend by Supplier
* Top 5 Items by Spend
* Supplier × Category Analysis
* ABC Classification
* Electronics Savings Scenarios
* Electronics Spend KPI
* Electronics % of Total Spend

The dashboard is designed to allow procurement stakeholders to move from a high-level view of spend into specific supplier, category, and item-level opportunities.

⸻

# Tools & Technologies

SQL

Used for:

* Aggregating procurement spend
* Supplier analysis
* Category analysis
* Supplier-category analysis
* Spend percentages
* ABC classification
* Savings calculations
* Window functions and CTEs

Excel

Used for:

* Initial data exploration
* Data validation
* Pivot tables
* Spend calculations
* Supplier analysis
* Category analysis
* ABC analysis
* Savings scenarios

Tableau

Used for:

* Interactive dashboard development
* KPI visualization
* Spend analysis
* Supplier comparisons
* Category analysis
* ABC visualization
* Procurement storytelling

⸻

# Dataset

The dataset contains 500 synthetic procurement transactions from 2024.

Fields

Column	Description
TransactionID	Unique transaction identifier
ItemName	Purchased item
Category	Procurement category
Quantity	Quantity purchased
UnitPrice	Price per unit
TotalCost	Total transaction cost
PurchaseDate	Date of purchase
Supplier	Supplier providing the item
Buyer	Employee responsible for the purchase

Categories

* Accessories
* Electronics
* Furniture
* Office Supplies
* Software
* Stationery

Suppliers

* CloudSoft Corp.
* FurniWorks Ltd.
* OfficeSupplies Co.
* QuickDeliver Ltd.
* TechMart Inc.

Note: The dataset is synthetic and created for analytical and portfolio purposes. Savings figures represent scenarios and should not be interpreted as realized savings.

⸻

# Methodology

The project followed a simplified procurement analytics workflow:

Raw Procurement Data
        ↓
Data Validation
        ↓
Exploratory Analysis
        ↓
Supplier Analysis
        ↓
Category Analysis
        ↓
Supplier × Category Analysis
        ↓
Item-Level Spend Analysis
        ↓
ABC Classification
        ↓
Savings Opportunity Analysis
        ↓
Procurement Recommendations
        ↓
Tableau Dashboard

⸻

# Project Structure

procurement-spend-analysis/
│
├── README.md
├── Dashboard.png
│
├── Procurement Spend Analysis Dashboard.twbx
│
├── procurement_analysis.sql
├── procurement-insights.md
│
├── spend_analysis_dataset.csv
└── spend_analysis_dataset.xlsx

⸻

#  How to Reproduce the Analysis

1. Explore the dataset

Open:

spend_analysis_dataset.xlsx

or

spend_analysis_dataset.csv

⸻

2. Run the SQL analysis

Import the dataset into MySQL and run:

procurement_analysis.sql

The SQL file contains queries for:

* Total spend
* Spend by category
* Spend by supplier
* Supplier transaction volume
* Average transaction value
* Supplier-category analysis
* Savings scenarios
* Item spend
* Spend percentages
* Cumulative spend
* ABC classification

⸻

3. Open the Tableau dashboard

Open:

Procurement Spend Analysis Dashboard.twbx

using Tableau Desktop.

⸻

# Key Takeaways

The analysis demonstrates several important procurement principles:

1. Spend concentration matters

A small number of categories and items account for a large proportion of total expenditure.

2. Supplier analysis can reveal negotiation leverage

Understanding where spend is concentrated helps procurement teams identify strategic suppliers.

3. Not every purchase requires the same level of management

ABC analysis helps procurement teams prioritize resources based on financial impact.

4. Small savings percentages can create significant value

A 5% improvement in Electronics purchasing alone represents approximately:

€34,890 in potential savings.

5. Data should lead to action

The purpose of spend analysis is not simply to create charts.

It is to answer:

What should procurement do differently as a result of this analysis?

⸻

# Future Improvements

Potential extensions to this project would include:

* Supplier price benchmarking
* Purchase price variance analysis
* Month-over-month spend trends
* Supplier performance scorecards
* Contract compliance analysis
* Maverick spend detection
* Supplier risk scoring
* Category-level savings targets
* Forecasting future procurement spend
* Automated procurement dashboards

⸻

# About the Project

This project was developed as a procurement analytics portfolio case study to demonstrate how purchasing data can be transformed into actionable business recommendations.

It combines procurement knowledge with data analytics and visualization to demonstrate a practical approach to identifying cost-saving opportunities, supplier concentration, and purchasing priorities.

⸻

#  Portfolio Highlight

€1.24M analyzed → 500 transactions → 83.3% of spend concentrated in Electronics & Software → 49.5% concentrated across the top two suppliers → €34.9K potential savings from a 5% Electronics improvement.

The goal of the analysis is simple: turn procurement data into better purchasing decisions.
