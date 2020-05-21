SELECT pyactivity.*,
aggcommits.author_total_projects,
aggcommits.author_total_commits FROM
(SELECT tab1.author_id, tab1.commit_year, tab1.commit_month,
tab1.project_id, tab1.author_current_commits_in_project,
tab2.author_current_python_projects, tab2.author_current_commits_in_python FROM
(SELECT pycommits.author_id,
pycommits.commit_year,
pycommits.commit_month,
pycommits.project_id,
COUNT(DISTINCT(pycommits.commit_id)) AS author_current_commits_in_project
FROM 
(SELECT commits.author_id,
commits.project_id,
YEAR(commits.created_at) AS commit_year,
MONTH(commits.created_at) AS commit_month,
commits.id AS commit_id FROM
(SELECT id AS project_id
FROM projects
WHERE forked_from IS NULL AND
deleted=0 AND
created_at>='2010-01-01' AND
created_at<'2018-09-01' AND
language='Python' AND
(LOCATE('library', description)>0 OR LOCATE('module', description)>0 OR
LOCATE('package', description)>0 OR LOCATE('framework', description)>0)) AS pyprojects
INNER JOIN commits 
ON pyprojects.project_id = commits.project_id) AS pycommits
GROUP BY pycommits.author_id, pycommits.project_id, 
pycommits.commit_year, pycommits.commit_month
) AS tab1
LEFT JOIN
(SELECT pycommits.author_id,
pycommits.commit_year,
pycommits.commit_month,
COUNT(DISTINCT(pycommits.project_id)) AS author_current_python_projects,
COUNT(DISTINCT(pycommits.commit_id)) AS author_current_commits_in_python
FROM 
(SELECT commits.author_id,
YEAR(commits.created_at) AS commit_year,
MONTH(commits.created_at) AS commit_month,
commits.project_id,
commits.id AS commit_id FROM
(SELECT id AS project_id
FROM projects
WHERE forked_from IS NULL AND
deleted=0 AND
created_at>='2010-01-01' AND
created_at<'2018-09-01' AND
language='Python' AND
(LOCATE('library', description)>0 OR LOCATE('module', description)>0 OR
LOCATE('package', description)>0 OR LOCATE('framework', description)>0)) AS pyprojects
INNER JOIN commits 
ON pyprojects.project_id = commits.project_id) AS pycommits
GROUP BY author_id, commit_year, commit_month
) AS tab2
ON tab1.author_id = tab2.author_id AND
tab1.commit_year = tab2.commit_year AND
tab1.commit_month = tab2.commit_month) AS pyactivity
LEFT JOIN
(SELECT author_id,
YEAR(created_at) AS commit_year,
MONTH(created_at) AS commit_month,
COUNT(DISTINCT(project_id)) AS author_total_projects,
COUNT(DISTINCT(id)) AS author_total_commits
FROM commits
GROUP BY author_id, commit_year, commit_month
HAVING commit_year>=2010 AND commit_year<=2018
) AS aggcommits
ON aggcommits.author_id = pyactivity.author_id AND
aggcommits.commit_year = pyactivity.commit_year AND 
aggcommits.commit_month = pyactivity.commit_month


