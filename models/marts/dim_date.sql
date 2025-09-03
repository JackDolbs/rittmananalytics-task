{{ config(materialized='table') }}
SELECT
  {{ dbt_utils.surrogate_key(['date']) }} AS date_sk,
  date,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  EXTRACT(DAY FROM date) AS day
FROM UNNEST(GENERATE_DATE_ARRAY('2008-01-01', '2025-12-31')) AS date