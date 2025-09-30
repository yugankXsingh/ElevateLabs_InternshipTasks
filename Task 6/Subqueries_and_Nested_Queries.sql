-- =================================================================
-- 1. SETUP: CREATE AND POPULATE TABLES
--    This section recreates the database structure from the previous task.
-- =================================================================

-- Drop tables in reverse order of creation to avoid foreign key errors
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- Create tables
CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY,
    author_name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT,
    author_id INTEGER
);

CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    copies_sold INTEGER
);

-- Insert data
INSERT INTO authors (author_id, author_name, country) VALUES
(1, 'J.R.R. Tolkien', 'United Kingdom'),
(2, 'George Orwell', 'United Kingdom'),
(3, 'Frank Herbert', 'United States'),
(4, 'Isaac Asimov', 'United States');

INSERT INTO books (book_id, title, genre, author_id) VALUES
(1, 'The Lord of the Rings', 'Fantasy', 1),
(2, 'The Hobbit', 'Fantasy', 1),
(3, '1984', 'Dystopian', 2),
(4, 'Dune', 'Science Fiction', 3),
(5, 'Foundation', 'Science Fiction', 4),
(6, 'I, Robot', 'Science Fiction', 4);

INSERT INTO sales (sale_id, book_id, copies_sold) VALUES
(1, 1, 150000), (2, 1, 50000), (3, 2, 120000),
(4, 3, 250000), (5, 4, 95000), (6, 5, 75000),
(7, 6, 60000), (8, 6, 40000);


-- =================================================================
-- 2. PRACTICE QUERIES
--    Queries demonstrating subqueries in WHERE, SELECT, and FROM clauses.
-- =================================================================

-- Query 1: Subquery in a WHERE Clause (using IN)
-- Find the titles of all books written by authors from the 'United Kingdom'.
-- The inner query runs first, creating a list of author IDs (1, 2).
-- The outer query then finds all books whose author_id is IN that list.
SELECT title
FROM books
WHERE author_id IN (SELECT author_id FROM authors WHERE country = 'United Kingdom');

---

-- Query 2: Subquery in a WHERE Clause (Scalar Subquery using =)
-- Find the book(s) that had the highest number of copies sold in a single transaction.
-- The inner query finds the maximum value (250000).
-- The outer query finds the sale record(s) matching that value.
SELECT book_id, copies_sold
FROM sales
WHERE copies_sold = (SELECT MAX(copies_sold) FROM sales);

---

-- Query 3: Subquery in a FROM Clause (Derived Table)
-- Find the total sales for each author.
-- The inner query first creates a temporary table (aliased as 'author_sales')
-- that lists the total copies sold per author.
-- The outer query then joins this derived table back to the authors table to get their names.
SELECT
    a.author_name,
    author_sales.total_copies
FROM authors AS a
JOIN (
    SELECT b.author_id, SUM(s.copies_sold) AS total_copies
    FROM sales AS s
    JOIN books AS b ON s.book_id = b.book_id
    GROUP BY b.author_id
) AS author_sales ON a.author_id = author_sales.author_id;

---

-- Query 4: Correlated Subquery in a WHERE Clause (using EXISTS)
-- Find all authors who have written a 'Fantasy' book.
-- The EXISTS operator is efficient because it stops as soon as it finds a match.
-- For each author in the outer query, the inner query runs to see if a matching book exists.
SELECT author_name
FROM authors AS a
WHERE EXISTS (
    SELECT 1
    FROM books AS b
    WHERE b.author_id = a.author_id AND b.genre = 'Fantasy'
);

---

-- Query 5: Correlated Subquery in a SELECT Clause (Scalar Subquery)
-- Display each book's title and the total number of copies it has sold.
-- For each book in the outer query, the inner query runs to calculate the
-- sum of copies_sold specifically for that book's book_id.
SELECT
    title,
    (SELECT SUM(copies_sold)
     FROM sales AS s
     WHERE s.book_id = b.book_id) AS total_sales_for_book
FROM books AS b;