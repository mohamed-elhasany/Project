# Introduction

💼 Dive into the Data Job!
Focusing on Data Analysis roles, this job explores:

💰 Top-Paying Jobs
📊 In-Demand Skills
⚡ Where High Demand Meets High Salary in Data Analytics

💻 SQL Queries ==> check them out here: [queries folder](/queries/)

# Background

### The questions that i foucsed to answer them :

1. Jobs with the Highest Salaries
2. Skills Most Common in High-Paying Jobs
3. Skills That Appear Most Frequently Among High Salaries
4. Most In-Demand Skills for Data Analysts
5. Optimal Skills: Where High Salary Meets High Demand

# Tools I Used

For my deep dive into data analysis i used the power of those key tools:

- 🗄️ **SQL**
- 🐘 **PostgreSQL**
- 💻 **Visual Studio Code**
- 🔧 **Git & GitHub**

# The Analaysis

💡 Each query in this project investigates one of the questions above, providing specific insights into Data Analyst jobs.

For example, the first query focuses on **jobs with the highest salaries**.  
I filtered the `job_postings_fact` table to:

- Remove any rows where the yearly salary is `NULL`.
- Include only jobs with `job_title_short` as "Data Analyst".
- Limit the location to `'Anywhere'`.

Then, I ordered the results by `salary_year_avg` in **descending order** to get the top-paying positions.

```sql
SELECT
    job_id,
    job_location,
    job_schedule_type,
    company_dim.name AS company_name,
    job_posted_date,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

# What I Learned

Throughout this project, I have gained experience with **PostgreSQL**, including:

- Basic syntax and queries.
- Advanced concepts such as **joins**, **aggregations**, **CTEs**, **subqueries**, and **UNIONs**.
- How to efficiently interact with and manage **databases**.

# Conclusion

### 💼 Data Analyst Insights

**1️⃣ Highest Paying Job**

- **Job ID:** 226942
- **Company:** Mantys
- **Location:** Anywhere
- **Schedule Type:** Full-time
- **Posted Date:** 2023-02-20
- **Average Salary:** 650,000

**2️⃣ Skill Most Common in High-Paying Jobs**

- **Job Title:** Associate Director - Data Insights
- **Company:** AT&T
- **Average Salary:** 255,829.5
- **Skill:** SQL

**3️⃣ Skill with the Highest Average Salary**

- **Skill:** SVN
- **Average Salary:** 400,000

**4️⃣ Most In-Demand Skill (by number of jobs)**

- **Skill:** SQL
- **Number of Jobs:** 92,628

**5️⃣ Optimal Skill (High Salary + High Demand)**

- **Skill:** SQL
- **Number of Jobs:** 398
- **Average Salary:** 97,237
