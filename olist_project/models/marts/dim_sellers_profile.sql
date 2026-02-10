{{ config(materialized='table') }}

WITH deals AS (
    SELECT * FROM {{ ref('stg_closed_deals') }}
)

SELECT
    seller_id,
    business_segment,
    lead_type,
    business_type,
    -- Etiquetamos el ICP (Ideal Customer Profile)
    CASE 
        WHEN lead_type IN ('online_big', 'industry') THEN 'High-Tier ICP'
        WHEN lead_type IN ('online_medium', 'offline_big') THEN 'Mid-Tier ICP'
        ELSE 'Long-tail / SMB'
    END AS icp_segment,
    revenue AS declared_revenue
FROM deals