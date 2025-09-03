{{ config(materialized='table') }}
SELECT
  {{ dbt_utils.surrogate_key(['tag_name']) }} AS tag_sk,
  tag_name,
  tag_count
FROM {{ ref('stg_tags') }}