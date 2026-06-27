CREATE TABLE Employee (
    Employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    joining_date DATE
);