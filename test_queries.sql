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
),
max_checked_out AS (
    SELECT MAX(total_checked_out) AS max_value
    FROM total_fantasy_recent_checked_out
)
SELECT member_id,
    name,
    total_checked_out
FROM total_fantasy_recent_checked_out
WHERE total_checked_out = (
        SELECT max_value
        FROM max_checked_out
    );
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
-- 8. Members with overdue books ----------------------------------------------------------------------------------
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
SELECT b.genre,
    -- Get genre of the book (ex. Fantasy)
    AVG(DATEDIFF(lt.return_date, lt.checked_out_date)) AS days_borrowed -- Average number of days books were borrowed for the genre
FROM Library_Transaction lt
    JOIN Loan l ON lt.transaction_id = l.transaction_id -- Connect transactions to loans
    JOIN Originate o ON l.copy_id = o.copy_id -- Link copies to the original book/item
    JOIN Book b ON o.item_id = b.item_id -- Access the book to get genre info
WHERE lt.return_date IS NOT NULL -- Only consider books that have been returned
    -- Filter to "Fantasy" (can be replaced with any genre)
    AND b.genre = 'Fantasy';
-- 10. Most popular author in the last month -----------------------------------------------------------------------
WITH recent_borrowed_books_by_author AS (
    SELECT b.author,
        COUNT(*) AS borrow_count
    FROM Library_Transaction lt -- Represents the transaction activity (book borrowed or returned)
        JOIN Loan l ON lt.transaction_id = l.transaction_id -- Links the transaction to specific copy details
        JOIN Originate o ON l.copy_id = o.copy_id -- Join to get the original book/item info
        JOIN Book b ON o.item_id = b.item_id -- Join to get the author of the book
    WHERE lt.checked_out_date BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
        AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
        AND lt.return_date IS NOT NULL -- Filter for transactions that occurred in the last month and only include transactions that have been returned (completed loans)
    GROUP BY b.author -- Group by author to count the borrowings per author
),
max_borrowed_books AS (
    SELECT MAX(borrow_count) AS max_borrowed
    FROM recent_borrowed_books_by_author
)
SELECT *
FROM recent_borrowed_books_by_author
WHERE borrow_count = (
        SELECT max_borrowed
        FROm max_borrowed_books
    );
-- 11. Monthly fees report (FIXED?) -----------------------------------------------------------------------------------------
SELECT lm.type_id AS membership_type,
    p.paid_date,
    SUM(p.amount_paid) AS total_fees_collected
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id
WHERE p.paid_date BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
    AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
GROUP BY lm.type_id;
/*
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
 */
-- 12. Exceeding borrowing limits (EMPTY SET - HOW TO CHECK IF EXCEEDED LIMIT??) ----------------------------------------------------------------------------------
SELECT lm.name,
    -- Select clients name, book limit, and number of books they have checkout
    lm.book_limit,
    COUNT(*) AS current_loans
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id -- Joins library member with make and library transaction to check the status of the return date
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
WHERE lt.return_date IS NULL -- Only consider books that have not been returned
GROUP BY lm.name,
    lm.book_limit -- Group by name and limit and only include members with checkout books greater than their book limit
HAVING COUNT(*) > lm.book_limit;
-- 13. Frequent borrowed items by client type ----------------------------------------------------------------------
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
-- 14. Never late returns (PRODUCES OUTPUT, NEED TO CHECK IT) ------------------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    lm.contact_information
FROM Library_Member lm
WHERE NOT EXISTS (
        -- this subquery checks for the late returns, if any exists
        SELECT 1
        FROM Make m
            JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id
        WHERE m.member_id = lm.member_id
            AND lt.return_date > lt.due_date -- this is the condition for checking late returns
    )
    AND EXISTS (
        -- this subquery checks to see if a member has one item returned
        SELECT 1
        FROM Make m
            JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id
        WHERE m.member_id = lm.member_id
            AND lt.return_date IS NOT NULL
    )
ORDER BY lm.name;
-- 15. Average loan duration (SAME OUTPUT AS 9 --> Is it asking for a specific item?)---------------------------------------------------------------------------------------
SELECT -- Calculate the average number of days items stay on loan
    AVG(DATEDIFF(lt.return_date, lt.checked_out_date)) AS average_loan_duration
FROM Library_Transaction lt
WHERE -- Only include transactions where the item has been returned
    lt.return_date IS NOT NULL;
-- 16. Monthly summary report (WORKS but might want extra data since only 3 items loaned and no fees)--------------------------------------------------------------------------------------
WITH total_items_loaned AS (
    SELECT COUNT(*) AS value
    FROM Loan l
        JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id
    WHERE lt.checked_out_date BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND CURDATE()
),
total_fees_collected AS (
    SELECT SUM(p.amount_paid) AS value
    FROM Pay p
    WHERE p.paid_date BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND CURDATE()
),
most_popular_items AS (
    SELECT GROUP_CONCAT(title SEPARATOR ', ') AS value
    FROM (
            SELECT b.title
            FROM Loan l
                JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id
                JOIN Originate o ON l.copy_id = o.copy_id
                JOIN Book b ON o.item_id = b.item_id
            WHERE lt.checked_out_date BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND CURDATE()
            GROUP BY b.title
            ORDER BY COUNT(*) DESC
            LIMIT 5
        ) AS TopBooks
)
SELECT til.value AS total_items_loaned,
    tfc.value AS total_fees_collected,
    mpi.value AS most_popular_items
FROM total_items_loaned til,
    total_fees_collected tfc,
    most_popular_items mpi;
-- 17. Statistics breakdown (PRODUCES OUTPUT, NEED TO CHECK IT) --------------------------------------------------------------------------------------
-- This query gives a breakdown of how many items of each type (Book, Digital Media, Magazine)
-- have been borrowed by each client type (Regular, Student, Senior)
-- First section: Count of borrowed Books by member type
SELECT lm.type_id AS membership_type,
    -- Select the type ID of the member (1 = Regular, 2 = Student, 3 = Senior)
    'Book' AS item_category,
    -- Manually label this result as 'Book' category
    COUNT(*) AS items_borrowed -- Count the number of books borrowed
FROM Library_Member lm -- Start with the Library_Member table
    JOIN Make mk ON lm.member_id = mk.member_id -- Join with Make table to get transactions by the member
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Join with transactions to access dates and other info
    JOIN Loan lo ON lt.transaction_id = lo.transaction_id -- Join with Loan to find which copy was borrowed
    JOIN Copy c ON lo.copy_id = c.copy_id -- Join with Copy to get the specific physical copy
    JOIN Originate o ON c.copy_id = o.copy_id -- Join with Originate to get the item ID
    JOIN Book b ON o.item_id = b.item_id -- Join with Book to confirm it is a book and get book data
WHERE lt.return_date IS NOT NULL -- Only include records where the item was returned
GROUP BY lm.type_id -- Group results by membership type
UNION ALL
-- Second section: Count of borrowed Digital Media items by member type
SELECT lm.type_id AS membership_type,
    -- Select the type ID of the member
    'Digital Media' AS item_category,
    -- Label this row as Digital Media
    COUNT(*) AS items_borrowed -- Count the number of digital media borrowed
FROM Library_Member lm -- Start from Library_Member
    JOIN Make mk ON lm.member_id = mk.member_id -- Join to get transactions by member
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Join with transaction data
    JOIN Loan lo ON lt.transaction_id = lo.transaction_id -- Join with Loan to get the borrowed copy
    JOIN Copy c ON lo.copy_id = c.copy_id -- Join with Copy
    JOIN Originate o ON c.copy_id = o.copy_id -- Join to get item ID
    JOIN Digital_Media_Item d ON o.item_id = d.item_id -- Join with Digital_Media_Item to get digital media info
WHERE lt.return_date IS NOT NULL -- Only include completed/returned items
GROUP BY lm.type_id -- Group by member type
UNION ALL
-- Third section: Count of borrowed Magazines by member type
SELECT lm.type_id AS membership_type,
    -- Select the member type
    'Magazine' AS item_category,
    -- Label this row as Magazine
    COUNT(*) AS items_borrowed -- Count how many magazines were borrowed
FROM Library_Member lm -- Start from members
    JOIN Make mk ON lm.member_id = mk.member_id -- Join to link members with transactions
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Join with transaction data
    JOIN Loan lo ON lt.transaction_id = lo.transaction_id -- Join with Loan for borrowed copy
    JOIN Copy c ON lo.copy_id = c.copy_id -- Join with Copy
    JOIN Originate o ON c.copy_id = o.copy_id -- Get item ID
    JOIN Magazine m ON o.item_id = m.item_id -- Join with Magazine table to confirm item type
WHERE lt.return_date IS NOT NULL -- Include only returned items
    -- Group by member type
GROUP BY lm.type_id;
-- 18. Client borrowing report (NOT DONE) -------------------------------------------------------------------------------------
-- 19. Item availability and history (PRODUCES OUTPUT, NEED TO CHECK IT -- THINK DATA CHANGE NEEDED) -------------------------------------------------------------------------------------
SELECT li.item_id,
    -- list all library items, their availability status, last borrowed date, and borrow status
    it.title,
    li.checked_out_status AS is_checked_out,
    MAX(lt.checked_out_date) AS last_borrowed_date,
    CASE
        -- 3 cases for borrow status (never borrowed, not borrowed in past 6 months, recently borrowed)
        WHEN MAX(lt.checked_out_date) IS NULL THEN 'Never Borrowed'
        WHEN MAX(lt.checked_out_date) < CURDATE() - INTERVAL 6 MONTH THEN 'Not borrowed in past 6 months'
        ELSE 'Recently Borrowed'
    END AS borrow_status
FROM Library_Item li
    LEFT JOIN (
        -- left join to access all the titles for every library item
        SELECT item_id,
            title
        FROM Book
        UNION ALL
        SELECT item_id,
            title
        FROM Digital_Media_Item
        UNION ALL
        SELECT item_id,
            title
        FROM Magazine
    ) AS it ON li.item_id = it.item_id
    LEFT JOIN Originate o ON li.item_id = o.item_id -- join every item with their copy, and library transaction to get the checked out date
    LEFT JOIN Loan l ON o.copy_id = l.copy_id
    LEFT JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id
GROUP BY li.item_id,
    li.checked_out_status,
    it.title;
-- 20. Overdue items report (THINK IT WORKS) ----------------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    lt.transaction_id,
    COALESCE(b.title, dm.title, m.title) AS title,
    -- Get title from whichever table it belongs to
    lt.due_date,
    DATEDIFF(CURDATE(), lt.due_date) AS days_late,
    lm.fee_type,
    DATEDIFF(CURDATE(), lt.due_date) * lm.fee_type AS late_fee
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
    JOIN Loan l ON lt.transaction_id = l.transaction_id
    JOIN Copy c ON l.copy_id = c.copy_id
    JOIN Originate o ON c.copy_id = o.copy_id
    JOIN Library_Item li ON o.item_id = li.item_id -- These joins are based on li.item_id matching item_id in each subtype table
    LEFT JOIN Book b ON li.item_id = b.item_id
    LEFT JOIN Digital_Media_Item dm ON li.item_id = dm.item_id
    LEFT JOIN Magazine m ON li.item_id = m.item_id
WHERE lt.return_date IS NULL
    AND lt.due_date < CURDATE()
    OR lt.return_date > lt.due_date -- Sort results by due date (earliest overdue first)
ORDER BY lt.due_date ASC;
-- 21. Revenue summary -------------------------------------------------------------------------------------