{{ config(materialized='view') }}

WITH raw_mql AS (
    SELECT * FROM {{ source('olist_raw', 'olist_marketing_qualified_leads_dataset') }}

SELECT
    mql_id,
    origin,
    -- Limpiamos el formato de fecha para que sea usable
    CAST(first_contact_date AS DATE) AS contact_date
FROM raw_mql