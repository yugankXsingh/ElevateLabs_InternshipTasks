-- =================================================================
-- 1. SETUP: CREATE AND POPULATE TABLES
--    This section recreates the database structure.
-- =================================================================

-- Drop existing views and tables to make the script re-runnable
DROP VIEW IF EXISTS BookSalesSummary;
DROP VIEW IF EXISTS UK_Authors;
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
(4, 'Dune', 'Science Fiction', 3);

INSERT INTO sales (sale_id, book_id, copies_sold) VALUES
(1, 1, 150000), (2, 1, 50000), (3, 2, 120000),
(4, 3, 250000), (5, 4, 95000);


-- =================================================================
-- 2. CREATE AND USE VIEWS
--    Examples demonstrating view creation and usage.
-- =================================================================

-- Example 1: Creating a View for Complex Logic (Abstraction)
-- This view hides the complexity of joining three tables and calculating total sales.
-- It provides a simple, summarized "table" of book sales information.
CREATE VIEW BookSalesSummary AS
SELECT
    b.title,
    a.author_name,
    b.genre,
    SUM(s.copies_sold) AS total_copies_sold
FROM books AS b
JOIN authors AS a ON b.author_id = a.author_id
LEFT JOIN sales AS s ON b.book_id = s.book_id
GROUP BY b.book_id;

-- Now, using the view is simple. We can query it like a regular table.
-- Get all the summarized sales data:
SELECT * FROM BookSalesSummary;

-- We can even add WHERE and ORDER BY clauses to the view.
-- Get the summary for 'Fantasy' books, ordered by sales.
SELECT * FROM BookSalesSummary
WHERE genre = 'Fantasy'
ORDER BY total_copies_sold DESC;

---

-- Example 2: Creating a View for Security and Simplicity
-- This view restricts access to only the names of authors from the UK.
-- This could be given to a user who only needs this specific subset of data,
-- without giving them access to the entire 'authors' table.
CREATE VIEW UK_Authors AS
SELECT author_name
FROM authors
WHERE country = 'United Kingdom';

-- Using the view is straightforward.
SELECT * FROM UK_Authors;