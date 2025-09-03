{{ config(materialized='table') }}
SELECT
  {{ dbt_utils.surrogate_key(['user_id']) }} AS user_sk,
  user_id,
  display_name
FROM (
  SELECT DISTINCT
    owner_user_id AS user_id,
    owner_display_name AS display_name
  FROM `bigquery-public-data.stackoverflow.posts_questions`
  WHERE owner_user_id IS NOT NULL
)