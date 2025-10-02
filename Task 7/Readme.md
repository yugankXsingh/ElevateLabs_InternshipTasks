# SQL Practice: Creating and Using Views - Task 7

This project was completed as part of the Elevate Labs Internship program. This task focuses on creating and using SQL Views to simplify complex queries and enhance database security.

## Objective

The objective is to understand how to encapsulate complex `SELECT` logic into a reusable, virtual table known as a View. This demonstrates the concepts of data abstraction and reusable SQL logic.

---

## Database Schema

This task is built upon the three-table schema (`authors`, `books`, `sales`) used in previous exercises. This schema is suitable for creating meaningful views that involve joins and aggregations.

---

## Key Concepts Practiced 👓

This task covers the definition and application of SQL Views.

* **What is a View?**
    A **View** is a stored `SELECT` query that is given a name and can be treated like a virtual table. It does not store data itself; instead, it dynamically generates its result set from the data in the underlying base tables whenever it is queried.

* **`CREATE VIEW` Syntax**
    The basic syntax for creating a view is straightforward:
    ```sql
    CREATE VIEW view_name AS
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition;
    ```

* **Primary Benefits of Using Views:**
    * **Simplicity & Data Abstraction**: Views hide the complexity of underlying database schema and long, complex queries. A user can interact with a simple view without needing to understand the complex joins or calculations involved.
    * **Security**: Views can be used to restrict data access. You can create a view that shows only specific rows or columns, and then grant users permission to the view instead of the base tables.
    * **Consistency**: By storing complex logic in a view, you ensure that anyone querying that view uses the exact same logic, leading to more consistent and reliable reporting.

---

## How to Use

1.  Open the task's SQL script in a compatible database tool (DB Browser for SQLite, MySQL Workbench).
2.  Execute the **SETUP** portion of the script to create the base tables and data.
3.  Run the `CREATE VIEW` statements. The views will be saved in the database schema.
4.  Execute the final `SELECT` queries that reference the views to see how a complex operation can be simplified to a one-line query.