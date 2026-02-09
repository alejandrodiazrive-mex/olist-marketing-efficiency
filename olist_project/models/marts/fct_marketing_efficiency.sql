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
    -- Calculamos la velocidad de venta (días entre contacto y cierre)
    DATE_DIFF(DATE(deals.won_at), mql.contact_date, DAY) AS days_to_close,
    deals.business_segment,
    deals.revenue,
    CASE WHEN deals.won_at IS NOT NULL THEN 1 ELSE 0 END AS is_won
FROM mql
LEFT JOIN deals ON mql.mql_id = deals.mql_id