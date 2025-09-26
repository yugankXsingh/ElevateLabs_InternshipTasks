-- =================================================================
-- 1. SETUP: CREATE AND POPULATE TABLES
--    We are adding a 'sales' table to make aggregation more interesting.
-- =================================================================

-- Drop tables in reverse order of creation to avoid foreign key errors
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- Create the 'authors' table
CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_name TEXT NOT NULL,
    country TEXT
);

-- Create the 'books' table
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    publication_year INTEGER,
    genre TEXT,
    author_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create the 'sales' table
CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    copies_sold INTEGER,
    sale_date TEXT,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert data into 'authors'
INSERT INTO authors (author_name, country) VALUES
('J.R.R. Tolkien', 'United Kingdom'),
('George Orwell', 'United Kingdom'),
('Frank Herbert', 'United States'),
('Isaac Asimov', 'United States');

-- Insert data into 'books'
INSERT INTO books (title, publication_year, genre, author_id) VALUES
('The Lord of the Rings', 1954, 'Fantasy', 1),
('The Hobbit', 1937, 'Fantasy', 1),
('1984', 1949, 'Dystopian', 2),
('Dune', 1965, 'Science Fiction', 3),
('Foundation', 1951, 'Science Fiction', 4),
('I, Robot', 1950, 'Science Fiction', 4);

-- Insert data into 'sales'
INSERT INTO sales (book_id, copies_sold, sale_date) VALUES
(1, 150000, '2023-01-15'), -- The Lord of the Rings
(1, 50000, '2023-02-20'),  -- The Lord of the Rings
(2, 120000, '2023-01-20'), -- The Hobbit
(3, 250000, '2023-03-05'), -- 1984
(4, 95000, '2023-02-10'),  -- Dune
(5, 75000, '2023-01-30'),  -- Foundation
(6, 60000, '2023-03-12'),  -- I, Robot
(6, 40000, '2023-04-01');  -- I, Robot


-- =================================================================
-- 2. PRACTICE QUERIES
--    Queries demonstrating aggregation, grouping, and filtering groups.
-- =================================================================

-- Query 1: Basic Aggregate Functions (COUNT, SUM, AVG)
-- Get a summary of the entire sales table.
SELECT
    COUNT(*) AS total_sales_transactions,
    SUM(copies_sold) AS total_copies_sold,
    AVG(copies_sold) AS average_copies_per_transaction
FROM sales;

-- Query 2: MIN and MAX
-- Find the earliest and latest book publication years.
SELECT
    MIN(publication_year) AS earliest_year,
    MAX(publication_year) AS latest_year
FROM books;

-- Query 3: Using GROUP BY
-- How many books has each author written?
-- We group the books by author and then count the books in each group.
SELECT
    authors.author_name,
    COUNT(books.book_id) AS number_of_books
FROM authors
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name;


-- Query 4: GROUP BY with SUM
-- What is the total number of copies sold for each book?
SELECT
    books.title,
    SUM(sales.copies_sold) AS total_sold
FROM sales
JOIN books ON sales.book_id = books.book_id
GROUP BY books.title
ORDER BY total_sold DESC;

-- Query 5: GROUP BY on Multiple Columns
-- How many books were published per genre, per country?
SELECT
    authors.country,
    books.genre,
    COUNT(books.book_id) AS book_count
FROM books
JOIN authors ON books.author_id = authors.author_id
GROUP BY authors.country, books.genre;

-- Query 6: Filtering Groups with HAVING
-- Which authors have written more than one book?
-- The HAVING clause filters the results AFTER the GROUP BY has been applied.
SELECT
    authors.author_name,
    COUNT(books.book_id) AS number_of_books
FROM authors
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name
HAVING COUNT(books.book_id) > 1;

-- Query 7: Combining WHERE and HAVING
-- Find the total sales for each 'Science Fiction' book,
-- but only show books that have sold more than 100,000 copies in total.
SELECT
    books.title,
    SUM(sales.copies_sold) AS total_sold
FROM sales
JOIN books ON sales.book_id = books.book_id
WHERE books.genre = 'Science Fiction' -- WHERE filters rows BEFORE grouping
GROUP BY books.title
HAVING SUM(sales.copies_sold) > 100000; -- HAVING filters groups AFTER aggregating