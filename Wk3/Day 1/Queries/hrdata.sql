CREATE TABLE employees_hr(
emp_no INT primary key,
gender TEXT,
marital_status TEXT,
age_band TEXT,
age SMALLINT,
department TEXT,
education TEXT,
education_field TEXT,
job_role TEXT,
business_travel TEXT,
employee_count SMALLINT,
attrition TEXT,
attrition_label TEXT,
job_satisfaction SMALLINT,
active_employee SMALLINT
);

select *
from employees_hr

Select department, 
count (*) as employee_count
From employees_hr
Group by department

Select department, job_role,
Count (*) as role_count
from employees_hr
group by department, job_role
order by department, job_role DESC;

--calculate avg job satisfaction for each educational level
Select education, avg (job_satisfaction) as avg_satisfaction
From employees_hr
Group by education;

--identify the department with highest and lowest job satisfaction
Select department, avg(job_satisfaction) as avg_satisfaction
From employees_hr 
Group by department
Order by avg_satisfaction DESC, department;

--find the education level with the highest average job satisfaction among employess who travel frequently 
Select education, avg(job_satisfaction) as avg_satisfaction
from employees_hr
Where business_travel = 'travel_frequently'
Group by education
Order by avg_satisfaction DESC;







