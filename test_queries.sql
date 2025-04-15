-- 1. List all books by a specific author --------------------------------------------------------------------------
SELECT *
FROM Book
WHERE author = 'J.K. Rowling';
-- 2. Find books by publication year -------------------------------------------------------------------------------
SELECT *
FROM Book
WHERE publication_year = 2003;
-- 3. Check membership status --------------------------------------------------------------------------------------
SELECT name,
    account_status,
    contact_information,
    book_limit,
    fee_type
FROM Library_Member
WHERE member_id = 31;
-- 4. Fine Calculation ---------------------------------------------------------------------------------------------
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
-- 5. Book Availability --------------------------------------------------------------------------------------------
SELECT c.copy_id,
    bk.title,
    bk.genre
FROM Book bk
    JOIN Originate o ON bk.item_id = o.item_id
    JOIN Copy c ON o.copy_id = c.copy_id
WHERE c.status = 'in_stock'
    AND bk.genre = 'Fantasy';
-- 6. Frequent borrowers of a specific genre (CHECK) -----------------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    MAX(c.copy_id)
FROM Library_Member lm
    JOIN Make m ON lm.member_id = m.member_id
    JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id
    JOIN Loan l ON lt.transaction_id = l.transaction_id
    JOIN Copy c ON l.copy_id = c.copy_id
    JOIN Originate o ON c.copy_id = o.copy_id
    JOIN Book bk ON o.item_id = bk.item_id
WHERE bk.genre = "Fantasy"
GROUP BY lm.member_id,
    lm.name;
-- 7. Books Due Soon (CHECK) ----------------------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name AS member_name,
    b.title AS book_title,
    lt.due_date
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
    JOIN Loan l ON lt.transaction_id = l.transaction_id
    JOIN Copy c ON l.copy_id = c.copy_id
    JOIN Originate o ON c.copy_id = o.copy_id
    JOIN Book b ON o.item_id = b.item_id
WHERE lt.return_date IS NULL
    AND lt.due_date >= CURDATE()
    AND lt.due_date <= CURDATE() + 7
ORDER BY lt.due_date ASC;
-- 8. Members with overdue books (CHECK) ----------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name AS member_name,
    b.title AS overdue_book_title,
    lt.due_date
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
    JOIN Loan lo ON lt.transaction_id = lo.transaction_id
    JOIN Copy c ON lo.copy_id = c.copy_id
    JOIN Originate o ON c.copy_id = o.copy_id
    JOIN Book b ON o.item_id = b.item_id
WHERE lt.return_date IS NULL
    AND lt.due_date < CURDATE();
-- 9. Average borrowing time -----------------------------------------------------------------------------------
-- 10. Most popular author in the last month -----------------------------------------------------------------------
-- 11. Monthly fees report (CHECK) -----------------------------------------------------------------------------------------
SELECT lm.type_id AS membership_type,
    SUM(p.amount_paid) AS total_fees_collected
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id
WHERE p.paid_date >= (CURDATE() - 30)
GROUP BY lm.type_id;
-- Exceeding borrowing limits ----------------------------------------------------------------------------------
-- Frequent borrowed items by client type ----------------------------------------------------------------------
-- Never late returns ------------------------------------------------------------------------------------------
-- Average loan duration ---------------------------------------------------------------------------------------
-- Monthly Summary Report --------------------------------------------------------------------------------------
-- Client Borrowing Report -------------------------------------------------------------------------------------
-- Overdue items report ----------------------------------------------------------------------------------------
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