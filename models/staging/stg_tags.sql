SELECT
  tag_name,
  count AS tag_count
FROM `bigquery-public-data.stackoverflow.tags`
WHERE tag_name IS NOT NULL