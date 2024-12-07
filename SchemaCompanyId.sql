USE CompanyDB;

CREATE SCHEMA HR;
CREATE SCHEMA FINANCE;

CREATE TABLE HR.Department(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(30)
);

CREATE TABLE HR.Employees(
Employee_ID INT PRIMARY KEY ,
first_name VARCHAR(30),
last_name VARCHAR(30),
DepartmentID INT ,
FOREIGN KEY (DepartmentID) REFERENCES HR.Department(DepartmentID)
);

ALTER TABLE HR.Employees
ADD EmailAddress VARCHAR(30) UNIQUE,
DOB VARCHAR(30) NOT NULL,
Salary Decimal(10,2) DEFAULT 3000,
Job_decs VARCHAR(30);

ALTER TABLE HR.Employees
ALTER COLUMN DOB DATE NOT NULL;

CREATE TABLE FINANCE.salaries(
salaryID INT PRIMARY KEY ,
Employee_ID INT,
MonthlySalary DECIMAL(10,2),
PayDate DATE
FOREIGN KEY (Employee_ID) REFERENCES HR.Employees(Employee_ID)
);

INSERT INTO HR.Department(DepartmentID , DepartmentName) VALUES (1,'IT'),(2,'HR');

INSERT INTO HR.Employees(Employee_ID , first_name , last_name , DepartmentID , DOB ,EmailAddress ) VALUES (1, 'John', 'Doe', 1, '1985-06-15', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 2, '1990-08-22', 'jane.smith@example.com');

INSERT INTO FINANCE.salaries (salaryID,Employee_ID,MonthlySalary,PayDate) VALUES (101, 1, 5000, '2024-12-01'),
(102, 2, 5500, '2004-12-01'),
(103, 1, 6000, '2014-02-01'),
(104, 1, 4500, '2008-12-04'),
(105, 1, 7000, '2001-03-01');

CREATE TABLE HR.JobTitles(
JobTitleID INT PRIMARY KEY ,
Jobtitle VARCHAR(30)
);

ALTER TABLE HR.Employees
ADD JobTitleID INT 
FOREIGN KEY (JobTitleID) REFERENCES HR.JobTitles(JobTitleID);

INSERT INTO HR.JobTitles(JobTitleID,Jobtitle) VALUES (1,'DEVELOPER'),(2,'HR MANAGER');

UPDATE HR.Employees
SET JobTitleID=1 WHERE Employee_ID=1;


UPDATE HR.Employees
SET JobTitleID=2 WHERE Employee_ID=2;
go

CREATE VIEW HR.EmployeeSalaryView
AS

SELECT e.Employee_ID, e.first_name, e.last_name, jt.Jobtitle, s.MonthlySalary
FROM HR.Employees e

JOIN Finance. Salaries s 
ON e.Employee_ID = s.Employee_ID

JOIN HR.JobTitles jt 
ON e. JobTitleID = jt. JobTitleID;