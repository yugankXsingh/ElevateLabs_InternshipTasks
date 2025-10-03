# SQL Practice: Stored Procedures & Functions - Task 8

This project was completed as part of the Elevate Labs Internship program. This task covers the creation and use of reusable SQL code blocks: Stored Procedures and Functions.

## Important Prerequisite

This task **requires MySQL or a similar database system (like PostgreSQL or SQL Server)**. The features demonstrated here are **not available in SQLite**.

---

## Objective

The objective is to learn how to modularize complex SQL logic into named, reusable routines that can be stored in the database. This improves code organization, reusability, and security.

---

## Key Concepts Practiced 📜

This task focuses on the two main types of stored routines in SQL.

* **Stored Procedure**:
    * A pre-compiled block of SQL statements that can be executed as a single unit.
    * Invoked using the `CALL` statement.
    * Can accept input (`IN`), output (`OUT`), and input/output (`INOUT`) parameters.
    * Ideal for encapsulating business logic, performing data validation, or running scheduled tasks.

* **Function**:
    * A routine that performs a calculation and **must return a single value**.
    * Can be used directly within SQL statements (e.g., in a `SELECT` list or `WHERE` clause), much like built-in functions like `SUM()` or `CONCAT()`.
    * Ideal for creating custom formulas or calculations that need to be used repeatedly.

* **Key Differences**: The main distinction is that a function is designed to return a single value to be used in a query, whereas a procedure is designed to execute a set of actions.

* **`DELIMITER`**: In MySQL, the `DELIMITER` command is used to change the character that signifies the end of a statement. This is necessary when creating routines because they can contain multiple statements that end with a semicolon (`;`). By changing the delimiter to `$$`, we can define the entire routine as a single block.

---

## How to Use

1.  Open the task's SQL script in **MySQL Workbench**.
2.  Execute the **SETUP** portion of the script to create the base tables and data.
3.  Execute the `CREATE PROCEDURE` and `CREATE FUNCTION` blocks. The routines will be saved in the database schema (look for "Stored Procedures" and "Functions" in the navigator).
4.  Run the `CALL` statement and the final `SELECT` query to see how to use the created procedure and function.