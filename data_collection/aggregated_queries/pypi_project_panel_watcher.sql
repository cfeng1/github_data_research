SELECT pywatchers.repo_id AS project_id,
YEAR(pywatchers.created_at) AS watch_year,
MONTH(pywatchers.created_at) AS watch_month,
COUNT(DISTINCT(pywatchers.user_id)) AS project_new_watchers
FROM
(SELECT watchers.repo_id,
watchers.user_id,
watchers.created_at
FROM watchers
INNER JOIN `faith`.pypi
ON `faith`.pypi.project_id = watchers.repo_id
) AS pywatchers
GROUP BY project_id, watch_year, watch_month