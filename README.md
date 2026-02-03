# Sales Pipeline Efficiency & Lead Quality Analysis

## 🎯 The Business Challenge
In a high-growth environment, the most expensive resource is the **Sales Team's time**. This analysis identifies which marketing channels provide the best "Return on Effort" by analyzing lead quality vs. sales velocity.

## 📊 Key Insights (The "No-Bullshit" Version)

### 1. The Social Media "Friction" Trap
Social Media has the lowest **Efficiency Index (0.09)**. 
* **The Problem:** It takes **61 days** to close, and only **5%** of leads are "High Value" (Big/Medium companies). 
* **Business Impact:** The SDR (Sales Development Rep) team spends 2x more effort for a lower-quality payoff compared to other channels.

### 2. The "Gold Mine": Organic Search & Direct Traffic
These channels are the "Efficiency Leaders":
* **Organic Search:** High conversion with a **1.6 Efficiency Index**. It brings 20% more High-Value Leads than Social.
* **Direct Traffic:** The fastest channel (**31 days to close**), showing high brand intent and immediate sales ROI.

## 🛠 Strategic Recommendations (Pipeline Optimization)
* **Reallocate Sales Focus:** Prioritize leads from **Organic/Direct** in the CRM for immediate follow-up (high intent).
* **Automate the "Tail":** For Social Media leads (slow & low value), implement automated email nurturing instead of manual SDR outreach to protect sales capacity.
* **Content Pivot:** Since Organic Search brings the highest quality, double down on SEO keywords targeting "Industry" and "Online Big" segments.

## 💻 Tech Stack
* **SQL (PostgreSQL):** CTEs for lead scoring, time-interval analysis, and efficiency indexing.
* **Analysis:** Lead Quality Segmentation & Sales Velocity Correlation.


| File | Business Logic | Key Insight |
|------|---------------|-------------|
| `00_data_quality_audit.sql` | **Data Validation** | Integrity check for nulls and date inconsistencies. |
| `01_marketing_conversion_funnel.sql` | Basic funnel metrics | Identifies conversion leaders. |
| `02_sales_velocity_outliers.sql` | Ops Audit | Flags deals causing friction ("Critical Lag"). |
| `03_lead_quality_efficiency.sql` | **Capital Efficiency** | **Identifies channels with best Quality/Speed ratio.** |