-- TASK 2 ----------------------------------------------------------------

-- =================================================================
-- 1. CREATE TABLE
--    Define the structure for a 'books' table using MySQL syntax.
-- =================================================================

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INT,
    genre VARCHAR(100) DEFAULT 'Unknown'
);

-- Show that the table is empty initially
SELECT * FROM books;


-- =================================================================
-- 2. INSERT Statements
--    Populate the 'books' table with some initial data.
-- =================================================================

-- Insert a complete record
INSERT INTO books (title, author, publication_year, genre)
VALUES ('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy');

-- Insert another complete record
INSERT INTO books (title, author, publication_year, genre)
VALUES ('1984', 'George Orwell', 1949, 'Dystopian');

-- Insert a record with a missing publication year (handled as NULL)
INSERT INTO books (title, author, publication_year, genre)
VALUES ('Brave New World', 'Aldous Huxley', NULL, 'Dystopian');

-- Insert a record without specifying the genre to use the DEFAULT value
INSERT INTO books (title, author, publication_year)
VALUES ('The Catcher in the Rye', 'J.D. Salinger', 1951);

-- Show the table after inserting data
SELECT * FROM books;


-- =================================================================
-- 3. UPDATE Statement
--    Modify an existing record in the table.
-- =================================================================

-- Let's correct the genre of 'The Hobbit' and add the missing publication year for 'Brave New World'.
-- IMPORTANT: Always use a WHERE clause with UPDATE to avoid changing all rows!

UPDATE books
SET genre = 'High Fantasy'
WHERE title = 'The Hobbit';

UPDATE books
SET publication_year = 1932
WHERE book_id = 3; -- Using the primary key is the safest way to update.

-- Show the table after the update
SELECT * FROM books;


-- =================================================================
-- 4. DELETE Statement
--    Remove a record from the table.
-- =================================================================

-- Let's remove 'The Catcher in the Rye' from our library.
-- CRITICAL: Always use a WHERE clause with DELETE to avoid deleting all data!

DELETE FROM books
WHERE title = 'The Catcher in the Rye';

-- Show the final state of the table
SELECT * FROM books;