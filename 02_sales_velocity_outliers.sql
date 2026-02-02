/* GOAL: Identify leads that take 2x the average time to close.
WHY: Long sales cycles may increase CAC (Customer Acquisition Cost).
*/

WITH velocity_stats AS (
    SELECT 
        AVG(c.won_date::date - m.first_contact_date::date) AS global_avg_days
    FROM olist_mql m
    JOIN olist_closed c ON m.mql_id = c.mql_id
)
SELECT 
    m.origin,
    c.business_segment,
    c.lead_type,
    (c.won_date::date - m.first_contact_date::date) AS days_to_close,
    CASE 
        WHEN (c.won_date::date - m.first_contact_date::date) > (SELECT global_avg_days * 2 FROM velocity_stats) THEN 'Critical Lag'
        WHEN (c.won_date::date - m.first_contact_date::date) > (SELECT global_avg_days FROM velocity_stats) THEN 'Slow'
        ELSE 'Efficient'
    END AS efficiency_flag
FROM olist_mql m
JOIN olist_closed c ON m.mql_id = c.mql_id
ORDER BY days_to_close DESC
LIMIT 20;