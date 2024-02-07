{# 
  All events monthly to a project
#}

SELECT
  e.project_slug,
  TIMESTAMP_TRUNC(e.bucket_day, MONTH) as bucket_month,
  e.type,
  SUM(e.amount) AS amount
FROM {{ ref('all_events_daily_to_project') }} AS e
GROUP BY 1,2,3