SELECT pyauthors.author_id,
users.created_at,
users.type AS usertype,
users.fake,
users.deleted
FROM
(SELECT DISTINCT(commits.author_id)
FROM commits
INNER JOIN
`faith`.pymerged
ON commits.project_id = `faith`.pymerged.project_id) AS pyauthors
LEFT JOIN
users
ON users.id = pyauthors.author_id