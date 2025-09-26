-- =================================================================
-- 1. SETUP: CREATE AND POPULATE TABLES
--    This section creates the database structure and adds sample data.
-- =================================================================

-- Drop tables if they already exist to make the script re-runnable
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- Create the 'authors' table
CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_name TEXT NOT NULL,
    country TEXT
);

-- Create the 'books' table with a foreign key relationship to 'authors'
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    publication_year INTEGER,
    genre TEXT,
    author_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Insert data into the 'authors' table
INSERT INTO authors (author_name, country) VALUES
('J.R.R. Tolkien', 'United Kingdom'),
('George Orwell', 'United Kingdom'),
('Frank Herbert', 'United States'),
('Isaac Asimov', 'United States'),
('Jane Austen', 'United Kingdom');

-- Insert data into the 'books' table
INSERT INTO books (title, publication_year, genre, author_id) VALUES
('The Hobbit', 1937, 'Fantasy', 1),
('The Lord of the Rings', 1954, 'Fantasy', 1),
('1984', 1949, 'Dystopian', 2),
('Animal Farm', 1945, 'Political Satire', 2),
('Dune', 1965, 'Science Fiction', 3),
('Foundation', 1951, 'Science Fiction', 4),
('Pride and Prejudice', 1813, 'Romance', 5);


-- =================================================================
-- 2. PRACTICE QUERIES
--    These queries demonstrate the key concepts for this task.
-- =================================================================

-- Query 1: Select ALL columns from a single table
-- This is useful for a quick overview of a table's data.
SELECT * FROM books;

-- Query 2: Select SPECIFIC columns from a table (Projection)
-- This is more efficient as it only retrieves the data you need.
SELECT title, genre, publication_year FROM books;

-- Query 3: Filter data with a simple WHERE clause
-- Get all books in the 'Fantasy' genre.
SELECT * FROM books WHERE genre = 'Fantasy';

-- Query 4: Filter with AND to combine conditions
-- Get all 'Fantasy' books published before 1955.
SELECT * FROM books WHERE genre = 'Fantasy' AND publication_year < 1955;

-- Query 5: Filter with OR
-- Get all books that are either 'Dystopian' or 'Romance'.
SELECT * FROM books WHERE genre = 'Dystopian' OR genre = 'Romance';

-- Query 6: Filter with LIKE for pattern matching
-- Get books with 'The' anywhere in the title. The '%' is a wildcard character.
SELECT * FROM books WHERE title LIKE '%The%';

-- Query 7: Filter with BETWEEN for a range
-- Get all books published in the 1940s.
SELECT * FROM books WHERE publication_year BETWEEN 1940 AND 1949;

-- Query 8: Sort results with ORDER BY
-- List all books, sorted by their publication year (oldest to newest).
SELECT title, publication_year FROM books ORDER BY publication_year ASC; -- ASC is default

-- Query 9: Sort in descending order
-- List all books, sorted by their publication year (newest to oldest).
SELECT title, publication_year FROM books ORDER BY publication_year DESC;

-- Query 10: Limit the number of results with LIMIT
-- Get the 3 oldest books.
SELECT * FROM books ORDER BY publication_year ASC LIMIT 3;

-- Query 11: Querying from MULTIPLE tables with JOIN
-- This combines rows from 'books' and 'authors' based on the author_id.
SELECT
    books.title,
    authors.author_name,
    authors.country
FROM
    books
JOIN
    authors ON books.author_id = authors.author_id;

-- Query 12: Putting it all together
-- Get the title and author name for all Science Fiction books,
-- sorted alphabetically by title.
SELECT
    books.title,
    authors.author_name
FROM
    books
JOIN
    authors ON books.author_id = authors.author_id
WHERE
    books.genre = 'Science Fiction'
ORDER BY
    books.title;