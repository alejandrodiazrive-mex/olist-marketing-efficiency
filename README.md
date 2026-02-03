# Sales Pipeline Efficiency & Lead Quality Analysis

## 🎯 The Business Challenge
In a high-growth environment, the most expensive and constrained resource is the **Sales Team’s time**.  
This analysis identifies which marketing channels deliver the best **Return on Effort**, by balancing **lead quality** against **sales velocity**, in order to protect sales capacity and accelerate learning cycles.

---

## 📊 Key Insights (The “No-Bullshit” Version)

### 1. The Social Media “Friction” Trap
Social Media shows the **lowest Efficiency Index (0.09)**.

- **The Problem:**  
  Deals take **61 days** to close, and only **~5%** of leads qualify as High Value (medium/big companies).
- **Business Impact:**  
  SDRs spend **~2× more time** per deal for a lower-quality payoff, creating a bottleneck in sales capacity.

---

### 2. The “Gold Mine”: Organic Search & Direct Traffic
These channels are the **Efficiency Leaders**.

- **Organic Search:**  
  Highest overall efficiency (**Efficiency Index ≈ 1.6**), with a stronger mix of High-Value leads.
- **Direct Traffic:**  
  Fastest sales cycle (**~31 days to close**), indicating high brand intent and immediate pipeline impact.

---

## 🛠 Strategic Recommendations (Pipeline Optimization)

- **Reallocate Sales Focus:**  
  Prioritize **Organic Search** and **Direct Traffic** leads in the CRM for immediate SDR follow-up.
- **Protect Sales Capacity:**  
  For **Social Media** leads (slow & low-value), shift from manual SDR outreach to **automated nurturing**.
- **Content & SEO Pivot:**  
  Double down on keywords and content targeting **Industry** and **Online Big** segments, which correlate with higher efficiency.

---

## 📈 Visual Insight

![Conversion vs Velocity](viz/conversion_vs_velocity.PNG)

*Figure 1: Relationship between conversion rate and sales velocity by acquisition channel.*

---

## 💻 Tech Stack & Analytical Approach

- **SQL (PostgreSQL):**  
  CTEs, date arithmetic, segmentation logic, and efficiency scoring.
- **Analysis Focus:**  
  Lead Quality Segmentation × Sales Velocity to optimize **sales effort allocation**.

> **Note on Lead Quality Scoring**  
> The `quality_score` used in this analysis is a **relative proxy**, not a financial metric.  
> It is derived from `lead_type` hierarchy and is designed to compare **sales effort efficiency**, not to estimate revenue or profit.

---

## 📁 Repository Structure

| File | Business Logic | Key Insight |
| :--- | :--- | :--- |
| `00_data_quality_audit.sql` | **Data Validation** | Critical checks for orphaned deals and date consistency. |
| `01_marketing_conversion_funnel.sql` | **Funnel Metrics** | High-level conversion performance by channel. |
| `02_sales_velocity_outliers.sql` | **Ops Audit** | Identifies “Critical Lag” deals (2× average sales cycle). |
| `03_lead_quality_efficiency.sql` | **Portfolio ROI** | **Segments won deals into Strategic Quadrants (Scale vs. Automate).** |
| `marketing_velocity_dashboard.pbix` | **Visualization** | Interactive view for stakeholder reporting. |

---

## 🧠 Why This Matters
When cost and revenue data are incomplete, early-stage teams still need to make decisions.  
This analysis focuses on what *can* be controlled: **sales effort, velocity, and lead quality**—providing a practical framework for pipeline optimization without relying on speculative financial assumptions.
