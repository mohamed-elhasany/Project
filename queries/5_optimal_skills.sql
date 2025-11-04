/*
    Selecting optimal skills depend on both jobs/sallaries
*/

WITH skill_job_demand AS(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS number_of_jobs
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE 
    job_postings_fact.job_title_short='Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home IS TRUE
    GROUP BY
       skills_dim.skill_id
), skill_salary_demand AS(
    SELECT 
        skills_dim.skill_id,
        skills AS skill,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE 
        job_title_short='Data Analyst'
        AND job_work_from_home IS TRUE
    GROUP BY 
        skills_dim.skill_id
    HAVING AVG(job_postings_fact.salary_year_avg) IS NOT NULL
)

SELECT 
    sjd.skill_id,
    sjd.skills,
    sjd.number_of_jobs,
    ssd.avg_salary
FROM skill_job_demand sjd
INNER JOIN  skill_salary_demand ssd ON ssd.skill_id=sjd.skill_id
WHERE number_of_jobs > 10
ORDER BY
    avg_salary DESC,
    number_of_jobs DESC



/*

*/