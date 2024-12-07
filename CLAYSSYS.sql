CREATE DATABASE lgform;
DROP TABLE login;
CREATE TABLE login(
id INT,
email_e VARCHAR(26),
password_p VARCHAR(26),
);

INSERT INTO login VALUES(1,'arvind18@gmail.com','123we4'),(2,'anand177@gmail.com','4yui2'),(3,'tilak12@gmail.com','1ty8');

SELECT * from login;

CREATE TABLE registration_table(
first_name VARCHAR(26),
last_name VARCHAR(26),
dob VARCHAR(28),
pword VARCHAR(28),
cpword VARCHAR(28),
email_name VARCHAR(30),
city VARCHAR(28),
country VARCHAR(30)
);

INSERT INTO registration_table VALUES('arun','kumar','12/02/2002',1234,1234,'arun2002@gmail.com','chennai','INDIA'),
('vijay','kumar','02/04/2000',3421,3421,'vijay2000@gmail.com','chennai','INDIA')
,('ajith','kumar','19/09/2002',3120,3120,'ajith2002@gmail.com','theni','INDIA')
,('john','doe','12/11/2001',5430,5430,'john2001@gmail.com','Kuala Lumpur','Malayasia')

SELECT * from registration_table

UPDATE registration_table 
SET city ='Dindugal'
WHERE  first_name='vijay'

SELECT * from registration_table

CREATE TABLE employeee(
id INT,
emp_name VARCHAR(26),
salary_emp DECIMAL(10,2)
);

INSERT INTO employeee VALUES(1,'ANDREW',8000),(2,'THOMAS',7000),(3,'NITHIN',7500);

SELECT * from employeee

SELECT MAX(salary_emp) AS SecondHighestSalary
FROM employeee
WHERE salary_emp < (SELECT MAX(salary_emp) FROM employeee);

SELECT id,emp_name,salary_emp FROM employeee
WHERE salary_emp=(
  SELECT MAX(salary_emp) FROM employeee
  WHERE salary_emp < (SELECT MAX(salary_emp) FROM employeee)
);


ALTER TABLE employeee
ADD emp_department VARCHAR(28);

SELECT * FROM employeee

INSERT INTO employeee(emp_department) VALUES ('tech'),('non-tech'),('tech'),('non-tech');


DELETE  FROM  employeee
WHERE emp_department IN ('tech','non-tech','tech','non-tech');

SELECT * FROM employeee

INSERT INTO employeee(id) VALUES(4,5,6,7);

UPDATE employeee
SET emp_department = 'tech'
WHERE id=1;

UPDATE employeee
SET emp_department = 'tech'
WHERE id=2;

UPDATE employeee
SET emp_department = 'non-tech'
WHERE id=3;

SELECT * FROM employeee

SELECT emp_department ,COUNT(*) AS EMPLOYERS_COUNT
FROM employeee
GROUP BY emp_department;

DROP TABLE employeee
DROP TABLE branch

CREATE TABLE branch(
branch_id INT,
branch_name VARCHAR(40) ,
PRIMARY KEY (branch_id),
);


CREATE TABLE employee(
emp_id INT,
e_name VARCHAR(30),
job_desc VARCHAR(30),
e_salary INT,
branch_id INT,
PRIMARY KEY(emp_id),
CONSTRAINT FK_branchId FOREIGN KEY(branch_id) REFERENCES branch(branch_id)

);

INSERT INTO employee VALUES (1,'ANIL','MANAGER',10000,101),
(2,'Anu','ADMIN',5000,100),
(3,'SUNIL','ENGINEER',8000,102),
(4,'SURYA','ENGINEER',8000,102),
(5,'VIJAY','ENGINEER',8000,102),
(6,'VIKRAM','ENGINEER',8000,102),
(7,'SIVA','TESTER',7000,103),
(8,'SANKAR',NULL,7000,NULL)


INSERT INTO branch VALUES(100,'Coimbatore'),(101,'Bengaluru'),
(102,'Hyderabad'),(103,'Chennai'),(104,'London')
DROP TABLE employee
DROP TABLE branch

SELECT * FROM branch
SELECT * FROM employee



DROP TABLE branch

SELECT * FROM employee
CROSS JOIN branch 
ON employee.branch_id=branch.branch_id;

DROP PROCEDURE getDetailsofEmployee
CREATE PROCEDURE getDetailsofEmployee
as
BEGIN
   
   UPDATE  employee
   SET job_desc='TESTER'
   WHERE emp_id=5;

   SELECT * FROM employee;
END

exec getDetailsofEmployee;


CREATE PROCEDURE UpdateEmployeeSalary(@EmployeeID INT ,@NewSalary DECIMAL)
AS
BEGIN
UPDATE employee
SET e_salary=@NewSalary
WHERE emp_id=@EmployeeID;
 
END;

exec UpdateEmployeeSalary @EmployeeID = 4 , @NewSalary = 10000;

CREATE TABLE registration_table(
first_name VARCHAR(26),
last_name VARCHAR(26),
dob VARCHAR(28),
pword VARCHAR(28),
cpword VARCHAR(28),
email_name VARCHAR(30),
city VARCHAR(28),
country VARCHAR(30)
);

INSERT INTO registration_table VALUES('arun','kumar','12/02/2002',1234,1234,'arun2002@gmail.com','chennai','INDIA'),
('vijay','kumar','02/04/2000',3421,3421,'vijay2000@gmail.com','chennai','INDIA')
,('ajith','kumar','19/09/2002',3120,3120,'ajith2002@gmail.com','theni','INDIA')
,('john','doe','12/11/2001',5430,5430,'john2001@gmail.com','KualaLumpur','Malaysia')

SELECT * FROM registration_table

CREATE PROCEDURE getDetailsregFormError
as 
BEGIN 
BEGIN TRY
UPDATE registration_table
SET pword = 1122 , cpword = 1122
WHERE first_name='vijay';
END TRY

BEGIN CATCH
INSERT INTO Errorlog(ErrorMessage,ErrorDate)
VALUES(ERROR_MESSAGE(),GETDATE());
RAISERROR(ERROR_MESSAGE(),16,1);
END CATCH;
END;


exec getDetailsregForm;