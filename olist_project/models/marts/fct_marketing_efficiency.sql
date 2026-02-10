WITH mql AS (
    SELECT * FROM {{ ref('stg_mql') }}
),
deals AS (
    SELECT * FROM {{ ref('stg_closed_deals') }}
)

SELECT
    mql.mql_id,
    mql.origin,
    mql.contact_date,
    deals.won_at,
    -- Sales Velocity: Días hasta el cierre
    DATE_DIFF(DATE(deals.won_at), mql.contact_date, DAY) AS days_to_revenue,
    -- Flag de eficiencia: ¿Cerró en menos de 30 días?
    CASE WHEN DATE_DIFF(DATE(deals.won_at), mql.contact_date, DAY) <= 30 THEN 1 ELSE 0 END AS is_fast_track,
    deals.revenue,
    CASE WHEN deals.won_at IS NOT NULL THEN 1 ELSE 0 END AS is_converted
FROM mql
LEFT JOIN deals ON mql.mql_id = deals.mql_id