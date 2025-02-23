-- NAME:M.Deeban
-- EMAIL: deebandeeban095@gmail.com


--  Data defination Language 
#1
create database CompanyDB;
use CompanyDB;
#2
create table EmployeeRecords(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('MALE','FEMALE','OTHER'),
date_of_birth DATE,
hire_date DATE,
department VARCHAR(100),
job_title VARCHAR(100),
salary DECIMAL(10,2),
email VARCHAR(100) UNIQUE,
phone_number VARCHAR(15),
address_line1 VARCHAR(255),
address_line2 VARCHAR(255),
city VARCHAR(100),
state VARCHAR(100),
zip_code VARCHAR(10),
country VARCHAR(100),
manager_id INT
);
#3
ALTER TABLE EmployeeRecords
ADD marital_status ENUM('Single','Married');
#4
ALTER TABLE EmployeeRecords
MODIFY  email VARCHAR(100) unique;
#5
create table ManagerRecords(
manager_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('MALE','FEMALE','OTHER'),
address_line1 VARCHAR(255),
address_line2 VARCHAR(255)
);
ALTER TABLE EmployeeRecords
ADD CONSTRAINT consrtaint_name FOREIGN KEY(manager_id) REFERENCES ManagerRecords(manager_id);
#6
drop TABLE EmployeeRecords;
#7
ALTER TABLE EmployeeRecords
MODIFY COLUMN salary DECIMAL(12,2);
#8
ALTER TABLE EmployeeRecords  RENAME COLUMN hire_date TO employee_start_date;
#9
ALTER TABLE EmployeeRecords
ADD CONSTRAINT UNIQUE(phone_number);
#10
ALTER TABLE EmployeeRecords DROP INDEX email;
#11
ALTER TABLE EmployeeRecords
DROP COLUMN department;
#12
CREATE INDEX idx_last_name ON EmployeeRecords(last_name);
#13
ALTER TABLE EmployeeRecords DROP INDEX idx_last_name;
#14
TRUNCATE TABLE EmployeeRecords;
#15
create table ArchiveEmployees(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender ENUM('MALE','FEMALE','OTHER'),
date_of_birth DATE,
employee_start_date DATE,
job_title VARCHAR(100),
salary DECIMAL(10,2),
email VARCHAR(100) UNIQUE,
phone_number VARCHAR(15),
address_line1 VARCHAR(255),
address_line2 VARCHAR(255),
city VARCHAR(100),
state VARCHAR(100),
zip_code VARCHAR(10),
country VARCHAR(100),
manger_id INT,
department VARCHAR(100),
employee_status VARCHAR(100)
);
-- Data Mnaipulation Language
#16
INSERT INTO EmployeeRecords(employee_id, first_name, last_name, gender,
 date_of_birth, employee_start_date, job_title, salary,
 email, phone_number, address_line1, address_line2,
 city, state, zip_code, country,manager_id,department)
 VALUES (1,'John','Doe','Male','1990-05-15','2020-06-01',
'Software Engineer',70000.00,'john.doe@gmail.com',
'1234567890','abcd','wxyz','Bengaluru','Karnataka','232938',
'India',234,'Engineering');


-- we using foreign key in employeerecords
insert into managerrecords values(234,'John','Doe','Male','ABCD','WXYZ');
#17
INSERT INTO EmployeeRecords (employee_id, first_name, last_name, gender,
 date_of_birth, employee_start_date, job_title, salary, email, phone_number, 
 address_line1, address_line2, city, state, zip_code, 
 country, manager_id, department)
VALUES
(2, 'Karthik', 'Nair', 'Male', '1991-01-15', '2019-05-10', 'Business Analyst', 72000.00, 'karthik.nair@gmail.com', '9900112233', 'abcd', 'efgh', 'Chennai', 'Tamil Nadu', '600002', 'India', 244, 'Business Analysis'),
(3, 'Divya', 'Sharma', 'Female', '1986-08-25', '2018-03-20', 'Content Writer', 50000.00, 'divya.sharma@gmail.com', '8800223344', 'ijkl', 'mnop', 'Coimbatore', 'Tamil Nadu', '641002', 'India', 245, 'Content'),
(4, 'Ravi', 'Kumar', 'Male', '1993-11-05', '2021-07-15', 'Network Engineer', 68000.00, 'ravi.kumar@gmail.com', '7700334455', 'qrst', 'uvwx', 'Madurai', 'Tamil Nadu', '625002', 'India', 246, 'IT'),
(5, 'Sneha', 'Patel', 'Female', '1990-04-18', '2020-01-25', 'Graphic Designer', 62000.00, 'sneha.patel@gmail.com', '6600445566', 'abcd', 'efgh', 'Tiruchirappalli', 'Tamil Nadu', '620002', 'India', 247, 'Design'),
(6, 'Vijay', 'Reddy', 'Male', '1988-09-30', '2017-06-10', 'Database Administrator', 78000.00, 'vijay.reddy@gmail.com', '5500556677', 'ijkl', 'mnop', 'Salem', 'Tamil Nadu', '636002', 'India', 248, 'Database'),
(7, 'Anjali', 'Verma', 'Female', '1992-12-20', '2022-03-05', 'SEO Specialist', 54000.00, 'anjali.verma@gmail.com', '4400667788', 'qrst', 'uvwx', 'Erode', 'Tamil Nadu', '638002', 'India', 249, 'Marketing'),
(8, 'Ramesh', 'Iyer', 'Male', '1987-07-12', '2016-11-20', 'System Administrator', 70000.00, 'ramesh.iyer@gmail.com', '3300778899', 'abcd', 'efgh', 'Tiruppur', 'Tamil Nadu', '641602', 'India', 250, 'IT'),
(9, 'Pooja', 'Nair', 'Female', '1994-05-25', '2021-09-15', 'Quality Analyst', 60000.00, 'pooja.nair@gmail.com', '2200889900', 'ijkl', 'mnop', 'Vellore', 'Tamil Nadu', '632002', 'India', 251, 'Quality Assurance'),
(10, 'Sanjay', 'Sharma', 'Male', '1989-03-10', '2019-12-20', 'Technical Writer', 58000.00, 'sanjay.sharma@gmail.com', '1100990011', 'qrst', 'uvwx', 'Thoothukudi', 'Tamil Nadu', '628002', 'India', 252, 'Content'),
(11, 'Lakshmi', 'Rao', 'Female', '1995-08-15', '2022-02-10', 'Product Designer', 95000.00, 'lakshmi.rao@gmail.com', '0000112233', 'abcd', 'efgh', 'Dindigul', 'Tamil Nadu', '624002', 'India', 253, 'Design');
-- we usins the foreign key
insert into managerrecords values
(244, 'Karthik', 'Nair', 'Male', 'abcd', 'efgh'),
(245, 'Divya', 'Sharma', 'Female','ijkl', 'mnop'),
(246, 'Ravi', 'Kumar', 'Male','qrst', 'uvwx'),
(247, 'Sneha', 'Patel', 'Female',  'abcd', 'efgh'),
(248, 'Vijay', 'Reddy', 'Male',  'ijkl', 'mnop'),
(249, 'Anjali', 'Verma', 'Female','uvwx', 'Erode'),
(250, 'Ramesh', 'Iyer', 'Male', 'abcd', 'efgh' ),
(251, 'Pooja', 'Nair', 'Female',  'ijkl', 'mnop'),
(252, 'Sanjay', 'Sharma', 'Male',  'qrst', 'uvwx'),
(253, 'Lakshmi', 'Rao', 'Female', 'hdhd','chah');

#18
-- SAFE UPDATE
-- SET SQL_SAFE_UPDATES = 0;
-- SET SQL_SAFE_UPDATES = 1;
UPDATE EmployeeRecords
SET salary = salary * 1.10
WHERE employee_id = 1;
#19
DELETE FROM EmployeeRecords
WHERE first_name='Jhon' AND last_name='Doe';
#20
UPDATE EmployeeRecords
SET salary = salary * 1.15
WHERE department = 'Marketing';
desc employeerecords;
ALTER TABLE EmployeeRecords
ADD COLUMN employee_status VARCHAR(100);
#21
UPDATE EmployeeRecords
SET employee_status = 'Inactive'
WHERE employee_start_date < '2021-07-15';
#22
DELETE FROM EmployeeRecords
WHERE department='Design';
#23
SELECT first_name,last_name,salary FROM EmployeeRecords;
#24
SELECT * FROM EmployeeRecords
WHERE salary >'70000';
#25
SELECT * FROM EmployeeRecords
WHERE employee_start_date BETWEEN '2020-05-01' AND '2022-03-05';
#26
UPDATE EmployeeRecords
SET phone_number = '9876543210'
WHERE employee_id='5';
#27
DELETE FROM EmployeeRecords
WHERE employee_status='Inactive';
#28
INSERT INTO EmployeeRecords (employee_id, first_name, last_name, gender,
 date_of_birth, employee_start_date, job_title, salary, email, phone_number, 
 address_line1, address_line2, city, state, zip_code, 
 country, manager_id, department)
VALUES
(1, 'Karthik', 'Nair', 'Male', '1991-01-15', '2019-05-10', 'Business Analyst', 72000.00, 'karthik.nair@gmail.com', '9900112233', 'abcd', 'efgh', 'Chennai', 'Tamil Nadu', '600002', 'India', 244, 'Business Analysis'),
(2, 'Divya', 'Sharma', 'Female', '1986-08-25', '2018-03-20', 'Content Writer', 50000.00, 'divya.sharma@gmail.com', '8800223344', 'ijkl', 'mnop', 'Coimbatore', 'Tamil Nadu', '641002', 'India', 245, 'Content'),
(3, 'Ravi', 'Kumar', 'Male', '1993-11-05', '2021-07-15', 'Network Engineer', 68000.00, 'ravi.kumar@gmail.com', '7700334455', 'qrst', 'uvwx', 'Madurai', 'Tamil Nadu', '625002', 'India', 246, 'IT'),
(4, 'Sneha', 'Patel', 'Female', '1990-04-18', '2020-01-25', 'Graphic Designer', 62000.00, 'sneha.patel@gmail.com', '6600445566', 'abcd', 'efgh', 'Tiruchirappalli', 'Tamil Nadu', '620002', 'India', 247, 'Design'),
(5, 'Vijay', 'Reddy', 'Male', '1988-09-30', '2017-06-10', 'Database Administrator', 78000.00, 'vijay.reddy@gmail.com', '5500556677', 'ijkl', 'mnop', 'Salem', 'Tamil Nadu', '636002', 'India', 248, 'Database'),
(6, 'Anjali', 'Verma', 'Female', '1992-12-20', '2022-03-05', 'SEO Specialist', 54000.00, 'anjali.verma@gmail.com', '4400667788', 'qrst', 'uvwx', 'Erode', 'Tamil Nadu', '638002', 'India', 249, 'Marketing'),
(7, 'Ramesh', 'Iyer', 'Male', '1987-07-12', '2016-11-20', 'System Administrator', 70000.00, 'ramesh.iyer@gmail.com', '3300778899', 'abcd', 'efgh', 'Tiruppur', 'Tamil Nadu', '641602', 'India', 250, 'IT'),
(8, 'Pooja', 'Nair', 'Female', '1994-05-25', '2021-09-15', 'Quality Analyst', 60000.00, 'pooja.nair@gmail.com', '2200889900', 'ijkl', 'mnop', 'Vellore', 'Tamil Nadu', '632002', 'India', 251, 'Quality Assurance'),
(9, 'Sanjay', 'Sharma', 'Male', '1989-03-10', '2019-12-20', 'Technical Writer', 58000.00, 'sanjay.sharma@gmail.com', '1100990011', 'qrst', 'uvwx', 'Thoothukudi', 'Tamil Nadu', '628002', 'India', 252, 'Content'),
(10, 'Lakshmi', 'Rao', 'Female', '1995-08-15', '2022-02-10', 'Product Designer', 95000.00, 'lakshmi.rao@gmail.com', '0000112233', 'abcd', 'efgh', 'Dindigul', 'Tamil Nadu', '624002', 'India', 253, 'Design');

#29
INSERT INTO ArchiveEmployees (employee_id, first_name, last_name, gender,
 date_of_birth, employee_start_date, job_title, salary, email, phone_number, 
 address_line1, address_line2, city, state, zip_code, 
 country, manager_id, department,employee_status)
 SELECT employee_id, first_name, last_name, gender,
 date_of_birth, employee_start_date, job_title, salary, email, phone_number, 
 address_line1, address_line2, city, state, zip_code, 
 country, manager_id, department,employee_status
 FROM EmployeeRecords
 WHERE employee_status='Inactive';
 #30
 SELECT * FROM EmployeeRecords
 WHERE manager_id IS NULL;
 #31
 UPDATE EmployeeRecords
 SET department='Finance'
 WHERE employee_id='3';
 #32
 DELETE FROM EmployeeRecords
 WHERE last_name LIKE 'S%';
#33
SELECT* FROM EmployeeRecords
WHERE salary =(SELECT MAX(salary) FROM EmployeeRecords);
#34
SELECT * FROM EmployeeRecords
WHERE email LIKE '%Kumar@gmail.com';
#34
START TRANSACTION ;
INSERT INTO EmployeeRecords
VALUES(11, 'Lakshmi', 'Rao', 'Female', '1995-08-15', '2022-02-10',
 'Product Designer', 95000.00, 'lakshmi.rao@gmail.com',
 '0000112233', 'abcd', 'efgh', 'Dindigul', 'Tamil Nadu', '624002', 'India', 253, 'Design',null);
 ROLLBACK;
-- Data Control Language
-- Create the new user
#35
CREATE USER 'hr_manager'@'localhost' IDENTIFIED BY 'hr2024';
select user,host from mysql.user;
#36
GRANT SELECT, INSERT, UPDATE,DELETE ON EmployeeRecords TO 'hr_manager'@'localhost';
#37
GRANT ALL PRIVILEGES ON  EmployeeRecords TO 'hr_manager'@'localhost';
#38
REVOKE ALL PRIVILEGES ON EmployeeRecords FROM 'hr_manager'@'localhost';
#39
GRANT SELECT  ON  EmployeeRecords TO 'hr_manager'@'localhost';
#40
REVOKE SELECT  ON  EmployeeRecords FROM 'hr_manager'@'localhost';
-- Transaction Control Language
#41
START TRANSACTION;
INSERT INTO EmployeeRecords (employee_id, first_name, last_name, gender, date_of_birth,
 employee_start_date, job_title, salary, email, phone_number,
 address_line1, address_line2, city, state, zip_code, country, manager_id, department)
VALUES (12, 'Lakshmi', 'Raj', 'Female', '1995-09-15', 
'2022-04-10', 'Product Designer', 85000.00, 'lakshmi.raj@gmail.com', 
'0000142233', 'abcd', 'efgh', 'Dindigul', 'Tamil Nadu', '624002', 'India', 254, 'Design');
ROLLBACK;
#42
START TRANSACTION;
UPDATE employeeRecords
SET salary='85000'
WHERE employee_id='2';
ROLLBACK;
#43
START TRANSACTION;
INSERT INTO EmployeeRecords
VALUES(11, 'Lakshmi', 'Rao', 'Female', '1995-08-15', '2022-02-10',
 'Product Designer', 85000.00, 'lakshmi.rao@gmail.com',
 '0000042233', 'hdhd', 'chah', 'Dindigul', 'Tamil Nadu', '624002', 'India', 253, 'Design',null),
(254, 'Lakshmi', 'Raj', 'Female', '1995-09-15', '2022-04-10',
 'Product Designer', 85000.00, 'lakshmi.raj@gmail.com',
 '0000142233', 'abcd', 'efgh', 'Dindigul', 'Tamil Nadu', '624002', 'India', 254, 'Design',null);
COMMIT;
#44
START TRANSACTION;
DELETE FROM EmployeeRecords
 WHERE employee_id='2';
 ROLLBACK;
-- Update multiple employee salaries
#45
START TRANSACTION;
UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'Sales';
COMMIT;
#46
START TRANSACTION;
INSERT INTO ManagerRecords (
    manager_id, first_name, last_name, gender,
    address_line1, address_line2) VALUES
    (103, 'Ali', 'Khan', 'Male','Karachi', 'Sindh'),
    (104, 'Sara', 'Ahmed', 'Female', 'Lahore', 'Punjab'),
    (105, 'Usman', 'Ali', 'Male',  'Islamabad', 'Islamabad' );
    ROLLBACK;
#47
START TRANSACTION;
INSERT INTO EmployeeRecords (
    employee_id, first_name, last_name, gender, date_of_birth,
    employee_start_date, job_title, salary, email, phone_number,
    address_line1, address_line2, city, state, zip_code, country, manager_id, department)
    VALUES(16, 'Abar', 'Khan', 'Male', '1985-06-15', '2024-07-10', 'Software Engineer', 
    70000, 'ali.khan@example.com', '03001234567', '123 Main St', 'Apt 4B', 'Karachi',
    'Sindh', '75500', 'Pakistan', 106, 'IT');
    ROLLBACK;
   #48 
START TRANSACTION;
 UPDATE employeerecords
 SET employee_status='Active'
 WHERE employee_start_date<= DATE_ADD(CURDATE(),INTERVAL 2020-01-01 YEAR );
ROLLBACK;
#49
    START TRANSACTION;
    UPDATE employeerecords
    SET salary = 100000
    WHERE first_name='Jhon';
    ROLLBACK;
-- Joins in mysql
-- inner join
CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(100)
);
INSERT INTO department (dept_id, department) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Legal'),
(8, 'Customer Support'),
(9, 'R&D'),
(10, 'Administration');
-- Create the Jobs table
CREATE TABLE Jobs (
    employee_id INT,
    job_title VARCHAR(50)
);

INSERT INTO Jobs (employee_id, job_title) VALUES
(1, 'Software Engineer'),
(2, 'Data Analyst'),
(3, 'Project Manager'),
(4, 'HR Specialist'),
(5, 'Marketing Manager'),
(6, 'Sales Executive'),
(7, 'Product Manager'),
(8, 'Graphic Designer'),
(9, 'IT Support Specialist'),
(10, 'Business Analyst');

#50
 SELECT first_name,last_name,department
FROM employeerecords e INNER JOIN department d
 ON e.employee_id=d.dept_id;
 -------
 CREATE TABLE salary (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    salary VARCHAR(100)
);
INSERT INTO salary (employee_id, salary) VALUES
(1, '10000'),
(2, '200000'),
(3, '25000'),
(4, '35000'),
(5, '40000'),
(6, '25000'),
(7, '50000'),
(8, '40000'),
(9, '30000'),
(10, '600000');
 #51
 SELECT first_name,last_name,job_title,salary
FROM employeerecords e INNER JOIN salary s
 ON e.employee_id=s.employee_id;
#52
SELECT employee_id,first_name,last_name,department,employee_status
FROM employeerecords e INNER JOIN department d
 ON e.employee_id=d.dept_id
 where employee_status='Active';
 #53
 SELECT employee_id,first_name,last_name,email,dept_id,department
FROM employeerecords e INNER JOIN department d
 ON e.employee_id=d.dept_id;
#54
SELECT employee_id,first_name,last_name,employee_start_date,department
FROM employeerecords e INNER JOIN department d
 ON e.employee_id=d.dept_id
 where employee_start_date>= DATE_ADD(CURDATE(),INTERVAL -2 YEAR);
 #55
 SELECT first_name,last_name,job_title,salary
FROM employeerecords e INNER JOIN salary s
 ON e.employee_id=s.employee_id
 WHERE job_title ='Software Engineer';
 #56
 SELECT e.employee_id,first_name,last_name,department,salary
 FROM employeerecords e INNER JOIN department d
 ON e.employee_id=d.dept_id
 INNER JOIN salary s
  ON e.employee_id=s.employee_id
 where salary > 70000;
 #57
 SELECT e1.employee_id, e1.first_name, e1.last_name, e1.department,m.manger_id,manager_name
FROM employeerecords e1
INNER JOIN mangerrecords m ON  e.employee_id=m.manger_id
WHERE e1.department = m.department;
alter table managerrecords
add department varchar(50);
#58
SELECT first_name,last_name,J.job_title,salary
 FROM employeerecords e INNER JOIN salary s
 ON e.employee_id=s.employee_id
 INNER JOIN jobs j
 ON e.employee_id=j.employee_id;
 -- LEFT JOIN
 #59
 SELECT employee_id,first_name,last_name,dept_id,d.department
FROM employeerecords e
LEFT JOIN department d
ON e.employee_id = d.dept_id;
 #60
 SELECT employee_id,first_name,last_name,manager_name
FROM employeerecords e
LEFT JOIN managerrecords m
ON e.employee_id = m.manager_id;
#61
SELECT e.employee_id,first_name,last_name,salary
FROM employeerecords e
LEFT JOIN salary s
ON e.employee_id = s.employee_id;
#62
SELECT first_name,last_name,j.job_title,department
 FROM employeerecords e LEFT JOIN department d
 ON e.employee_id=d.dept_id
 LEFT JOIN jobs j
 ON e.employee_id=j.employee_id;
 #63
 SELECT first_name,last_name,department
FROM employeerecords e LEFT JOIN department d
 ON e.employee_id=d.dept_id;
-- RIGHT JOINS
#64
SELECT first_name,last_name,j.job_title,department
FROM employeerecords e RIGHT JOIN department d
 ON e.employee_id=d.dept_id
 RIGHT JOIN jobs j
 ON e.employee_id=j.employee_id;
 #65
 SELECT first_name,last_name,department
 FROM employeerecords e
 RIGHT JOIN department d
 ON e.employee_id=d.dept_id;
 #66
 SELECT first_name,last_name,department,salary
 FROM employeerecords e 
 RIGHT JOIN department d
 ON e.employee_id=d.dept_id
 RIGHT JOIN salary s
 ON e.employee_id=s.employee_id;
 #67
 SELECT first_name,last_name,j.job_title
 FROM employeerecords e
 RIGHT JOIN jobs j
 ON e.employee_id=j.employee_id
 WHERE j.job_title IS NOT NULL;
 #68
 SELECT first_name,last_name,j.job_title
 FROM employeerecords e
 RIGHT JOIN jobs j
 ON e.employee_id=j.employee_id
 WHERE j.job_title IS  NULL;
 -- Subqueries in MYSQL
 #69
 SELECT * FROM salary
 WHERE salary=(SELECT MAX(salary) FROM salary);
 #70
 SELECT * FROM salary
 WHERE salary >(SELECT AVG(salary) FROM salary);
 #71
 SELECT employee_id,first_name,last_name,d.department FROM employeerecords e
 INNER JOIN (SELECT * FROM department d
 WHERE department LIKE '%Engineering%' ) AS d
 ON e.employee_id=d.dept_id;
 #72
 SELECT * FROM salary
 WHERE salary > 80000 AND (SELECT MAX(salary) FROM salary);
#73
SELECT department_id, department_name
FROM departments
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY COUNT(*) DESC
);

#74
SELECT employee_id,first_name,last_name,employee_start_date
 FROM employeerecords e
 WHERE employee_start_date IN (SELECT employee_start_date FROM employeerecords
 WHERE employee_start_date >= DATE_ADD(CURDATE(),INTERVAL -3 YEAR));
#75
SELECT department, salary FROM salary s
INNER JOIN department d
ON s.employee_id=d.dept_id
WHERE salary  > (SELECT AVG(salary) FROM salary s)
AND department IN (SELECT department FROM department
GROUP BY department
);
#76
SELECT employee_id, first_name, last_name, job_title
FROM employeerecords
WHERE job_title = (SELECT job_title FROM employeerecords
 WHERE first_name = 'John' AND last_name = 'Doe');
#77
SELECT employee_id, first_name,last_name, employee_start_date
FROM employeerecords
WHERE employee_start_date = (
    SELECT MIN(employee_start_date)
    FROM employeerecords
);
#78
SELECT employee_id,first_name,last_name, d.dept_id,d.department
FROM employeerecords e
 INNER JOIN department d
 ON e.employee_id=d.dept_id
WHERE dept_id = (
    SELECT dept_id
    FROM employeerecords
    GROUP BY dept_id
    ORDER BY COUNT(*) DESC
);
-- Correlated Subquery
#79
SELECT department, salary FROM employeerecords s
WHERE salary  > (SELECT AVG(salary) FROM salary s )
AND department IN (SELECT department FROM department
GROUP BY department
);
#80
SELECT e.employee_id, e.first_name, e.job_title, e.salary
FROM employeerecords e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employeerecords e2
    WHERE e2.job_title = e.job_title
);
#81
SELECT employee_id, first_name, last_name, employee_start_date
FROM employeerecords e
WHERE employee_start_date < (
    SELECT MIN(employee_start_date)
    FROM employeerecords
    WHERE department= (
        SELECT department
        FROM employeerecords
        WHERE department = 'Database'
    )
);
#82
SELECT e.first_name, e.department, e.salary
FROM employeerecords e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employeerecords e2
    WHERE e2.employee_id = e.employee_id
);
#83
SELECT employee_id, first_name, last_name, employee_start_date, department
FROM employeerecords e1
WHERE employee_start_date < (
    SELECT AVG(employee_start_date)
    FROM employeerecords e2
    WHERE e1.employee_id = e2.employee_id
);
#84
SELECT employee_id, first_name, last_name, salary, department
FROM employeerecords e1
WHERE salary > (
    SELECT MAX(salary)
    FROM employeerecords e2
    WHERE e2.department = (
        SELECT department
        FROM department
        WHERE department = 'HR'
    )
);
#85
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.employee_start_date, e1.manager_id
FROM employeerecords e1
WHERE e1.employee_start_date < (
    SELECT e2.employee_start_date
    FROM employeerecords e2
    WHERE e2.employee_id = e1.manager_id
);
#86
SELECT *
FROM employees e
WHERE salary > (
    SELECT MAX(salary)
    FROM employees e
    WHERE e.department = 'Finance'
);
#87
SELECT *
FROM employees e
WHERE employee_start_date < (
    SELECT MIN(employee_start_date)
    FROM employees e
    WHERE e.department = 'Marketing'
);

