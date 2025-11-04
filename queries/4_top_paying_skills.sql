/*
    Selecting most paying skills.[depend on salary]
*/


SELECT 
    skills AS skill,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Data Analyst'
    -- AND job_work_from_home=TURE
GROUP BY skill
HAVING AVG(job_postings_fact.salary_year_avg) IS NOT NULL
ORDER BY avg_salary DESC
LIMIT 25;


/*

===//Data Analyst Skills – Average Salaries Insight//===

1-Top averages: SVN (400,000) and Solidity (179,000) – rare or niche skills drive higher pay.
2-High-demand tools: Couchbase, DataRobot, Golang, MXNet (~150,000–160,000) – cloud, AI, and backend expertise is valuable.
3-Core analytics & automation: Dplyr, Terraform, Twilio, Keras, PyTorch (~120,000–150,000) – programming, ML, and workflow skills keep salaries strong.
4-Foundational & collaboration tools: Cassandra, Notion, Bitbucket, Airflow (~115,000–120,000) – widely used, essential, but average pay is lower.
  Takeaway: Higher averages come from rare, specialized, or emerging tech skills, while common analytical and collaboration tools sustain moderate salaries.

Sample of results DESCENDING to ASCENDING...

[
  {
    "skill": "svn",
    "avg_salary": "400000"
  },
  {
    "skill": "solidity",
    "avg_salary": "179000"
  },
  {
    "skill": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skill": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skill": "golang",
    "avg_salary": "155000"
  },
  {
    "skill": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skill": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skill": "vmware",
    "avg_salary": "147500"
  },
  {
    "skill": "terraform",
    "avg_salary": "146734"
  },
  {
    "skill": "twilio",
    "avg_salary": "138500"
  },
  {
    "skill": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skill": "kafka",
    "avg_salary": "129999"
  },
  {
    "skill": "puppet",
    "avg_salary": "129820"
  },
  {
    "skill": "keras",
    "avg_salary": "127013"
  },
  {
    "skill": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skill": "perl",
    "avg_salary": "124686"
  },
  {
    "skill": "ansible",
    "avg_salary": "124370"
  },
  {
    "skill": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skill": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skill": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skill": "notion",
    "avg_salary": "118092"
  },
  {
    "skill": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skill": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skill": "airflow",
    "avg_salary": "116387"
  },
  {
    "skill": "scala",
    "avg_salary": "115480"
  }
]
*/