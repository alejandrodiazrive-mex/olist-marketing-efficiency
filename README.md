📊 Olist Marketing Funnel: Conversion Optimization
🎯 Business Case

Olist aims to understand which marketing channels are truly profitable.
This analysis identifies bottlenecks in the sales funnel by comparing lead generation performance against actual deal closures.

🛠️ Tools Used

SQL (PostgreSQL): Data cleaning and relational modeling between MQLs and closed deals.

Google Sheets: Quick validation of data volume and quality.

Power BI: Interactive dashboard for monitoring conversion KPIs.

📈 Key Findings (Data Insights)

Channel Efficiency: Paid Search and Organic Search lead conversion performance, with conversion rates above 11%.

Budget Leakage: Social Media generates the highest volume of leads but shows the weakest performance, with only a 5.5% conversion rate and an average 61-day sales cycle (the slowest across the company).

Sales Velocity: Leads from Direct Traffic close deals 30% faster than those from paid advertising channels.

![Gráfico de Dispersión Olist](viz/conversion_vs_velocity.PNG)



## ⚙️ Project Scope & Limitations
To maintain analytical rigor, the following boundaries were established for this study:
* **Proxy for Success:** Conversion is measured by `won_date`. Financial value (Revenue) per deal was not included in this phase as it requires a secondary join with order items.
* **Cost Data:** CAC (Customer Acquisition Cost) is not calculated because marketing spend per channel was not provided in the dataset.
* **Attribution:** This analysis uses a "First Touch" attribution model based on the `first_contact_date`.


📁 Repository Structure

olist_analysis.sql: Core query implementing funnel logic and deal closing time calculations.

data/: Original datasets for Marketing Qualified Leads (MQLs) and Closed Deals.

README.md: Project documentation.

💡 Strategic Recommendation

💡 Efficiency Trade-off Identified: While Social Media generates a high volume of leads (1,350), it presents the lowest conversion rate (5.5%) and the longest sales cycle (61 days). Recommendation for Stakeholders: Audit the sales script for Social leads or consider reallocating 15-20% of the Social budget toward Paid Search, which closes deals in a similar timeframe but with a 2x higher conversion rate.