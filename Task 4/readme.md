# SQL Practice: Aggregate Functions & Grouping - Task 4

This project was completed as part of the Elevate Labs Internship program. This task focuses on summarizing and analyzing data using SQL's aggregate functions and grouping capabilities.

## Objective

The objective is to move beyond simple data retrieval and learn how to perform calculations on sets of rows. This involves using aggregate functions to produce summary statistics and the `GROUP BY` clause to categorize data before aggregation.

---

## Database Schema

To facilitate meaningful data aggregation, the database schema was expanded to include sales data.

* **`authors`**: Stores author information (`author_id`, `author_name`, `country`).
* **`books`**: Stores book information and links to an author (`book_id`, `title`, `author_id`).
* **`sales`**: Stores transaction data for each book (`sale_id`, `book_id`, `copies_sold`).

This schema allows us to perform analyses like calculating total sales per book or finding the number of books per author.



---

## Key Concepts Practiced 📈

The SQL script demonstrates how to summarize and analyze data through the following key concepts:

* ### Aggregate Functions
    These functions perform a calculation on a set of values and return a single summary value.
    * **`COUNT()`**: Counts the number of rows or non-null values.
    * **`SUM()`**: Calculates the sum of a numeric column.
    * **`AVG()`**: Calculates the average of a numeric column.
    * **`MIN()` / `MAX()`**: Find the minimum and maximum values in a set.

* ### Grouping Data
    * **`GROUP BY`**: This clause groups rows that have the same values in specified columns into summary rows. It's used to apply aggregate functions to distinct categories of data (e.g., calculating total sales `per book`).

* ### Filtering Groups
    * **`HAVING`**: This clause is used to filter the results of a `GROUP BY` query. While **`WHERE`** filters individual rows *before* aggregation, **`HAVING`** filters entire groups *after* aggregation.

---

## How to Use

1.  Clone the repository to your local machine.
2.  Open the task's SQL script in a compatible database tool (e.g., DB Browser for SQLite, MySQL Workbench).
3.  First, execute the "SETUP" portion of the script to create the three tables and insert the sample data.
4.  Execute each practice query individually to see how different aggregate functions and grouping strategies work to summarize the data.
