🛒 Zepto Product Catalog — Data Analysis
A SQL-based exploratory data analysis of the Zepto quick-commerce product catalog, covering pricing, discounts, inventory health, and revenue estimation across 14 product categories.

📊 Dataset Overview
FieldTypeDescriptionCategoryVARCHARProduct category (14 distinct values)nameVARCHARProduct display namemrpNUMERICMaximum Retail Price (in ₹, converted from paise)discountPercentNUMERICDiscount percentage at time of listingdiscountedSellingPriceNUMERICActual selling price after discountavailableQuantityINTEGERUnits currently in stockweightInGmsINTEGERProduct weight in gramsoutOfStockBOOLEANWhether the product is unavailablequantityINTEGERListing quantity unit
Size: 3,732 rows · 1,681 unique products · 14 categories

🗂️ Project Structure
zepto-data-analysis/
│
├── zepto.csv              # Raw dataset
├── query.sql              # All SQL queries used in the analysis
└── README.md

⚙️ Setup
1. Create and load the database
sqlCREATE DATABASE zepto;
USE zepto;

CREATE TABLE sales_2 (
    category              VARCHAR(120),
    name                  VARCHAR(150) NOT NULL,
    mrp                   NUMERIC(8,2),
    discountPercent       NUMERIC(5,2),
    availableQuantity     INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms           INTEGER,
    outOfStock            BOOLEAN,
    quantity              INTEGER
);
Import zepto.csv into the sales_2 table using your preferred method (MySQL LOAD DATA, DBeaver import wizard, etc.).
2. Convert paise to rupees
sqlUPDATE sales_2
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

🔍 Analysis Questions
#QuestionQ1Top 10 best-value products by discount percentageQ2High-MRP products (> ₹300) that are out of stockQ3Estimated revenue per categoryQ4Products with MRP > ₹500 and discount < 10%Q5Top 5 categories by average discount percentageQ6Best value products by grams per rupee (weight ≥ 100 g)Q7Product distribution by weight group (Low / Medium / Bulk)Q8Total inventory weight per category

📝 Key Findings

Highest discounts are in snacks and dairy — Dukes Waffy products lead at 51% off
Cooking Essentials and Munchies each contribute an estimated ₹3.37 lakh in revenue
Fruits & Vegetables carries the highest average discount (15.5%) yet the lowest revenue — indicating a stock depth problem
4 premium products (MRP > ₹300) are currently out of stock, representing direct revenue leakage
91% of products weigh under 1 kg, highlighting a catalog dominated by small, unit-purchase SKUs
Several bulk cooking oils carry a 0% discount, consistent with commodity pricing behaviour


🛠️ Tools Used

MySQL — database creation, data loading, and all SQL queries
SQL — aggregation, filtering, CASE statements, window-style ranking


📄 Report
A full data analysis report with formatted tables and findings is available in the repository as zepto_analysis_report.docx
