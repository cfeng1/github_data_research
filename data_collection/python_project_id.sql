SELECT id AS project_id, url
FROM projects
WHERE forked_from IS NULL AND
deleted=0 AND
created_at>='2010-01-01' AND
created_at<'2018-09-01' AND
language='Python' AND
(LOCATE('library', description)>0 OR LOCATE('module', description)>0 OR
LOCATE('package', description)>0 OR LOCATE('framework', description)>0 OR
LOCATE('tool', description)>0 OR LOCATE('system', description)>0)