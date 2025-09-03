{{ config(materialized='table') }}
SELECT
  {{ dbt_utils.surrogate_key(['q.question_id']) }} AS question_sk,
  {{ dbt_utils.surrogate_key(['t.tag_name']) }} AS tag_sk
FROM {{ ref('stg_questions') }} q
CROSS JOIN UNNEST(SPLIT(tags, '|')) AS tag_name
JOIN {{ ref('dim_tags') }} t ON t.tag_name = tag_name
WHERE tag_name IS NOT NULL