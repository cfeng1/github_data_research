SELECT pyc.*,
DATE_FORMAT(projects.created_at, '%Y-%m') AS project_creation
FROM
(SELECT pycommits.project_id,
YEAR(pycommits.created_at) AS commit_year,
MONTH(pycommits.created_at) AS commit_month,
COUNT(DISTINCT(pycommits.id)) AS project_current_commits,
COUNT(DISTINCT(pycommits.author_id)) AS project_current_authors
FROM
(SELECT commits.id,
commits.project_id,
commits.author_id,
commits.created_at
FROM commits
INNER JOIN `faith`.pypi
ON `faith`.pypi.project_id = commits.project_id
) AS pycommits
GROUP BY project_id, commit_year, commit_month) AS pyc
LEFT JOIN projects
ON projects.id = pyc.project_id