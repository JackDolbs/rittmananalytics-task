{{ config(materialized='table') }}
SELECT
  {{ dbt_utils.surrogate_key(['q.question_id']) }} AS question_sk,
  q.question_id,
  d.date_sk AS dim_date_sk,
  u.user_sk AS dim_user_sk,
  q.view_count,
  q.answer_count,
  q.score,
  q.is_unanswered
FROM {{ ref('stg_questions') }} q
LEFT JOIN {{ ref('dim_date') }} d ON DATE(q.creation_date) = d.date
LEFT JOIN {{ ref('dim_users') }} u ON q.user_id = u.user_id