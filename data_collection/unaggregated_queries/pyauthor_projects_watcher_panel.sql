SELECT w.project_id,
YEAR(w.created_at) AS watch_year,
MONTH(w.created_at) AS watch_month,
COUNT(user_id) AS num_watchers
FROM
(SELECT repo_id AS project_id,
user_id,
created_at
FROM `ghtorrent-2019-06`.watchers
INNER JOIN
`faith`.projectsets
ON `ghtorrent-2019-06`.watchers.repo_id = `faith`.projectsets.project_id
) AS w
GROUP BY project_id, watch_year, watch_month 