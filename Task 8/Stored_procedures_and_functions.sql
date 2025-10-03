-- =================================================================
-- 1. SETUP: CREATE AND POPULATE TABLES
--    This section recreates the database structure.
-- =================================================================

-- Drop existing objects to make the script re-runnable
DROP PROCEDURE IF EXISTS GetBooksByAuthor;
DROP FUNCTION IF EXISTS GetBookSalesCategory;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- Create tables
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    country VARCHAR(255)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(255),
    author_id INT
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    book_id INT,
    copies_sold INT
);

-- Insert data
INSERT INTO authors (author_id, author_name, country) VALUES
(1, 'J.R.R. Tolkien', 'United Kingdom'),
(2, 'George Orwell', 'United Kingdom'),
(3, 'Frank Herbert', 'United States');

INSERT INTO books (book_id, title, genre, author_id) VALUES
(1, 'The Lord of the Rings', 'Fantasy', 1),
(2, 'The Hobbit', 'Fantasy', 1),
(3, '1984', 'Dystopian', 2);

INSERT INTO sales (sale_id, book_id, copies_sold) VALUES
(1, 1, 150000), (2, 1, 50000), (3, 2, 120000),
(4, 3, 250000);


-- =================================================================
-- 2. CREATE AND USE A STORED PROCEDURE
-- =================================================================

-- Change the delimiter so MySQL treats the entire block as one statement
DELIMITER $$

CREATE PROCEDURE GetBooksByAuthor(IN author_name_param VARCHAR(255))
BEGIN
    -- This procedure takes an author's name and returns their books.
    SELECT
        b.title,
        b.genre
    FROM books AS b
    JOIN authors AS a ON b.author_id = a.author_id
    WHERE a.author_name = author_name_param;
END$$

-- Change the delimiter back to the default
DELIMITER ;

-- How to use the stored procedure:
CALL GetBooksByAuthor('J.R.R. Tolkien');


-- =================================================================
-- 3. CREATE AND USE A FUNCTION
-- =================================================================

DELIMITER $$

CREATE FUNCTION GetBookSalesCategory(book_title_param VARCHAR(255))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    -- This function returns a sales category based on total copies sold.
    DECLARE total_copies INT;
    DECLARE sales_category VARCHAR(20);

    -- Calculate total sales for the given book
    SELECT SUM(s.copies_sold) INTO total_copies
    FROM sales s
    JOIN books b ON s.book_id = b.book_id
    WHERE b.title = book_title_param;

    -- Apply conditional logic
    IF total_copies >= 200000 THEN
        SET sales_category = 'Bestseller';
    ELSEIF total_copies >= 100000 AND total_copies < 200000 THEN
        SET sales_category = 'Good Seller';
    ELSE
        SET sales_category = 'Standard Seller';
    END IF;

    -- Return the single value
    RETURN sales_category;
END$$

DELIMITER ;

-- How to use the function in a SELECT statement:
SELECT
    title,
    GetBookSalesCategory(title) AS Sales_Status
FROM books;