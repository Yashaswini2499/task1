

-- Insert Members
INSERT INTO Members (name, email, phone) 
VALUES 
('Alice Johnson', 'alice@example.com', '9876543210'),
('Bob Smith', 'bob@example.com', NULL),         -- phone missing → NULL
('Charlie Brown', NULL, '9123456789');          -- email missing → NULL

-- Insert Authors
INSERT INTO Authors (name, country) 
VALUES 
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('Haruki Murakami', NULL);   -- country unknown → NULL

-- Insert Books
INSERT INTO Books (title, isbn, published_year, available_copies)
VALUES
('Harry Potter and the Philosopher\'s Stone', '9780747532699', 1997, 5),
('A Game of Thrones', '9780553103540', 1996, 3),
('Kafka on the Shore', '9781400079278', 2002, DEFAULT);   -- default available_copies = 1

-- Link Books and Authors
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),  -- Harry Potter by J.K. Rowling
(2, 2),  -- Game of Thrones by George R.R. Martin
(3, 3);  -- Kafka on the Shore by Haruki Murakami

-- Insert Borrowings
INSERT INTO Borrowings (member_id, book_id, return_date)
VALUES
(1, 1, NULL),   -- Alice borrowed Harry Potter, not returned yet
(2, 2, '2025-09-30'), -- Bob borrowed Game of Thrones and returned it
(3, 3, NULL);   -- Charlie borrowed Kafka, still ongoing

-- Update member phone number
UPDATE Members
SET phone = '9988776655'
WHERE member_id = 2;

-- Increase available copies of a book
UPDATE Books
SET available_copies = available_copies + 2
WHERE book_id = 1;


-- Delete a borrowing record (Charlie returned the book, record removed)
DELETE FROM Borrowings
WHERE borrow_id = 3;

-- Delete a member who left the library
DELETE FROM Members
WHERE member_id = 2;
