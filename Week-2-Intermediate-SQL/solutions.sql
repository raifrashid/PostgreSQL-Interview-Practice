## Q1. Count how many employees are in each Department.

```sql
SELECT DepartmentID,
       COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DepartmentID;
```

---

## Q2. Find the average salary per department.

```sql
SELECT DepartmentID,
       AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DepartmentID;
```

---

## Q3. Show the highest and lowest salary in each department.

```sql
SELECT DepartmentID,
       MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM Employee
GROUP BY DepartmentID;
```

---

## Q4. Show the total salary paid per department.

```sql
SELECT DepartmentID,
       SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY DepartmentID;
```

---

## Q5. Count how many employees joined in each year (use YEAR(JoiningDate)).

> **PostgreSQL Note:** PostgreSQL does not support `YEAR()`. Use `EXTRACT(YEAR FROM JoiningDate)` instead.

```sql
SELECT EXTRACT(YEAR FROM JoiningDate) AS JoiningYear,
       COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY EXTRACT(YEAR FROM JoiningDate)
ORDER BY JoiningYear;
```

---

## Q6. Find departments that have more than 1 employee.

```sql
SELECT DepartmentID,
       COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DepartmentID
HAVING COUNT(*) > 1;
```

---

## Q7. Find departments where average salary > 50,000.

```sql
SELECT DepartmentID,
       AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;
```

---

## Q8. Find joining years where more than 2 employees joined.

> **PostgreSQL Note:** PostgreSQL uses `EXTRACT(YEAR FROM JoiningDate)` instead of `YEAR()`.

```sql
SELECT EXTRACT(YEAR FROM JoiningDate) AS JoiningYear,
       COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY EXTRACT(YEAR FROM JoiningDate)
HAVING COUNT(*) > 2
ORDER BY JoiningYear;
```

---

## Q9. Perform an INNER JOIN to show Employee Name with their Department Manager.

```sql
SELECT e.Name AS EmployeeName,
       d.ManagerName
FROM Employee e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID;
```

---

## Q10. Perform a LEFT JOIN to list all employees and their managers, even if manager info is missing.

```sql
SELECT e.Name AS EmployeeName,
       d.ManagerName
FROM Employee e
LEFT JOIN Department d
ON e.DepartmentID = d.DepartmentID;
```

---

## Q11. Show total salary per department using JOIN + GROUP BY.

```sql
SELECT d.DepartmentName,
       SUM(e.Salary) AS TotalSalary
FROM Employee e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
```

---

## Q12. Find the employee with the highest salary using a subquery.

```sql
SELECT *
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
);
```

---

## Q13. Find all employees who earn more than the average salary.

```sql
SELECT *
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);
```

---

## Q14. Find the second highest salary using a subquery.

```sql
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employee
);
```

---

## Q15. Find employees who joined after the employee with the lowest salary.

```sql
SELECT *
FROM Employee
WHERE JoiningDate > (
    SELECT JoiningDate
    FROM Employee
    WHERE Salary = (
        SELECT MIN(Salary)
        FROM Employee
    )
);
```
---

## Q16. List all departments that have any employee earning more than 60,000.

```sql
SELECT DISTINCT d.DepartmentName
FROM Department d
INNER JOIN Employee e
ON d.DepartmentID = e.DepartmentID
WHERE e.Salary > 60000;
```

---

## Q17. Find the total number of employees and total salary in each department.

```sql
SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees,
       SUM(e.Salary) AS TotalSalary
FROM Department d
INNER JOIN Employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;
```

---

## Q18. List all employees whose salary is the maximum in their department.

```sql
SELECT *
FROM Employee e
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
    WHERE DepartmentID = e.DepartmentID
);
```

---

## Q19. Show all departments where no employee earns less than 45,000 (use HAVING).

```sql
SELECT d.DepartmentName
FROM Department d
INNER JOIN Employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING MIN(e.Salary) >= 45000;
```

---

## Q20. Find employees whose joining year is the same as any HR department employee (use subquery).

> **PostgreSQL Note:** PostgreSQL uses `EXTRACT(YEAR FROM JoiningDate)` instead of `YEAR()`.

```sql
SELECT *
FROM Employee
WHERE EXTRACT(YEAR FROM JoiningDate) IN (
    SELECT EXTRACT(YEAR FROM e.JoiningDate)
    FROM Employee e
    INNER JOIN Department d
    ON e.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = 'HR'
);
```

---

# 🏁 End of Week 13

You have practiced:

- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Subqueries
- Real-world SQL queries