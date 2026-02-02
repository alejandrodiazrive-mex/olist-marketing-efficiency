# Olist Marketing Funnel: Conversion & Efficiency Optimization
### 📊 SQL-Based Lead Performance Analysis

**Author:** Alejandro Diaz  
**Role:** Data Analyst | Business Intelligence Focus

---

## 🎯 Business Case
Olist seeks to identify which marketing channels are most **efficient** at converting leads into closed deals. This project focuses on SQL execution and KPI analysis from a junior data analyst perspective, identifying bottlenecks in the sales funnel by comparing lead generation volume against sales velocity.

---

## 📈 Key Findings (Data Insights)

* **Channel Efficiency:** **Paid Search** and **Organic Search** lead the funnel performance, with conversion rates above 11%.
* **Efficiency Gap:** **Social Media** generates the highest volume of leads (1,350) but shows the weakest conversion performance (5.5%) and the longest sales cycle (61 days).
* **Sales Velocity:** Leads from **Direct Traffic** close deals 30% faster than those from paid advertising channels, suggesting higher intent.

---

## ⚙️ Project Scope & Limitations
To maintain analytical rigor, the following boundaries were established for this study:
* **Proxy for Success:** Conversion is measured by `won_date`. Financial value (Revenue) per deal was not included in this phase as it requires a secondary join with order items.
* **Cost Data:** CAC (Customer Acquisition Cost) is not calculated because marketing spend per channel was not provided in the dataset.
* **Attribution:** This analysis uses a "First Touch" attribution model based on the `first_contact_date`.

---

## 💡 Strategic Recommendations

**Efficiency Trade-off Identified:** While Social Media generates a high volume of leads, it presents the lowest conversion rate and the slowest sales cycle across the company. 

**Recommendations for Stakeholders:** 1.  **Audit the sales script** for Social Media leads to identify friction points.
2.  **Trial Budget Reallocation:** Consider reallocating 15-20% of the Social budget toward **Paid Search**, which demonstrates a similar sales cycle but a **2x higher conversion rate**.

---

## 📁 Repository Structure

| File | Description | Business Logic |
| :--- | :--- | :--- |
| **01_marketing_conversion_funnel.sql** | Core Query | Implements funnel logic, conversion rates, and sales velocity. |
| **02_sales_velocity_outliers.sql** | Friction Audit | Identifies leads with "Critical Lag" (>2x average days to close). |
| **data/** | Source Datasets | Original Marketing Qualified Leads (MQLs) and Closed Deals data. |

---

## 💻 Technical Stack
* **SQL (PostgreSQL):** Relational modeling, CTEs, Window Functions, Interval calculations.
* **Business Intelligence:** Funnel Metrics, Sales Velocity, Outlier Detection.
* **Visualization:** Scatter plots for Conversion vs. Velocity.

---
*"Translating funnel data into operational growth opportunities."*