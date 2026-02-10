WITH raw_deals AS (
    SELECT * FROM {{ source('olist_raw', 'olist_closed_deals_dataset') }}
)

SELECT
    mql_id,
    seller_id,
    sdr_id,
    sr_id,
    CAST(won_date AS TIMESTAMP) AS won_at,
    business_segment,
    lead_type,
    business_type,
    COALESCE(declared_monthly_revenue, 0) AS revenue
FROM raw_deals