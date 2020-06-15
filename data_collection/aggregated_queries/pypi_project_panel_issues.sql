SELECT pyissues.repo_id AS project_id,
YEAR(pyissues.created_at) AS issue_year,
MONTH(pyissues.created_at) AS issue_month,
COUNT(DISTINCT(pyissues.id)) AS project_current_issues,
COUNT(DISTINCT(pyissues.reporter_id)) AS project_current_issue_reporters
FROM
(SELECT issues.repo_id,
issues.id,
issues.reporter_id,
issues.created_at
FROM issues
INNER JOIN `faith`.pypi
ON `faith`.pypi.project_id = issues.repo_id
) AS pyissues
GROUP BY project_id, issue_year, issue_month