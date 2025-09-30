# SQL Practice: Subqueries and Nested Queries - Task 6

This project was completed as part of the Elevate Labs Internship program. This task explores advanced query logic by using subqueries (queries nested inside other queries).

## Objective

The objective is to learn how to construct complex queries by embedding `SELECT` statements within the `WHERE`, `FROM`, and `SELECT` clauses of a main query. This allows for more sophisticated data filtering and analysis.

---

## Database Schema

This task utilizes the three-table schema from previous exercises, consisting of `authors`, `books`, and `sales` tables. This structure is well-suited for writing meaningful nested queries, such as finding authors based on book sales or genres.

---

## Key Concepts Practiced 📄🔍

This task focuses on the use and understanding of different types of subqueries.

* **What is a Subquery?**
    A subquery is a `SELECT` statement nested inside another statement. The result of the inner query is used by the outer query to help determine the final result.

* **Types of Subqueries Demonstrated:**
    * **Subquery in `WHERE` Clause**: The most common use case. Used to filter the results of the main query.
        * With `IN`: The subquery returns a list of values.
        * With `=`: The subquery returns a single (scalar) value.
        * With `EXISTS`: Used to check for the existence of rows in the subquery's result.

    * **Subquery in `FROM` Clause**: The subquery's result set is treated as a temporary table, known as a **Derived Table**. This is useful for performing further operations on an already aggregated result.

    * **Subquery in `SELECT` Clause**: The subquery must return a single value (a scalar subquery). This is often a *correlated subquery* used to compute a value for each row of the outer query's result set.

* **Correlated vs. Non-Correlated Subqueries:**
    * A **non-correlated** subquery can be run independently of the outer query.
    * A **correlated** subquery depends on the outer query for its values and is executed once for each row processed by the outer query.

---

## How to Use

1.  Open the task's SQL script in a compatible database tool (DB Browser for SQLite, MySQL Workbench).
2.  Execute the "SETUP" portion of the script to create the necessary tables and data.
3.  Run each of the practice queries one at a time to understand how nested logic works in different clauses of a `SELECT` statement.
