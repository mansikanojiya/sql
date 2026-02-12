create database Data_Analyst
use Data_Analyst
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary INT,
    manager_id INT
);
INSERT INTO employees VALUES
(1, 'Aman', 'IT', 'Developer', 60000, 3),
(2, 'Neha', 'HR', 'Manager', 55000, NULL),
(3, 'Raj', 'IT', 'Lead', 70000, NULL),
(4, 'Simran', 'Finance', 'Analyst', 45000, 5),
(5, 'Karan', 'Finance', 'Manager', 80000, NULL),
(6, 'Ankit', 'HR', 'Recruiter', 30000, 2),
(7, 'Arjun', 'IT', 'Developer', 50000, 3),
(8, 'Nitin', 'Sales', 'Executive', 40000, 9),
(9, 'Pooja', 'Sales', 'Manager', 65000, NULL),
(10, 'Rohan', 'IT', 'Tester', 35000, 3);

---basic select
-- display all columns from employees
select * from employees;

--display emp_id,name,and salary
select emp_id,name,salary from employees;

--display unique departments
select distinct department from employees;

--rename column as monthly_salary
select salary as monthly_salary from employees;

--display first 5 records
select top 5 * from employees;

--sort employees by name asc
select * from employees 
order by name asc;

--sort employees by salary desc
select * from employees 
order by salary desc;

--display employees working in IT department
select * from employees where department='IT';

--display constant value 1000 as bonus
select name,1000 as bonus
from employees;

---show structure of employee table
select * from employees

---where clause
---employees with salary>50000
select * from employees where salary >50000;

--employees with salary<40000
select * from employees where salary<40000;

--employees with salary between 30000 and 60000
select * from employees where salary between 300000 and 60000;

---employees from hr department
select * from employees where department='HR';

--employees not from it department
select * from employees where not department='IT';

--employees whose name start with 'A'
SELECT * FROM employees WHERE NAME LIKE 'A%';

--EMPLOYEES WHOSE NAME ENDS WITH N
SELECT * FROM employees WHERE NAME LIKE '%N';

--EMPLOYEE WHOSE NAME CONTAIN 'AR'
SELECT * FROM EMPLOYEES WHERE NAME LIKE '%AR%';

--EMPLOYEES WITH NULL MANAGER _ID
SELECT * FROM employees WHERE manager_id IS NULL;

--EMPLOYEES WITH NOT NULL MANAGER_ID
SELECT * FROM employees WHERE manager_id IS NOT NULL;

--DISTINCT IN BETWEEN LIKE
--SHOW DISTINCT JOB ROLE
SELECT DISTINCT job_role FROM employees;

--EMPLOYEES IN DEPARTMENT HR OR FINANCE
SELECT * FROM employees WHERE department='HR' OR department='FINANCE';

--EMPLOYEES NOT IN SALES DEPARTMENT
SELECT * FROM employees WHERE department<>'Sales';

--EMPLOYEES WITH SALARY IN 30000,40000,50000
SELECT * FROM employees WHERE SALARY=30000 OR SALARY=40000 OR SALARY=50000;

--EMPLOYEES WHOSE NAME START WITH 'R'
SELECT * FROM employees WHERE NAME LIKE 'R%';

--EMPLOYEES WHOSE NAME HAS EXACTLY 5 CHARACTERS
SELECT * FROM employees WHERE NAME LIKE '_____';

--EMPLOYEES WITH SALARY NOT BETWEEN 40000 AND 70000
SELECT * FROM employees WHERE SALARY NOT BETWEEN 40000 AND 70000;

-- EMPLOYEES WHOSE SECOND LETTER IS'A'
SELECT * FROM employees WHERE NAME LIKE'_A%';

--EMPLOYEES WHOSE NAME CONTAIN 'I;
SELECT * FROM employees WHERE NAME LIKE'%I%';

--EMPLOYEES FROM IT DEPARTMENT EARING MORE THAN 45000
SELECT * FROM employees WHERE DEPARTMENT='IT'AND SALARY>45000;

--AGGREGATE FUNTION
--COUNT TOTAL EMPLYOES
SELECT COUNT(NAME) FROM employees;

--FIND MAXIMUM SALARY
SELECT MAX(SALARY) FROM employees;

--FIND MINIMUM SALARY
SELECT MIN(SALARY) FROM employees;

--FIND AVERAGE SALARY 
SELECT AVG(SALARY) FROM employees;

--FIND TOTAL SALARY
SELECT SUM(SALARY) FROM employees;

--COUNT EMPLOYEES IN IT DEPARTMENT
SELECT COUNT(NAME) FROM employees WHERE department='IT';

--AVERAGE SALARY OF HR EMPLOYEES
SELECT AVG(SALARY) FROM employees WHERE department='HR';

--HIGHEST SALARY IN FINANCE DEPARTMENT
SELECT TOP 1 SALARY FROM employees WHERE department='FINANCE';

--COUNT DISTINCT DEPARTMENT
SELECT DISTINCT COUNT(DEPARTMENT) FROM employees;

--LOWEST SALARY IN SALES DEPARTMENT
SELECT SALARY FROM employees WHERE department='SALES' ORDER BY SALARY ASC;

---group by
--number of employees per department
select department,count(name) from employees group by department;

--average salary per department
select department,avg(salary) from employees group by department;

--maximum salary per department
select department,max(salary) as max_salary from employees group by department;

---minimum salary per department 
select department,min(salary) as min_salary from employees group by department;

--total salary per department
select department, sum(salary) as sum_salary from employees group by department;

--count employee per job role
select job_role, count(name) as number_of_employees from employees group by job_role;

--average salary per jobrole
select job_role,avg(salary) as avg_salary from employees group by job_role;

--department having more than 2 employees 
select department,count(name) from employees group by department having count(name)>2;

--job roles having average salary >50000
select job_role,avg(salary) from employees group by job_role having avg(salary)>50000;

--department with total salary>100000
select department,sum(salary) from employees group by department having sum(salary)>100000;

--order by+limit
--top 3 highest paid employees 
select top 3 salary, NAME from employees order by SALARY DESC;

--LOWEST PAID EMPLOYEE
SELECT TOP 1 NAME,SALARY FROM EMPLOYEES ORDER BY SALARY ASC;

--TOP 2 LOWEST SALARY
SELECT TOP 2 NAME, SALARY FROM employees ORDER BY SALARY ASC;

--EMPLOYEES SORTED BY DEPARTMENT THEN SALARY
SELECT * FROM employees ORDER BY department,SALARY;

--HIGHEST SALARY IN IT DEPARTMENT
SELECT MAX (SALARY) FROM EMPLOYEES WHERE DEPARTMENT='IT';

--SECOND HIGHEST SALARY
SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY FROM EMPLOYEES WHERE DEPARTMENT='IT' AND SALARY<(SELECT MAX(SALARY)FROM EMPLOYEES WHERE department='IT');

--THIRD HIGHEST SALARY
SELECT MAX(SALARY) AS THIRD_HIGHEST_SALARY FROM EMPLOYEES WHERE DEPARTMENT='IT'
AND SALARY<(SELECT MAX(SALARY)FROM EMPLOYEES WHERE department='IT' 
AND SALARY<(SELECT MAX(SALARY)FROM EMPLOYEES WHERE department='IT'));

--EMPLOYEES SORTED BY JOB _ ROLE ALPHABETICALLY
SELECT * FROM EMPLOYEES ORDER BY job_role asc;

--highest paid employee from sales
select top 1 department, max(salary) from employees  where department='sales' group by department;

--employees sorted by emp_id descending
select * from employees order by emp_id desc;

--null and aliases
-- employees withput manager
select * from employees where manager_id is null;

--employees with manager
select * from employees where manager_id is not null;

--display name and salary with alias
select name as employee_name, salary as monthly_salary from employees;

--display salary +5000 S incremented salary
select  salary,salary+5000 as incremented_salary from employees

--display annual salary
select salary, salary*12 as annual_salary from employees;

--basic logical condition
--it employees earning more than 50000
select * from employees where department='IT' AND salary>50000;

--HR EMPOLOYEES EARNING LESS THAN 40000
SELECT * FROM employees WHERE DEPARTMENT='HR' AND SALARY <40000;

--EMPLOYEES IN FINANCE OR SALES
SELECT * FROM employees WHERE department='FINANCE' OR department='SALES';

--EMPLOYEES OT IN HR AND NOT IN IT
SELECT * FROM employees WHERE department NOT IN ('HR','IT');

--EMPLOYEES WITH SALARY GREATER THAN AVERAGE SALARY
SELECT * FROM EMPLOYEES WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEES);

--EMPLOYEES EARNING LESS THAN AVERAGE SALARY
SELECT * FROM EMPLOYEES WHERE SALARY<(SELECT AVG(SALARY) FROM EMPLOYEES);

--
SELECT * FROM employees WHERE  SALARY % 5000 =0;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');
ALTER TABLE employees ADD dept_id INT;
UPDATE employees SET dept_id = 1 WHERE department = 'IT';
UPDATE employees SET dept_id = 2 WHERE department = 'HR';
UPDATE employees SET dept_id = 3 WHERE department = 'Finance';
UPDATE employees SET dept_id = 4 WHERE department = 'Sales';
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
);  
INSERT INTO projects VALUES
(101, 'Website', 1),
(102, 'App Dev', 3),
(103, 'Recruitment Drive', 6),
(104, 'Audit', 4),
(105, 'Sales Boost', 8);

--DISPLAY EMPLOYEE NAME WITH DEPARTMENT NAME
SELECT E.NAME,D.DEPT_NAME FROM employees e
inner join departments d
on e.dept_id=d.dept_id;

--all employees with department details
select* from employees e
join departments d
on e.dept_id=d.dept_id;

--employee name and project name 
select e.name,p.project_name from employees e
join projects p
on e.emp_id=p.emp_id;

--employee working on project
select distinct * from employees e
join projects p
on e.emp_id=p.emp_id;

--project name with employee salary
select p.project_id,e.salary from employees e
join projects p
on e.emp_id=p.emp_id;

left join
--all the employees withj their project
select e.name,p.project_name from employees e
left join projects p
on e.emp_id=p.emp_id;

--all the department and employees
select d.dept_name,e.name from departments d
left join employees e
on d.dept_id=e.emp_id;

--employee without projects
select e.name from employees e
left join projects p
on e.emp_id=p.emp_id
where p.project_id is null;

--department with  no employees
select d.dept_name from departments d
left join employees e
on d.dept_id=e.emp_id
where e.emp_id is null;

--all projects with emplopyees name
select p.project_name,e.name
from projects p
join employees e
on p.emp_id=e.emp_id;

--self join
--employees with manager name
select e.name as employees,
m.name as manager
from employees e
left join employees m
on e.manager_id=m.emp_id;

--employees earning more than their manager
select e.name from employees e
join employees m
on e.manager_id=m.emp_id
where e.salary>m.salary;

--subqueries
--employees earning more than average salary
select name  from employees where salary>(select avg(salary) from employees);

--emoployees with highest salary
select max(salary) from employees;

--second highest salary
select max(salary) from employees where salary <(select max(salary) from employees);

--SAME DEPARTMENT AS AMAN
SELECT NAME FROM EMPLOYEES WHERE DEPT_ID =(SELECT DEPT_ID  FROM EMPLOYEES WHERE NAME= 'AMAN');

--DEPARTMENT WITH MORE THAN 2 EMPLOYEES
SELECT DEPT_ID,COUNT(*) AS TOTAL FROM employees
GROUP BY DEPT_ID HAVING COUNT(*)>2;

--DEPARTMENT WITH AVERAGE SALARY >50000
SELECT DEPT_ID,AVG(SALARY) FROM employees GROUP BY DEPT_ID HAVING AVG(SALARY)>50000;

--JOBROLES WOTH MORE THAN 1 EMPLOYEES
SELECT JOB_ROLE,COUNT(*) FROM EMPLOYEES GROUP BY JOB_ROLE HAVING COUNT(*)>1;

--SALARY CLASSIFICATION
SELECT NAME,
CASE 
WHEN SALARY>60000 THEN 'HIGH'
WHEN SALARY BETWEEN 40000 AND 60000 THEN 'MEDIUM' ELSE 'LOW'
END AS CATEGORY
FROM employees;

SELECT NAME FROM employees e
 where exists (select 1 from projects p where p.emp_id=e.emp_id);

 SELECT NAME FROM employees e
 where not exists (select 1 from projects p where p.emp_id=e.emp_id);

 -- rank employees by salary highest first
 select name ,salary,rank() over (order by salary desc) as salary_rank
 from employees;

 --dense rank employees by salary
 select name ,salary,dense_rank() over (order by salary desc) as dense_rank from employees;

 --row number for each employees
 select name, salary, row_number() over (order by salary desc) as row_num from employees;

 --rank e,ployees with each department
 select name,dept_id,salary,
 rank()over(partition by dept_id order by salary desc) as dept_rank from employees;

 --2nd highest salary
 select* from (select name,salary, DENSE_RANK()over (order by salary desc) as rnk from employees)t where rnk=2;

 --running total of salary
 select name ,salary, sum(salary)over(order by emp_id) as running_total 
 from employees;

 --department -wise running total
 select name,dept_id,salary,
 sum(salary) over(partition by dept_id order by emp_id)as dept_running_total
 from employees;