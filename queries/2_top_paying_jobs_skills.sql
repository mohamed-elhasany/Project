/*
    What the skills are required for data analyst roles?
*/



WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        company_dim.name AS company_name ,
        salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
    WHERE 
        job_title_short='Data Analyst'
        AND job_location='Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.company_name,
    top_paying_jobs.salary_year_avg AS yearly_salary,
    skills_dim.skills AS skill_name
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY yearly_salary DESC;












/*
    Salary Insights
==> Highest salary: $255,829 – Associate Director- Data Insights at AT&T.
==>Lowest salary: $184,000 – ERM Data Analyst at Get It Recruit.
==>Average salary by job title shows a clear distinction:
==>Director-level or Associate Director roles pay $200k+.
==>Standard or Principal Data Analyst roles range from $184k – $217k.


    Skills Demand
Top required skills:
1-SQL
2-Python
3-Tableau
4-Excel
Advanced or leadership roles also require: Cloud (AWS/Azure), Snowflake, Databricks, and project management/collaboration tools (Jira, Confluence, GitLab).

------------------------------------
Sample of Results...

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5",
    "skill_name": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "yearly_salary": "232423.0",
    "skill_name": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "yearly_salary": "232423.0",
    "skill_name": "python"
  }
]
*/