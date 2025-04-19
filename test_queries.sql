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
-- 6. Frequent borrowers of a specific genre -----------------------------------------------------------------------
WITH total_fantasy_recent_checked_out AS (
    SELECT lm.member_id,
        lm.name,
        COUNT(c.copy_id) AS total_checked_out
    FROM Library_Member lm
        JOIN Make m ON lm.member_id = m.member_id
        JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id
        JOIN Loan l ON lt.transaction_id = l.transaction_id
        JOIN Copy c ON l.copy_id = c.copy_id
        JOIN Originate o ON c.copy_id = o.copy_id
        JOIN Book bk ON o.item_id = bk.item_id
    WHERE bk.genre = "Fantasy"
        AND (
            lt.checked_out_date BETWEEN DATE_FORMAT(
                DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR),
                '%Y-01-01'
            )
            AND DATE_FORMAT(
                DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR),
                '%Y-12-31'
            )
        )
    GROUP BY lm.member_id,
        lm.name
)
SELECT member_id,
    name,
    MAX(total_checked_out)
FROM total_fantasy_recent_checked_out tf;
-- 7. Books Due Soon ----------------------------------------------------------------------------------------------
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
-- 8. Members with overdue books (QUERY FINE, NEED TO FIX DATA) ----------------------------------------------------------------------------------
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
-- 9. Average borrowing time (BELIEVE IT WORKS) -----------------------------------------------------------------------------------
SELECT b.genre,
    -- Get genre of the book (ex. Fantasy)
    AVG(DATEDIFF(lt.return_date, lt.checked_out_date)) AS days_borrowed -- Average number of days books were borrowed for the genre
FROM Library_Transaction lt
    JOIN Loan l ON lt.transaction_id = l.transaction_id -- Connect transactions to loans
    JOIN Copy c ON l.copy_id = c.copy_id -- Get copy details of each item
    JOIN Originate o ON c.copy_id = o.copy_id -- Link copies to the original book/item
    JOIN Book b ON o.item_id = b.item_id -- Access the book to get genre info
WHERE lt.return_date IS NOT NULL -- Only consider books that have been returned
    -- Filter to "Fantasy" (can be replaced with any genre)
    AND b.genre = 'Fantasy';
-- 10. Most popular author in the last month (WORKS? NEED TO CHANGE THE CURDATE THING) -----------------------------------------------------------------------
SELECT b.author,
    COUNT(*) AS borrow_count
FROM Library_Transaction lt -- Represents the transaction activity (book borrowed or returned)
    JOIN Loan l ON lt.transaction_id = l.transaction_id -- Links the transaction to specific copy details
    JOIN Copy c ON l.copy_id = c.copy_id -- Access the specific copy details
    JOIN Originate o ON c.copy_id = o.copy_id -- Join to get the original book/item info
    JOIN Book b ON o.item_id = b.item_id -- Join to get the author of the book
WHERE lt.checked_out_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND CURDATE()
    AND lt.return_date IS NOT NULL -- Filter for transactions that occurred in the last month and only include transactions that have been returned (completed loans)
GROUP BY b.author -- Group by author to count the borrowings per author
ORDER BY borrow_count DESC -- Sort by most borrowed
    -- Return the most popular author (with the highest borrow count)
LIMIT 1;
-- 11. Monthly fees report (WORKS BUT NEED TO FIX EITHER DATA OR QUERY) -----------------------------------------------------------------------------------------
SELECT lm.type_id AS membership_type,
    SUM(p.amount_paid) AS total_fees_collected
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id
WHERE p.paid_date >= (CURDATE() - 30)
GROUP BY lm.type_id;
------------ different version of 11 ? idk 
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
-- 12. Exceeding borrowing limits (EMPTY SET - HOW TO CHECK IF EXCEEDED LIMIT??) ----------------------------------------------------------------------------------
-- on Nikka tab in junk 
SELECT lm.name,
    -- select clients name, book limit, and number of books they have checkout
    lm.book_limit,
    COUNT(*) AS current_loans
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id -- joins library member with make and library transaction to check the status of the return date
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
WHERE lt.return_date IS NULL -- only consider books that have not been returned
GROUP BY lm.name,
    lm.book_limit -- group by name and limit and only include members with checkout books greater than their book limit
HAVING COUNT(*) > lm.book_limit;
-- 13. Frequent borrowed items by client type (NOT EXACTLY OUTPUT WE WANT, PUT A QUERY THAT COULD FIX IT) ----------------------------------------------------------------------
SELECT lm.type_id AS client_type,
    -- The type of library member (e.g., Regular, Student, Senior)
    li.item_id,
    -- The unique ID for the borrowed library item
    COUNT(*) AS borrow_count -- Number of times the item was borrowed by members of this type
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id -- Connect members to their transactions
    JOIN Loan ln ON mk.transaction_id = ln.transaction_id -- Connect transactions to specific item copies
    JOIN Originate o ON ln.copy_id = o.copy_id -- Map copies back to their library items
    JOIN Library_Item li ON o.item_id = li.item_id -- Access general item data
GROUP BY lm.type_id,
    li.item_id -- Group by client type and item to count borrowings
ORDER BY lm.type_id,
    borrow_count DESC;
WITH Borrowings AS (
    SELECT lm.type_id AS client_type,
        li.item_id,
        COUNT(*) AS borrow_count
    FROM Library_Member lm
        JOIN Make mk ON lm.member_id = mk.member_id
        JOIN Loan ln ON mk.transaction_id = ln.transaction_id
        JOIN Originate o ON ln.copy_id = o.copy_id
        JOIN Library_Item li ON o.item_id = li.item_id
    GROUP BY lm.type_id,
        li.item_id
),
RankedBorrowings AS (
    SELECT client_type,
        item_id,
        borrow_count,
        ROW_NUMBER() OVER (
            PARTITION BY client_type
            ORDER BY borrow_count DESC
        ) AS rnk
    FROM Borrowings
)
SELECT client_type,
    item_id,
    borrow_count
FROM RankedBorrowings
WHERE rnk = 1
ORDER BY client_type;
-- Sort results by client type and highest borrow count
-- 14. Never late returns ------------------------------------------------------------------------------------------
-- 15. Average loan duration (SAME OUTPUT AS 9? Think it works though)---------------------------------------------------------------------------------------
SELECT -- Calculate the average number of days items stay on loan
    AVG(DATEDIFF(lt.return_date, lt.checked_out_date)) AS average_loan_duration
FROM Library_Transaction lt
WHERE -- Only include transactions where the item has been returned
    lt.return_date IS NOT NULL;
-- 16. Monthly summary report (PRODUCES ERROR)--------------------------------------------------------------------------------------
-- Note: might need to fix the monthly logic
SELECT -- Total Items Loaned
    (
        SELECT COUNT(*) -- total_items_loaned: number of items loaned in the last month
        FROM Loan l
            JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id
        WHERE lt.checked_out_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) -- Starting from 1 month ago
            AND CURDATE() -- Up to today
    ) AS total_items_loaned,
    -- Alias for the subquery result
    -- Total Fees Collected
    (
        SELECT SUM(p.amount_paid) -- total_fees_collected: total fee payments made in the last month
        FROM Pay p
        WHERE p.paid_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
            AND CURDATE()
    ) AS total_fees_collected,
    -- Alias for the subquery result
    -- Most Popular Items (Calculates top 5)
    (
        SELECT GROUP_CONCAT(b.title SEPARATOR ', ') -- most_popular_items: comma-separated list of top 5 book titles
        FROM (
                SELECT b.title -- Select book title
                FROM Loan l
                    JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id
                    JOIN Originate o ON l.copy_id = o.copy_id
                    JOIN Book b ON o.item_id = b.item_id
                WHERE lt.checked_out_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
                    AND CURDATE()
                GROUP BY b.title -- Group by book title to count borrowings
                ORDER BY COUNT(*) DESC -- Sort by most borrowed
                LIMIT 5 -- Top 5 items only
            ) AS TopBooks
    ) AS most_popular_items -- Alias for final popular item result
;
-- 17. Statistics breakdown --------------------------------------------------------------------------------------
-- 18. Client borrowing report -------------------------------------------------------------------------------------
-- 19. Item availability and history -------------------------------------------------------------------------------------
-- on Nikka tab in junk 
-- 20. Overdue items report (THINK IT WORKS) ----------------------------------------------------------------------------------------
-- Note: might need to adjust date logic for consistency
-- Show overdue items, the member responsible, and calculated late fees
SELECT lm.member_id,
    lm.name,
    b.title,
    lt.due_date,
    DATEDIFF(CURDATE(), lt.due_date) AS days_late,
    -- days_late = number of days past due
    lm.fee_type,
    DATEDIFF(CURDATE(), lt.due_date) * lm.fee_type AS late_fee -- late_fee = total fine (days_late x fee_type)
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id -- Connect member to their transaction
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Access transaction details
    JOIN Loan l ON lt.transaction_id = l.transaction_id -- Connect transaction to a loan
    JOIN Copy c ON l.copy_id = c.copy_id -- Get the physical copy of the item
    JOIN Originate o ON c.copy_id = o.copy_id -- Map the copy to its original item/book
    JOIN Book b ON o.item_id = b.item_id -- Join to get the book's title
WHERE lt.return_date IS NULL -- Only include books that have not been returned
    AND lt.due_date < CURDATE() -- Only include books where due date has already passed
ORDER BY lt.due_date ASC;
-- Sort results by due date (earliest overdue first)
-- 21. Revenue summary -------------------------------------------------------------------------------------