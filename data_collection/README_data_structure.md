# Data Structure

This file provides descriptions on the data structure of the sample.

Last Observation Date: 2018-08

Below are the main components for the data:

- project
	- released on PyPI: over 70k identified (data source: Maliev et al (2018))
		- currently have the identifiers of those projects, but not the commit history
		- currently have download and dependency data
	- other Python projects: around 20k
		- currently not using issue, pull request and fork data
		- could identify more if I modify query from
```sql
# original query
SELECT id AS project_id,
owner_id,
url,
created_at AS project_creation, 
language FROM projects
WHERE forked_from is null AND
deleted=0 AND
created_at>='2010-01-01' AND
created_at<'2018-07-01' AND
locate('python', description)>0 AND
(locate('library', description)>0 OR locate('module', description)>0)
```
to
```sql
# new query
SELECT id AS project_id,
owner_id,
url,
created_at AS project_creation, 
language FROM projects
WHERE forked_from is null AND
deleted=0 AND
created_at>='2010-01-01' AND
created_at<'2018-07-01' AND
LOCATE('python', description)>0 AND
(LOCATE('library', description)>0 OR LOCATE('module', description)>0 OR LOCATE('package', description))
```

- commit
	- Linked with commit creation timestamp, author id, project id
- author
	- Linked with author creation timestamp
- watch/star
	- Watcher id, watch timestamp, project id
- issue (not collected yet)
	- Issue id, reporter id, issue creation timestamp, project id, have a pull request or not
	- Event actions (subscribed, mentioned, referenced, closed, assigned...)
- pull request (not collected yet)
	- Pull request (PR) id, head repo id (forked), base repo id (original), event (open, close, merge), event timestamp
- download (collected for PyPI data)
	- 2016-01 to 2018-08
- dependency (collected)
	- which Python packages are used in the source code of the project (need to figure out the GitHub project id of those projects)

