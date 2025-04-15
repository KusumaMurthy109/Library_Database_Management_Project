-- List all books by a specific author --------------------------------------------------------------------------
SELECT *
FROM Book
WHERE author = 'J.K. Rowling';
-- Find books by publication year -------------------------------------------------------------------------------
SELECT *
FROM Book
WHERE publication_year = 2003;
-- Check membership status --------------------------------------------------------------------------------------
SELECT name,
    account_status,
    contact_information,
    book_limit,
    fee_type
FROM Library_Member
WHERE member_id = 31;
-- Fine Calculation ---------------------------------------------------------------------------------------------
SELECT m.member_id,
    m.name,
    SUM(
        CASE
            WHEN lt.return_date IS NULL -- Check if the book has not been returned yet.
            AND lt.due_date < CURDATE() THEN DATEDIFF(CURDATE(), lt.due_date) * m.fee_type -- And, compare if the due date is passed. Then, calculate the amount owed based on their fee type and how many days have passed.
            ELSE 0 -- Otherwise, no fee is incurred.
        END
    ) AS total_fines_owed -- New table made and new name is total_fines_owed
FROM Library_Member m -- Join this table with the tables mentioned below
    JOIN Make mk ON m.member_id = mk.member_id -- Join the tables on the member id
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Join on the transactions made.
    -- Group by the member to get their total sum of incurred fees.
GROUP BY m.member_id,
    m.name;
-- Book Availability --------------------------------------------------------------------------------------------
SELECT c.copy_id,
    bk.title,
    bk.genre
FROM Book bk
    JOIN Library_Item li ON bk.item_id = li.item_id
    JOIN Originate o ON li.item_id = o.item_id
    JOIN Copy c ON o.copy_id = c.copy_id
WHERE c.status = 'in_stock'
    and bk.genre = 'Fantasy';
-- Frequent borrowers of a specific genre
-- Books due soon --------------------------------------------------------------------------
-- Members with overdue books --------------------------------------------------------------------------
-- Average borrowing time --------------------------------------------------------------------------
-- Most popular author in the last month --------------------------------------------------------------------------
-- Monthly fees report --------------------------------------------------------------------------
-- Exceeding borrowing limits --------------------------------------------------------------------------
-- Frequent borrowed items by client type --------------------------------------------------------------------------
-- Never late returns --------------------------------------------------------------------------
-- Average loan duration --------------------------------------------------------------------------
-- Monthly Summary Report --------------------------------------------------------------------------
-- Statistics Breakdown --------------------------------------------------------------------------
-- Client Borrowing Report --------------------------------------------------------------------------
-- Item availability and history --------------------------------------------------------------------------
-- Overdue items report --------------------------------------------------------------------------
-- Revenue summary --------------------------------------------------------------------------
SELECT lm.type_id AS membership_type,
    g.genre_name,
    SUM(p.amount_paid) AS total_paid
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id
    JOIN Incur i ON p.fine_id = i.fine_id
    JOIN Loan l ON i.transaction_id = l.transaction_id
    JOIN Library_Item li ON l.copy_id = li.item_id
    JOIN Categorize c ON li.item_id = c.item_id
    JOIN Genre g ON c.genre_id = g.genre_id
GROUP BY lm.type_id,
    g.genre_name;