-------------  UC1 - Create Database payroll_services ------------
CREATE DATABASE payroll_services;
USE payroll_services;
-------------  UC2 - Create employee_payroll table ------------
CREATE TABLE employee_payroll
    (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    salary DOUBLE NOT NULL,
    start DATE NOT NULL,
    PRIMARY KEY(id)
    );
    DESC employee_payroll;
    
-------------  UC3 - CRUD Operation(Insert in table) on employee_payroll table ------------
INSERT INTO employee_payroll (name, salary, start)
VALUES
('Bill', 1000000.00, '2010-10-30'),
('Tersia', 2000000.00, '2019-11-13'),
('Charlie', 3000000.00, '2050-05-21');

-------------  UC4 - Retrieve all data from table ------------
SELECT * FROM employee_payroll;

-------------  UC5 - Retrieve specific data from table ------------
SELECT salary FROM employee_payroll WHERE name='Bill';

-------------  UC6 - Alter table to add gender and update rows ------------
ALTER TABLE employee_payroll ADD gender CHAR(1) AFTER name;

DESC employee_payroll;

SET SQL_SAFE_UPDATES = 0;
UPDATE employee_payroll SET gender = 'M' WHERE name='Bill' OR name='Charlie';
UPDATE employee_payroll SET gender = 'F' WHERE name='Tersia';

SELECT * FROM employee_payroll;
ALTER TABLE employee_payroll modify gender CHAR(1) NOT NULL;

-------------  UC7 - Find sum, average, min, max and count no. of male and female employees ------------
SELECT AVG(salary) FROM employee_payroll;

-------------  Insert a row in the table ----------
INSERT INTO employee_payroll (name, gender, salary, start) VALUES ('Jenny', 'F', 2300000.00, '2022-10-13');

SELECT AVG(salary) FROM employee_payroll WHERE gender='M' GROUP BY gender;

SELECT AVG(salary) FROM employee_payroll WHERE gender='F' GROUP BY gender;

SELECT gender,AVG(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, SUM(salary) FROM employee_payroll GROUP BY gender;

SELECT gender, MAX(salary), MIN(salary) FROM employee_payroll GROUP BY gender;

SELECT COUNT(id) AS female_count FROM employee_payroll WHERE gender='F' GROUP BY gender;