SELECT
  id AS question_id,
  owner_user_id AS user_id,
  creation_date,
  view_count,
  answer_count,
  score,
  tags,
  CASE WHEN answer_count = 0 THEN TRUE ELSE FALSE END AS is_unanswered
FROM `bigquery-public-data.stackoverflow.posts_questions`
WHERE id IS NOT NULL