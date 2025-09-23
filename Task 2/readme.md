# SQL Data Manipulation Practice - Task 2

This project was completed as part of the Elevate Labs Internship program. The primary objective is to practice and demonstrate fundamental Data Manipulation Language (DML) commands in SQL.

## Objective

The goal of this task is to create a database table and perform the three core data manipulation operations:
1.  **INSERT**: Add new records to a table.
2.  **UPDATE**: Modify existing records.
3.  **DELETE**: Remove records from a table.

## Project Contents

This repository contains SQL scripts that build a simple `books` table and then manipulate its data.

* `DataInsertion.sql`: The primary SQL script written for MySQL. It includes statements to:
    * `CREATE` the table structure.
    * `INSERT` initial book data, handling `NULL` and `DEFAULT` values.
    * `UPDATE` a specific record to correct or add information.
    * `DELETE` a specific record from the table.
    * `SELECT` statements are included after each operation to show the state of the table.

## Tools and Technologies

* **Languages**: SQL (MySQL Dialect)
* **Database**: MySQL
* **Tools**: Git, DB Fiddle, MySQL Workbench
* **Version Control**: Git

## How to Use

1.  Clone the repository to your local machine.
2.  Open the `DataInsertion.sql` file in a MySQL management tool (like MySQL Workbench, DBeaver, or VS Code with a database extension).
3.  Connect to a local or remote MySQL database.
4.  Execute the entire script.
5.  Observe the output from the different `SELECT` statements to see how the data is created, updated, and deleted in sequence.

## Key Learnings

* Proper syntax for `INSERT`, `UPDATE`, and `DELETE` statements.
* The critical importance of using a `WHERE` clause with `UPDATE` and `DELETE` to avoid accidentally changing or deleting the entire table's data.
* Handling missing data by inserting `NULL` values or relying on `DEFAULT` column properties.
* Minor syntactical differences between SQL dialects (e.g., `AUTOINCREMENT` in SQLite vs. `AUTO_INCREMENT` in MySQL).
