# Github Data Research
Research on GitHub collaboration patterns.

## Data Query

MySQL Query to pull down commits history of projects in Javascript, Java, Python, PHP, C, C#, C++.

```mysql
SELECT commits.id,
commits.author_id,
commits.project_id, 
commits.created_at AS commit_created_at,
projects.language,
projects.created_at AS projects_created_at
FROM commits
INNER JOIN projects ON commits.project_id = projects.id
WHERE projects.language = 'java'
AND projects.forked_from IS NULL
AND projects.created_at >= '2010-01-01'
AND (LOCATE('module', description)>0
OR LOCATE('library', description)>0
OR LOCATE('package', description)>0)
```
To-do:
Might need to get 'owner_id' from 'projects'; watchers info, .etc.

