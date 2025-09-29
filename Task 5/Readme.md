# SQL Practice: Table Joins - Task 5

This project was completed as part of the Elevate Labs Internship program. This task is dedicated to understanding and implementing the different types of SQL `JOIN` clauses to combine data from multiple tables.

## Objective

The objective is to master the techniques for merging data from two or more related tables. This involves learning the syntax and behavior of `INNER`, `LEFT`, `RIGHT`, and `FULL OUTER` joins.

---

## Database Schema

A simple two-table schema was created to clearly demonstrate the behavior of each join type. The data includes records that do not have matches in the other table, which is essential for seeing the differences.

* **`departments`**: Stores a list of company departments.
    * `dept_id` (Primary Key), `dept_name`
* **`employees`**: Stores a list of employees.
    * `emp_id` (Primary Key), `emp_name`, `dept_id` (Foreign Key)

The schema includes one department with no employees and one employee with no department.

---

## Key Concepts Practiced 🧩

This task covers the four primary types of SQL joins, which are fundamental to working with relational databases.

| Join Type         | Description                                                                                          |
| ----------------- | ---------------------------------------------------------------------------------------------------- |
| **`INNER JOIN`** | Returns only the records that have matching values in **both** tables.                               |
| **`LEFT JOIN`** | Returns **all** records from the left table, and the matched records from the right table.             |
| **`RIGHT JOIN`** | Returns **all** records from the right table, and the matched records from the left table.             |
| **`FULL OUTER JOIN`** | Returns all records when there is a match in **either** the left or the right table.                 |

**Note:** `RIGHT JOIN` and `FULL OUTER JOIN` are not supported in SQLite. MySQL does not have a native `FULL OUTER JOIN` but it can be simulated using a `UNION` of a `LEFT` and `RIGHT` join.

---

## How to Use

1.  Open the task's SQL script in a compatible database tool (DB Browser for SQLite, MySQL Workbench).
2.  Execute the "SETUP" portion of the script to create and populate the tables.
3.  Run each of the practice queries individually to see the different ways data can be combined. Pay close attention to which rows are included or excluded by each join type.
