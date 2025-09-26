# SQL Practice: Basic SELECT Queries - Task 3

This project was completed as part of the Elevate Labs Internship program. This task focuses on the fundamental SQL command for data retrieval: `SELECT`.

## Objective

The objective is to practice extracting data from one or more tables using filtering, projection, and sorting techniques. This demonstrates a clear understanding of how to retrieve specific and meaningful data from a relational database.

---

## Database Schema

For this task, a simple two-table schema was created to model a library's collection:

* **`authors`**: Stores information about authors.
    * `author_id` (Primary Key)
    * `author_name`
    * `country`

* **`books`**: Stores information about books.
    * `book_id` (Primary Key)
    * `title`, `publication_year`, `genre`
    * `author_id` (Foreign Key referencing `authors.author_id`)

This schema establishes a **one-to-many relationship**, where one author can have many books.



---

## Key Concepts Practiced 📖

The SQL script demonstrates the following key concepts:

* **Projection**: Selecting all columns (`SELECT *`) versus selecting specific columns (`SELECT title, genre`) to control the output.

* **Filtering**: Using the `WHERE` clause with various operators to narrow down the results:
    * `AND` & `OR`: Combining multiple conditions.
    * `LIKE`: Performing pattern matching on text.
    * `BETWEEN`: Selecting records within a specific range.

* **Sorting**: Using the `ORDER BY` clause to sort the result set in ascending (`ASC`) or descending (`DESC`) order.

* **Limiting**: Using the `LIMIT` clause to restrict the number of rows returned, which is useful for finding top-N results.

* **Joining**: Using `INNER JOIN` to combine rows from the `books` and `authors` tables based on their relationship, allowing for queries that pull data from both tables simultaneously.

---

## How to Use

1.  Clone the repository to your local machine.
2.  Open the `select_queries.sql` script in a compatible database tool (e.g., DB Browser for SQLite, MySQL Workbench).
3.  First, execute the "SETUP" portion of the script to create the tables and insert the sample data.
4.  Execute each practice query individually to analyze its specific function and see the resulting data.
