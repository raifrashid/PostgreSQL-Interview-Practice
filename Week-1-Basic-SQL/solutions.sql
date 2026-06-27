-- ==========================================================
-- PostgreSQL Interview Practice
-- Week 12 - Basic SQL
-- ==========================================================

-- ----------------------------------------------------------
-- Q1. Create the Employee table
-- ----------------------------------------------------------

CREATE TABLE Employee (
    Employee_id SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Salary INT NOT NULL,
    Joining_Date DATE
);

-- ----------------------------------------------------------
-- Insert Sample Data
-- ----------------------------------------------------------

INSERT INTO Employee (Name, Department, Salary, Joining_Date)
VALUES
('Ali', 'IT', 50000, '2024-01-15'),
('Sara', 'HR', 45000, '2024-02-10'),
('Ahmed', 'Finance', 60000, '2024-03-05'),
('Ayesha', 'Marketing', 55000, '2024-01-20'),
('Bilal', 'IT', 70000, '2023-12-01'),
('Hina', 'Sales', 48000, '2024-04-12'),
('Usman', 'Finance', 65000, '2024-02-25'),
('Fatima', 'HR', 52000, '2024-03-18'),
('Hamza', 'Marketing', 58000, '2024-05-01'),
('Zain', 'IT', 75000, '2023-11-15');

-- ----------------------------------------------------------
-- Q2. Select all columns from the Employee table
-- ----------------------------------------------------------

SELECT *
FROM Employee;

-- ----------------------------------------------------------
-- Q3. Display only Name and Department columns
-- ----------------------------------------------------------

SELECT Name,
       Department
FROM Employee;

-- ----------------------------------------------------------
-- Q4. Show all employees who work in the IT department
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Department = 'IT';

-- ----------------------------------------------------------
-- Q5. Retrieve employees with a salary greater than 45,000
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Salary > 45000;

-- ----------------------------------------------------------
-- Q6. Show employees who joined after 2024-01-01
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Joining_Date > '2024-01-01';

-- ----------------------------------------------------------
-- Q7. Retrieve employees with a salary between 50,000 and 65,000
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Salary BETWEEN 50000 AND 65000;

-- ----------------------------------------------------------
-- Q8. Display employees whose department is either HR or Finance
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Department IN ('HR', 'Finance');

-- ----------------------------------------------------------
-- Q9. Retrieve employees whose name starts with 'S'
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Name LIKE 'S%';

-- ----------------------------------------------------------
-- Q10. Show employees whose name ends with 'a'
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Name LIKE '%a';

-- ----------------------------------------------------------
-- Q11. Display employees ordered by salary in descending order
-- ----------------------------------------------------------

SELECT *
FROM Employee
ORDER BY Salary DESC;

-- ----------------------------------------------------------
-- Q12. Display the first 3 employees based on joining date
-- ----------------------------------------------------------

SELECT *
FROM Employee
ORDER BY Joining_Date
LIMIT 3;

-- ----------------------------------------------------------
-- Q13. Retrieve employees skipping the first 2 rows
-- ----------------------------------------------------------

SELECT *
FROM Employee
OFFSET 2 ROWS;

-- ----------------------------------------------------------
-- Q14. Show employee names as Employee_Name using alias
-- ----------------------------------------------------------

SELECT Name AS Employee_Name
FROM Employee;

-- ----------------------------------------------------------
-- Q15. Display Department as Dept and Salary as Income
-- ----------------------------------------------------------

SELECT Department AS Dept,
       Salary AS Income
FROM Employee;

-- ----------------------------------------------------------
-- Q16. Show top 3 highest paid employees
-- ----------------------------------------------------------

SELECT Name AS Employee_Name,
       Salary AS Income
FROM Employee
ORDER BY Salary DESC
LIMIT 3;

-- ----------------------------------------------------------
-- Q17. Find the highest salary in the Employee table
-- ----------------------------------------------------------

SELECT MAX(Salary) AS Highest_Salary
FROM Employee;

-- ----------------------------------------------------------
-- Q18. Find the total number of employees in each department
-- ----------------------------------------------------------

SELECT Department,
       COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Department;

-- ----------------------------------------------------------
-- Q19. Show the average salary of all employees
-- ----------------------------------------------------------

SELECT ROUND(AVG(Salary), 2) AS Average_Salary
FROM Employee;

-- ----------------------------------------------------------
-- Q20. Display the employee(s) with the lowest salary
-- ----------------------------------------------------------

SELECT *
FROM Employee
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Employee
);