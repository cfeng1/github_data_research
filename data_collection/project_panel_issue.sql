SELECT pyprojects.*,
YEAR(issues.created_at) AS issue_year,
MONTH(issues.created_at) AS issue_month,
COUNT(DISTINCT(issues.id)) AS project_current_issues,
COUNT(DISTINCT(issues.reporter_id)) AS project_current_issue_reporters
FROM
(SELECT id AS project_id,
owner_id,
url,
DATE_FORMAT(created_at, '%Y-%m') AS project_creation
FROM projects
WHERE forked_from IS NULL AND
deleted=0 AND
created_at>='2010-01-01' AND
created_at<'2018-09-01' AND
language='Python' AND
(LOCATE('library', description)>0 OR LOCATE('module', description)>0 OR
LOCATE('package', description)>0 OR LOCATE('framework', description)>0)
) AS pyprojects
LEFT JOIN issues
ON pyprojects.project_id = issues.repo_id
GROUP BY project_id, owner_id, url, project_creation, issue_year, issue_month