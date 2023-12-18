
create Table Department(
    depId SERIAL PRIMARY KEY,
    depName VARCHAR(50)
);

insert into Department values(1, 'IT');
-- employee table 
-- each employee boloags a department
CREATE TABLE Employee(
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentId INT,
    CONSTRAINT pk_contraint_dept
        FOREIGN KEY (departmentId)
        REFERENCES Department(depId)
);

INSERT INTO Employee VALUES(1, 'nurul islam', 1)


CREATE Table courses(
    courseId SERIAL PRIMARY KEY,
    courseName VARCHAR(255),
    description VARCHAR(255),
    published_date DATE
);

INSERT INTO courses (courseName,  description, published_date)
    VALUES
    ('web development', 'this course for begener', '2023-12-12'),
    ('grapic design', 'this cousre for grapic desinger', NULL),
    ('digital merkating', 'for digital marketer', '2023-09-23');



--  update database table row  
-- upate many  
UPDATE courses
set
courseName = 'Deb development',
 description = 'amar mon valo nei'
where courseId = 1;

-- update one 
UPDATE courses
set
courseName = 'Deb development'
where courseId = 1;


-- delete rows from database 
DELETE FROM courses
WHERE courseId = 1;


SELECT * FROM courses;


CREATE TABLE IF NOT EXISTS department (
    depID SERIAL PRIMARY KEY,
    depName TEXT NOT NULL
);

insert into Department values(3, 'Graphic');



CREATE Table if NOT exists employee(
    empID SERIAL PRIMARY KEY,
    empName TEXT NOT NULL,
    email TEXT NOT NULL,
    salary INTEGER NOT NULL,
    joining_data DATE NOT NULL,
    departmentId INT,
    CONSTRAINT pk_contraint_dept
        FOREIGN KEY (departmentId)
        REFERENCES Department(depId)
)

INSERT INTO  employee (empname, email, salary,  joining_data, departmentid)
    VALUES
    ('hm nur', 'amenanur2@gmail.com', 4444,  '2023-12-12', 1),
    ('hm nurul', 'amenanur431@gmail.com', 2244,  '2023-07-15', 1),
    ('mualiha', 'musliha@gmail.com', 4444,  '2023-12-12', 2),
    ('nusaiba', 'nusaiba@gmail.com', 2244,  '2023-07-15', 2),
    ('hm nurul islam', 'amenanur763@gmail.com', 3444,  '2023-12-12', 1);


-- select all rows /fields
SELECT * FROM employee;

--  select some column 
SELECT empname, email FROM employee;

-- skip duplicate values 
SELECT DISTINCT email FROM employee

-- filtering data 
SELECT * FROM employee
WHERE salary >224444

SELECT * FROM employee
WHERE salary >224444 AND salary <224444

SELECT * FROM employee
WHERE salary >224444 OR salary <224444

SELECT * FROM employee
WHERE salary >=224444

-- filter data != 
SELECT * FROM employee
WHERE empname<> 'hm nur'


SELECT * FROM employee
ORDER BY empid
ASC;

-- basic pagination system
SELECT * FROM employee
ORDER BY empid
DESC LIMIT 2 OFFSET 0; --offset use for page number;


-- IN, NOT IN, BETWEEN, LIKE;
SELECT * FROM employee
WHERE empid IN(2, 5, 7);


SELECT * FROM employee
WHERE empid NOT IN(2, 5, 7);

SELECT * FROM employee
WHERE salary BETWEEN 4444 and 4444;


-- like ;
SELECT * FROM employee
WHERE empname LIKE '%h%';

SELECT * FROM employee
WHERE empname LIKE 'h%';

SELECT * FROM employee
WHERE empname LIKE '%m';


CREATE Table department1(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(244),
    department_id INT,
    job_role VARCHAR(122),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES department1(department_id)
);

INSERT INTO department1(department_id, department_name)
VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Ceo'),
(4, 'development'),
(5, 'research');

SELECT * FROM department1;
INSERT INTO  employees (employee_id, full_name, department_id, job_role, manager_id)
    VALUES
    (6, 'nur', 2 , 'CEO',  NULL),
    (7,'nurul islam', 1 , 'web develment',  6),
    (8, 'mualiha islam', 1 , 'designer',  7),
    (9, 'nusaiba nur', 3 , 'backend developer',  8),
    (10, 'hm nurul islam', 1 , 'manager',  9);

    SELECT * FROM employees;

    -- join a table with another table
    SELECT employees.full_name, employees.job_role, department1.department_name
    FROM employees
    INNER JOIN department1 on department1.department_id = employees.department_id;

    SELECT employees.full_name, employees.job_role, department1.department_name
    FROM employees
    LEFT JOIN department1 on department1.department_id = employees.department_id;

    SELECT employees.full_name, employees.job_role, department1.department_name
    FROM employees
    RIGHT JOIN department1 on department1.department_id = employees.department_id;

    SELECT employees.full_name, employees.job_role, department1.department_name
    FROM employees
    FULL JOIN department1 ON department1.department_id = employees.department_id;


-- AGGREGATE FUNCTION
    SELECT AVG(salary) as avarageSalary FROM employee;
    SELECT AVG(salary)  FROM employee;
    SELECT max(salary) as avarageSalary FROM employee;
    SELECT MIN(salary) as avarageSalary FROM employee;
    SELECT SUM(salary) as avarageSalary FROM employee;

    SELECT departmentid, AVG(salary) FROM employee GROUP BY departmentid;


SELECT * FROM employee;

SELECT * FROM department;

SELECT d.depname, avg(e.salary) FROM employee e
FULL JOIN department d ON e.departmentid = d.depid
GROUP BY d.depname HAVING avg(salary) < 4000;

SELECT d.depname, sum(salary), min(salary), max(salary) FROM department d
FULL JOIN employee e ON d.depid = e.departmentid
GROUP BY d.depname;