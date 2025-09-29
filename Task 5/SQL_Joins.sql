-- =================================================================
-- 1. SETUP: CREATE AND POPULATE TABLES
--    The schema is designed to show the differences between join types.
-- =================================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create the 'departments' table
CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL
);

-- Create the 'employees' table
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT NOT NULL,
    dept_id INTEGER -- This can be NULL
);

-- Insert data into 'departments'
-- Note: 'HR' department (ID 4) will have no employees.
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'HR');

-- Insert data into 'employees'
-- Note: 'Charlie' has a NULL dept_id and is not in any department.
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', NULL),
(104, 'David', 1),
(105, 'Eve', 3);


-- =================================================================
-- 2. PRACTICE QUERIES
--    Queries demonstrating INNER, LEFT, RIGHT, and FULL joins.
-- =================================================================

-- Query 1: INNER JOIN
-- Returns only the rows where the join condition is met in BOTH tables.
-- It will only show employees who are assigned to a department.
-- Notice: 'Charlie' (no department) and 'HR' (no employees) are missing.
SELECT
    e.emp_name,
    d.dept_name
FROM
    employees AS e
INNER JOIN
    departments AS d ON e.dept_id = d.dept_id;

---

-- Query 2: LEFT JOIN (or LEFT OUTER JOIN)
-- Returns ALL rows from the LEFT table (employees), and the matched rows from the RIGHT table (departments).
-- If there is no match, the columns from the right table will be NULL.
-- Notice: 'Charlie' is included, but his dept_name is NULL. 'HR' is still missing.
SELECT
    e.emp_name,
    d.dept_name
FROM
    employees AS e
LEFT JOIN
    departments AS d ON e.dept_id = d.dept_id;

---

-- Query 3: RIGHT JOIN (or RIGHT OUTER JOIN)
-- !! NOTE: This will NOT work in SQLite. It works in MySQL and PostgreSQL. !!
-- Returns ALL rows from the RIGHT table (departments), and the matched rows from the LEFT table (employees).
-- Notice: The 'HR' department is included, but its emp_name is NULL. 'Charlie' is missing.
SELECT
    e.emp_name,
    d.dept_name
FROM
    employees AS e
RIGHT JOIN
    departments AS d ON e.dept_id = d.dept_id;

---

-- Query 4: FULL OUTER JOIN
-- !! NOTE: This will NOT work in SQLite or standard MySQL. It works in PostgreSQL. !!
-- Returns ALL rows when there is a match in either the left or the right table.
-- It is a combination of LEFT and RIGHT JOIN.
-- Notice: 'Charlie' AND the 'HR' department are both included.
SELECT
    e.emp_name,
    d.dept_name
FROM
    employees AS e
FULL OUTER JOIN
    departments AS d ON e.dept_id = d.dept_id;

-- Alternative for FULL OUTER JOIN in MySQL/SQLite (using UNION)
-- This combines the results of a LEFT JOIN and a RIGHT JOIN.
SELECT e.emp_name, d.dept_name
FROM employees AS e
LEFT JOIN departments AS d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM departments AS d
LEFT JOIN employees AS e ON e.dept_id = d.dept_id;