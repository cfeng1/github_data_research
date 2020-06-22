SELECT ap.author_id,
ap.project_id,
year(ap.created_at) AS commit_year,
month(ap.created_at) AS commit_month,
COUNT(DISTINCT(ap.id)) AS num_commits
FROM
(SELECT id, project_id, commits.created_at, commits.author_id
FROM commits
INNER JOIN
`faith`.pyauthors
ON commits.author_id = `faith`.pyauthors.author_id
HAVING created_at>='2010-01-01') AS ap
GROUP BY
author_id, project_id, commit_year, commit_month