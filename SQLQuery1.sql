--data over view
select * from h..ds_salaries;

--knowing the unique values in each column and number of occurrences
--1*
select work_year,count(*)  from h..ds_salaries
group by work_year order by count(*);

select experience_level,count(*)  from h..ds_salaries
group by experience_level order by count(*);

select employment_type,count(*)  from h..ds_salaries
where work_year = '2022' 
group by employment_type order by count(*) desc;

select job_title,count(*) from h..ds_salaries
where work_year = '2022' 
group by job_title order by count(*) desc;

select employee_residence,count(*)  from h..ds_salaries
group by employee_residence order by count(*) desc;

select company_location,count(*)  from h..ds_salaries
group by company_location order by count(*) desc;

select company_size,count(*)  from h..ds_salaries
group by company_size order by count(*) desc;


--1-percent of employees who work out of there country with their roles and country
SELECT (SUM(CASE WHEN employee_residence != company_location THEN 1 ELSE 0 END) * 100 / COUNT(*)) 
as people_work_outside
from h..ds_salaries;

--2-the increase in avg salaries in usd from 2020 to 2022
select work_year,floor(AVG(salary_in_usd))as avg_salary_in_$ from h..ds_salaries
group by work_year
order by AVG(salary_in_usd) desc;

--3-count of experience level per job title 
select job_title,experience_level,count(*) as count  from h..ds_salaries
where job_title in ('Data Scientist','Data Engineer','Data Analyst','Machine Learning Engineer')
group by job_title,experience_level
order by job_title,count(*) desc,experience_level;

--4-top 5 job_titles in data field exist in 2022
select top 5 job_title,count(*) as count  from h..ds_salaries
where work_year = '2022'
group by job_title order by count(*) desc;

--5-avg salary for each company_size
select company_size,floor(avg(salary_in_usd))  from h..ds_salaries
group by company_size order by avg(salary_in_usd) desc;

--6-all the job titles existed in data field
select distinct job_title from h..ds_salaries

--7-top 20 countries which hire data roles
select top 20 company_location,count(*)  from h..ds_salaries
group by company_location order by count(*) desc;

--8-the amount of each emloyment_type
select employment_type,count(*)  from h..ds_salaries
where work_year = '2022' 
group by employment_type order by count(*) desc;

--9-avg salaries for each job title an company_size
select job_title,company_size,floor(avg(salary_in_usd))  from h..ds_salaries
where job_title in ('Data Scientist','Data Engineer','Data Analyst','Machine Learning Engineer')
group by job_title,company_size
order by job_title,floor(avg(salary_in_usd)) desc,company_size; 