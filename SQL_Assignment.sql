create database Employee;

CREATE TABLE Employee.EmployeeDetails(
EmpId INT(3) NOT NULL AUTO_INCREMENT,
FullName VARCHAR(20),
ManagerId INT(3),
DateOfJoining DATE,
City CHAR(10),
PRIMARY KEY(EmpId)
);
SELECT * FROM employee.Employeedetails;

CREATE TABLE Employee.EmployeeSalary(
EmpId INT(3) NOT NULL AUTO_INCREMENT,
Project VARCHAR(20),
Salary  INT(10),
Variable INT(10),
PRIMARY KEY(EmpId)
);

SELECT * FROM employee.EmployeeSalary;


SELECT * FROM employee.Employeedetails;
INSERT INTO Employee.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(1,"JOHN",123,'1990-12-12',"Mumbai");

INSERT INTO Employee.EmployeeDetails(EmpId,FullName,ManagerId,DateOfJoining,City)
VALUES(2,"ALEX","256",'1995-10-25',"Mumbai");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("SELENA","389",'1998-04-25',"Bangalore");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("TOM",435,'2005-02-23',"Pune");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("JACK",540,'2006-05-18',"Chennai");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("ROBERT",620,'2008-06-21',"Pune");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("MARY",695,'2010-10-14',"Bangalore");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("RMathews",702,'2009-01-06',"Delhi");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("HARRY",802,'2008-09-12',"Kerala");

INSERT INTO Employee.EmployeeDetails(FullName,ManagerId,DateOfJoining,City)
VALUES("HUSSY",815,'2006-07-10,',"Delhi");

INSERT INTO Employee.EmployeeDetails(FullName,DateOfJoining,City)
VALUES("Tim",'2020-05-19',"Mumbai");

INSERT INTO Employee.EmployeeDetails(FullName,DateOfJoining,City)
VALUES("Binny",'2020-11-06',"Kerala");

INSERT INTO Employee.EmployeeDetails(FullName,DateOfJoining,City)
VALUES("Michael",'2020-09-10',"Gujarat");



SELECT * FROM employee.EmployeeSalary;
INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(1,"A1",50000,3000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(2,"A2",55000,2000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(3,"A1",60000,3000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(4,"B1",45000,2000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(5,"B2",40000,1000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(6,"A2",35000,1000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(7,"B1",45000,2000);


INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(8,"A1",65000,3500);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(9,"B1",45000,2000);

INSERT INTO Employee.EmployeeSalary(EmpId,Project,Salary,Variable)
VALUES(10,"A1",60000,3000);

INSERT INTO Employee.EmployeeSalary(EmpId,Salary,Variable)
VALUES(11,35000,0);

INSERT INTO Employee.EmployeeSalary(EmpId,Salary,Variable)
VALUES(12,30000,0);

INSERT INTO Employee.EmployeeSalary(EmpId,Variable)
VALUES(13,0);




-- 1.SQL Query to fetch records that are present in one table but not in another table.
-- Method-1:
SELECT * FROM Employee.EmployeeDetails LEFT JOIN Employee.EmployeeSalary ON EmployeeDetails.EmpId = EmployeeSalary.EmpId;
-- Method-2:
SELECT Employee.EmployeeDetails.*
FROM Employee.EmployeeDetails
LEFT JOIN
Employee.EmployeeSalary USING (EmpId)
WHERE Employee.EmployeeSalary.EmpId IS NULL;

  
-- 2.SQL query to fetch all the employees who are not working on any project.
SELECT EmpId 
FROM Employee.EmployeeSalary
WHERE Project IS NULL;

-- 3.SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
SELECT * FROM Employee.EmployeeDetails
WHERE YEAR(DateOfJoining) = '2020';

-- 4.Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.      
SELECT * FROM Employee.EmployeeDetails E
WHERE EXISTS
(SELECT * FROM Employee.EmployeeSalary S 
WHERE  E.EmpId = S.EmpId);

-- 5.Write an SQL query to fetch a project-wise count of employees.
SELECT Project, count(EmpId) EmpProjectCount
FROM Employee.EmployeeSalary
GROUP BY Project
ORDER BY EmpProjectCount DESC;

-- 6.Fetch employee names and salaries even if the salary value is not present for the employee.
SELECT E.FullName, S.Salary 
FROM Employee.EmployeeDetails E 
LEFT JOIN 
Employee.EmployeeSalary S
ON E.EmpId = S.EmpId;

-- 7.Write an SQL query to fetch all the Employees who are also managers.
SELECT DISTINCT E.FullName
FROM Employee.EmployeeDetails E
INNER JOIN Employee.EmployeeDetails M
ON E.EmpID = M.ManagerID;

-- 8.Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT FullName, ManagerId, DateOfJoining, City, COUNT(*)
FROM EmployeeDetails
GROUP BY FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;

-- 9.Write an SQL query to fetch only odd rows from the table.
SELECT * FROM  Employee.EmployeeDetails
WHERE MOD (EmpId, 2) <> 0;

-- 10.Write a query to find the 3rd highest salary from a table without top or limit keyword.
SELECT Salary
FROM Employee.EmployeeSalary Emp1
WHERE 3 =(
		SELECT COUNT( DISTINCT ( Emp2.Salary ) )
        FROM Employee.EmployeeSalary Emp2
		WHERE Emp2.Salary > Emp1.Salary
		);
      
      
      


