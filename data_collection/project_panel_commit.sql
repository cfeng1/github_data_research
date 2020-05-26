SELECT pyprojects.*,
YEAR(commits.created_at) AS commit_year,
MONTH(commits.created_at) AS commit_month,
COUNT(DISTINCT(commits.author_id)) AS project_current_authors,
COUNT(DISTINCT(commits.id)) AS project_current_commits,
COUNT(DISTINCT(watchers.user_id)) AS project_current_watchers
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
LEFT JOIN commits 
ON pyprojects.project_id = commits.project_id
LEFT JOIN watchers
ON pyprojects.project_id = watchers.repo_id AND
YEAR(commits.created_at) = YEAR(watchers.created_at) AND 
MONTH(commits.created_at) = MONTH(watchers.created_at)
GROUP BY project_id, owner_id, url, project_creation, commit_year, commit_month