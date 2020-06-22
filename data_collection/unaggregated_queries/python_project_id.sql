SELECT id AS project_id, url
FROM projects
WHERE forked_from IS NULL AND
deleted=0 AND
created_at>='2010-01-01' AND
language='Python' AND
(LOCATE('library', description)>0 OR 
LOCATE('module', description)>0 OR 
LOCATE('package', description)>0 OR 
LOCATE('framework', description)>0 OR 
LOCATE('api', description)>0 OR 
LOCATE('tool', description)>0 OR 
LOCATE('wrapper', description)>0 OR 
LOCATE('interface', description)>0 OR 
LOCATE('app', description)>0 OR 
LOCATE('utilities', description)>0 OR 
LOCATE('cli', description)>0 OR 
LOCATE('integration', description)>0 OR 
LOCATE('extension', description)>0 OR 
LOCATE('system', description)>0 OR 
LOCATE('json', description)>0 OR 
LOCATE('database', description)>0 OR 
LOCATE('parser', description)>0 OR 
LOCATE('object', description)>0 OR 
LOCATE('binding', description)>0 OR 
LOCATE('plugin', description)>0 OR 
LOCATE('generator', description)>0 OR 
LOCATE('function', description)>0 OR 
LOCATE('official', description)>0) AND
(LOCATE('my ', description)=0 AND 
LOCATE('personal', description)=0 AND 
LOCATE('tutorial', description)=0 AND 
LOCATE('example', description)=0 AND 
LOCATE('course', description)=0 AND 
LOCATE('guide', description)=0 AND 
LOCATE('document', description)=0 AND 
LOCATE('cheatsheet', description)=0 AND 
LOCATE('cheat sheet', description)=0 AND 
LOCATE('demonstrat', description)=0 AND 
LOCATE('exercise', description)=0)