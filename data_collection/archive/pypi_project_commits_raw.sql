SELECT id as commit_id,
created_at as commit_time,
author_id, commits.project_id
FROM commits
RIGHT JOIN
`faith`.pypi
ON commits.project_id = `faith`.pypi.project_id