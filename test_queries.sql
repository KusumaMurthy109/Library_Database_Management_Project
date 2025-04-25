/* 
 ================
 General Queries.
 ================
 */
-- 1. List all books by a specific author --------------------------------------------------------------------------
SELECT *
FROM Book
WHERE author = 'J.K. Rowling';
-- Only show the books where the author's name is 'J.K. Rowling'
-- 2. Find books by publication year -------------------------------------------------------------------------------
SELECT *
FROM Book -- Only show the books that were published in the year 2003
WHERE publication_year = 2003;
-- 3. Check membership status --------------------------------------------------------------------------------------
-- Select specific details (name, account status, contact info, book limit, and fee type) from the Library_Member table
SELECT name,
    account_status,
    contact_information,
    book_limit,
    fee_type
FROM Library_Member -- Only show the information for the member whose ID is 31
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
FROM Book bk -- From the Book table (calling it 'bk')
    JOIN Originate o ON bk.item_id = o.item_id -- Join it with the Originate table using item_id
    JOIN Copy c ON o.copy_id = c.copy_id -- Then join that result with the Copy table using copy_id
WHERE c.status = 'in_stock' -- Only show books where the copy status is 'in_stock'
    AND bk.genre = 'Fantasy';
-- And the genre of the book is 'Fantasy'
-- 6. Frequent borrowers of a specific genre -----------------------------------------------------------------------
WITH total_fantasy_recent_checked_out AS (
    SELECT lm.member_id,
        lm.name,
        COUNT(c.copy_id) AS total_checked_out
    FROM Library_Member lm -- Join with Make table on member ID
        JOIN Make m ON lm.member_id = m.member_id -- Join with Make table on member ID
        JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id -- Join with Library_Transaction table on transaction ID
        JOIN Loan l ON lt.transaction_id = l.transaction_id -- Join with Loan table on transaction ID
        JOIN Copy c ON l.copy_id = c.copy_id -- Join with Copy table on copy ID
        JOIN Originate o ON c.copy_id = o.copy_id -- Join with Originate table on copy ID
        JOIN Book bk ON o.item_id = bk.item_id -- Join with Book table on item ID
    WHERE bk.genre = "Fantasy" -- Only count checkouts from last year
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
        -- Group the results by member ID and name
        lm.name
),
max_checked_out AS (
    -- Create another temporary table to find the maximum number of Fantasy books checked out
    SELECT MAX(total_checked_out) AS max_value -- Find the highest number of checkouts
    FROM total_fantasy_recent_checked_out
)
SELECT member_id,
    name,
    total_checked_out -- Only show the member(s) who have the maximum checkouts
FROM total_fantasy_recent_checked_out
WHERE total_checked_out = (
        SELECT max_value
        FROM max_checked_out
    );
-- 7. Books Due Soon -----------------------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name AS member_name,
    b.title AS book_title,
    lt.due_date
FROM Library_Member lm
    JOIN Make mk ON lm.member_id = mk.member_id -- Find the members with active loans
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
    JOIN Loan l ON lt.transaction_id = l.transaction_id
    JOIN Copy c ON l.copy_id = c.copy_id -- Get the actual book copy and title
    JOIN Originate o ON c.copy_id = o.copy_id
    JOIN Book b ON o.item_id = b.item_id
WHERE lt.return_date IS NULL -- Only show the items that are currently checked out
    AND lt.due_date >= CURDATE()
    AND lt.due_date <= DATE_ADD(CURDATE(), INTERVAL 7 DAY) -- Show the items that are due within next week
ORDER BY lt.due_date ASC;
--order the items in teh table from the soonest due first
-- 8. Members with overdue books -----------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name AS member_name,
    b.title AS overdue_book_title,
    lt.due_date
FROM Library_Member lm -- From the Library_Member table (shortened as 'lm')
    JOIN Make mk ON lm.member_id = mk.member_id -- Join with the Make table using member ID
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Join with the Library_Transaction table using transaction ID
    JOIN Loan lo ON lt.transaction_id = lo.transaction_id -- Join with the Loan table using transaction ID
    JOIN Copy c ON lo.copy_id = c.copy_id -- Join with the Copy table using copy ID
    JOIN Originate o ON c.copy_id = o.copy_id -- Join with the Originate table using copy ID
    JOIN Book b ON o.item_id = b.item_id -- Join with the Book table using item ID
    -- Only include records where the book has not been returned yet (return_date is NULL)
WHERE lt.return_date IS NULL -- And where the due date has already passed (before today's date)
    AND lt.due_date < CURDATE();
-- 9. Average borrowing time ---------------------------------------------------------------------------------------
SELECT b.genre,
    -- Get genre of the book (ex. Fantasy)
    ROUND(
        AVG(DATEDIFF(lt.return_date, lt.checked_out_date)),
        2
    ) AS days_borrowed -- Average number of days books were borrowed for the genre
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
-- 11. Monthly fees report -----------------------------------------------------------------------------------------
SELECT lm.type_id AS membership_type,
    -- Select membership type and fees for each type 
    SUM(p.amount_paid) AS total_fees_collected,
    (
        SELECT SUM(p1.amount_paid) -- Subquery to calculate the total of all fees by membership type within the month 
        FROM Pay p1
        WHERE p1.paid_date BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
            AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
    ) AS grand_total
FROM Pay p -- From pay table join with library members to get membership type 
    JOIN Library_Member lm ON p.member_id = lm.member_id
WHERE p.paid_date BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01') -- Where payments are made in the previous month
    AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
GROUP BY lm.type_id;
-- Group by membership type 
-- 12. Exceeding borrowing limits ----------------------------------------------------------------------------------
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
        JOIN Make mk ON lm.member_id = mk.member_id -- Join with the Make table on member ID
        JOIN Loan ln ON mk.transaction_id = ln.transaction_id -- Join with the Loan table on transaction ID
        JOIN Originate o ON ln.copy_id = o.copy_id -- Join with the Originate table on copy ID
        JOIN Library_Item li ON o.item_id = li.item_id -- Join with the Library_Item table on item ID
    GROUP BY lm.type_id,
        li.item_id
),
-- Create another temporary table called 'RankedBorrowings'
RankedBorrowings AS (
    SELECT client_type,
        item_id,
        borrow_count,
        -- Assign a rank number within each client type based on borrow count (highest first)
        ROW_NUMBER() OVER (
            PARTITION BY client_type
            ORDER BY borrow_count DESC
        ) AS rnk
    FROM Borrowings
) -- Finally, select the top borrowed item for each client type
SELECT client_type,
    item_id,
    borrow_count
FROM RankedBorrowings
WHERE rnk = 1 -- Only keep the items ranked #1 (most borrowed) for each client type
ORDER BY client_type;
-- Order the final result by client type
-- Sort results by client type and highest borrow count
-- 14. Never late returns ------------------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    lm.contact_information
FROM Library_Member lm
WHERE NOT EXISTS (
        -- This subquery checks for the late returns, if any exists
        SELECT 1
        FROM Make m
            JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id
        WHERE m.member_id = lm.member_id
            AND (
                lt.return_date > lt.due_date
                OR (
                    lt.return_date IS NULL
                    AND CURDATE() > lt.due_date
                )
            ) -- This is the condition for checking late returns
    )
    AND EXISTS (
        -- This subquery checks to see if a member has one item returned
        SELECT 1
        FROM Make m
            JOIN Library_Transaction lt ON m.transaction_id = lt.transaction_id
        WHERE m.member_id = lm.member_id
            AND lt.return_date IS NOT NULL
    )
ORDER BY lm.name;
-- 15. Average loan duration ---------------------------------------------------------------------------------------
SELECT -- Calculate the average number of days items stay on loan
    ROUND(
        AVG(DATEDIFF(lt.return_date, lt.checked_out_date)),
        2
    ) AS average_loan_duration
FROM Library_Transaction lt
WHERE -- Only include transactions where the item has been returned
    lt.return_date IS NOT NULL;
-- 16. Monthly summary report --------------------------------------------------------------------------------------
-- This report shows a summary for the current month.
-- It includes total items loaned, total fees collected, and the top 5 most popular books.
-- The results are gathered using temporary tables and combined into one final output.
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
                JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id -- Join with Library_Transaction table
                JOIN Originate o ON l.copy_id = o.copy_id -- Join with Originate table
                JOIN Book b ON o.item_id = b.item_id -- Join with Book table
            WHERE lt.checked_out_date BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND CURDATE() -- Only include checkouts from this month
            GROUP BY b.title -- Group by book title
            ORDER BY COUNT(*) DESC -- Order titles by how many times they were borrowed, most first
            LIMIT 5 -- Only take the top 5 books
        ) AS TopBooks
)
SELECT til.value AS total_items_loaned,
    -- Total items loaned this month
    tfc.value AS total_fees_collected,
    -- Total fees collected this month
    mpi.value AS most_popular_items -- Most popular items this month
FROM total_items_loaned til,
    total_fees_collected tfc,
    most_popular_items mpi;
-- 17. Statistics breakdown ----------------------------------------------------------------------------------------
-- This query gives a breakdown of how many items of each type (Book, Digital Media, Magazine)
-- Have been borrowed by each client type (Regular, Student, Senior)
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
    -- Group by member type
GROUP BY lm.type_id;
-- 18. Client borrowing report -------------------------------------------------------------------------------------
SELECT lm.member_id,
    -- member_id unique ID of the library member
    lm.name,
    -- name full name of the client
    lt.transaction_id,
    -- transaction_id ID of each borrowing transaction
    lt.checked_out_date,
    -- checked_out_date when the item was borrowed
    lt.due_date,
    -- due_date when it was due
    lt.return_date,
    -- return_date actual return date (NULL if not returned)
    COALESCE(b.title, dm.title, m.title) AS borrowed_title,
    -- borrowed_title actual title of the borrowed item
    SUM(
        CASE
            WHEN lt.return_date IS NULL -- Check if the book has not been returned yet.
            AND lt.due_date < CURDATE() THEN DATEDIFF(CURDATE(), lt.due_date) * lm.fee_type -- And, compare if the due date is passed. Then, calculate the amount owed based on their fee type and how many days have passed.
            ELSE 0 -- Otherwise, no fee is incurred.
        END
    ) AS overdue_balance,
    -- Overdue_balance total unpaid fees on the member's account
    -- Reserved items: collect titles from Book, Digital Media, or Magazine
    GROUP_CONCAT(
        DISTINCT COALESCE(rb.title, rdm.title, rm.title) SEPARATOR ', '
    ) AS reserved_items -- Reserved_items comma-separated titles on hold
FROM Library_Member lm -- Borrowing History
    LEFT JOIN Make mk ON lm.member_id = mk.member_id
    LEFT JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
    LEFT JOIN Loan l ON lt.transaction_id = l.transaction_id
    LEFT JOIN Copy c ON l.copy_id = c.copy_id
    LEFT JOIN Originate o ON c.copy_id = o.copy_id
    LEFT JOIN Library_Item li ON o.item_id = li.item_id
    LEFT JOIN Book b ON li.item_id = b.item_id -- Join with Book table
    LEFT JOIN Digital_Media_Item dm ON li.item_id = dm.item_id -- Join with Digital Media table
    LEFT JOIN Magazine m ON li.item_id = m.item_id -- Join with Magazines table
    -- Member Account
    LEFT JOIN Member_Account ma ON lm.member_id = ma.account_id -- View relationship: member_id ↔ account_id
    -- Reserved Items (on Hold)
    LEFT JOIN Hold h ON lm.member_id = h.member_id
    LEFT JOIN Copy rc ON h.copy_id = rc.copy_id
    LEFT JOIN Originate ro ON rc.copy_id = ro.copy_id
    LEFT JOIN Library_Item rli ON ro.item_id = rli.item_id
    LEFT JOIN Book rb ON rli.item_id = rb.item_id -- Reserved Book title
    LEFT JOIN Digital_Media_Item rdm ON rli.item_id = rdm.item_id -- Reserved Digital Media title
    LEFT JOIN Magazine rm ON rli.item_id = rm.item_id -- Reserved Magazine title
GROUP BY lm.member_id,
    lm.name,
    lt.transaction_id,
    lt.checked_out_date,
    lt.due_date,
    lt.return_date,
    COALESCE(b.title, dm.title, m.title),
    ma.overdue_balance
ORDER BY lm.member_id,
    lt.checked_out_date DESC;
-- 19. Item availability and history -------------------------------------------------------------------------------
-- Get the inventory status for all the library items with borrowing activity
SELECT li.item_id,
    it.title,
    -- Check if any of the copies are checked out (returns 'checked_out' if any copy is out)
    MAX(
        CASE
            WHEN c.copy_id IS NOT NULL THEN c.status
            ELSE 'in_stock'
        END
    ) AS is_checked_out,
    -- List all of teh copy IDs for this item
    GROUP_CONCAT(DISTINCT c.copy_id) AS copy_ids,
    -- FInd most recent checkout dates
    MAX(lt.checked_out_date) AS last_borrowed_date,
    -- Categorize the borrowing activity of items
    CASE
        WHEN MAX(lt.checked_out_date) IS NULL THEN 'Never Borrowed'
        WHEN MAX(lt.checked_out_date) < CURDATE() - INTERVAL 6 MONTH THEN 'Not borrowed in past 6 months'
        ELSE 'Recently Borrowed'
    END AS borrow_status
FROM Library_Item li -- Combine the titles from all items types, such as books, media, magazines
    LEFT JOIN (
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
    ) AS it ON li.item_id = it.item_id -- Link to physical copies and their loan history
    LEFT JOIN Originate o ON li.item_id = o.item_id
    LEFT JOIN Copy c ON o.copy_id = c.copy_id
    LEFT JOIN Loan l ON c.copy_id = l.copy_id
    LEFT JOIN Library_Transaction lt ON l.transaction_id = lt.transaction_id
GROUP BY li.item_id,
    it.title;
-- 20. Overdue items report ----------------------------------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    lt.transaction_id,
    COALESCE(b.title, dm.title, m.title) AS title,
    -- Get title from whichever table it belongs to
    lt.due_date,
    CASE
        -- If the book hasn't been returned (return_date NULL), then get the difference of the due date and today's date.
        WHEN lt.return_date IS NULL THEN DATEDIFF(CURDATE(), lt.due_date)
        WHEN lt.return_date IS NOT NULL THEN DATEDIFF(lt.return_date, lt.due_date) -- If the book has been returned, just get the difference of the due date and return date.
    END AS days_late,
    CASE
        WHEN lt.return_date IS NOT NULL THEN "Returned" -- If the return date is not NULL, then it is returned.
        WHEN lt.return_date IS NULL THEN "Not Yet Returned" -- If the return date is NULL, it is not returned.
    END AS returned_yet,
    lm.fee_type,
    CASE
        WHEN lt.return_date IS NULL THEN DATEDIFF(CURDATE(), lt.due_date) * lm.fee_type -- If the book hasn't been returned, then the fine is calculated from the difference of today's date and due date.
        WHEN lt.return_date IS NOT NULL THEN DATEDIFF(lt.return_date, lt.due_date) * lm.fee_type -- If the book has been returned, then the fine is calculated from the difference of return date and due date.
    END AS late_fee
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
WHERE lt.return_date IS NULL -- If not yet returned and it is overdue.
    AND lt.due_date < CURDATE() -- Or if its returned, but returned late.
    OR lt.return_date > lt.due_date -- Sort results by due date (earliest overdue first)
ORDER BY lt.due_date ASC;
-- 21. Revenue summary ---------------------------------------------------------------------------------------------
SELECT CASE
        lm.type_id -- Type ID tells the member's type.
        WHEN 1 THEN 'Regular'
        WHEN 2 THEN 'Student'
        WHEN 3 THEN 'Senior_Citizen'
    END AS membership_type,
    CASE
        -- Find if its a Book, Digital Media, or Magazine.
        WHEN b.item_id IS NOT NULL THEN 'Book'
        WHEN dm.item_id IS NOT NULL THEN 'Digital Media'
        WHEN m.item_id IS NOT NULL THEN 'Magazine'
        ELSE 'Unknown'
    END AS item_type,
    SUM(p.amount_paid) AS total_revenue -- Get the total revenue by summing all of the amount paid.
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id -- Join to get membership type
    JOIN Incur i ON p.fine_id = i.fine_id -- Link fines to transactions
    JOIN Library_Transaction lt ON i.transaction_id = lt.transaction_id
    JOIN Loan l ON lt.transaction_id = l.transaction_id -- Link transactions to items through loan and copy
    JOIN Originate o ON l.copy_id = o.copy_id
    JOIN Library_Item li ON o.item_id = li.item_id
    LEFT JOIN Book b ON li.item_id = b.item_id -- Determine item category
    LEFT JOIN Digital_Media_Item dm ON li.item_id = dm.item_id
    LEFT JOIN Magazine m ON li.item_id = m.item_id
GROUP BY membership_type,
    item_type
ORDER BY membership_type,
    item_type;
/* 
 ===============================================
 Report: Generate a Collection Analysis Report.
 ===============================================
 */
-- Genre Distributions in the Book Items ---------------------------------------------------------------------------
SELECT b.genre as genre,
    COUNT(b.item_id) AS book_count,
    -- Count books in each genre
    ROUND(
        COUNT(b.item_id) * 100.0 / (
            SELECT COUNT(*) -- Get total number of books in the library
            FROM Book
        ),
        2
    ) AS percentage -- Calculate percentage share of each genre
FROM Book b
GROUP BY b.genre -- Group by genre
ORDER BY book_count DESC;
-- Show most common genres first -----------------------------------------------------------------------------------
-- Trends in Acquisitions
SELECT publication_year,
    COUNT(*) AS books_added,
    -- Count total number of books for each year
    CASE
        WHEN publication_year >= YEAR(CURDATE()) - 20 THEN 'Recent (Last 20 Years)' -- Label books published within the last 20 years
        ELSE 'Older' -- Label order books
    END AS acquisition_period
FROM Book
GROUP BY publication_year,
    -- Group by year and acquisition time
    acquisition_period
ORDER BY publication_year DESC;
-- Show most recent years first ------------------------------------------------------------------------------------
-- Assessing the Age of the Collection
SELECT ROUND(AVG(YEAR(CURDATE()) - publication_year), 2) AS avg_age_years,
    -- Calculate average age of books
    MAX(YEAR(CURDATE()) - publication_year) AS oldest_book_age,
    -- Calculate age of the oldest book
    MIN(YEAR(CURDATE()) - publication_year) AS newest_book_age -- Calculate age of the most recently published book
FROM Book;
-- Books with low circulation and analyze borrowing patterns -------------------------------------------------------
SELECT b.title,
    b.publication_year,
    b.genre as genre
FROM Book b -- Use EXISTS with a LEFT JOIN to associate each book with a loan, if any
    LEFT JOIN Loan l ON EXISTS (
        SELECT 1
        FROM Originate o -- Join with Copy
            JOIN Copy c ON o.copy_id = c.copy_id
        WHERE o.item_id = b.item_id
            AND c.copy_id = l.copy_id -- Check if that copy was loaned
    )
WHERE l.copy_id IS NULL -- Only include books with no borrowing history
GROUP BY b.item_id;
-- Borrowing Patterns by Genre -------------------------------------------------------------------------------------
-- Shows how often items (books, magazines, digital media) are borrowed by genre
SELECT COALESCE(bk.genre, m.genre, dmi.genre) AS genre_name,
    -- Combine genre from different media types
    COUNT(DISTINCT l.copy_id) AS total_borrows,
    -- Count unique of borrowed items
    ROUND(
        COUNT(DISTINCT l.copy_id) * 100.0 / (
            SELECT COUNT(*)
            FROM Loan -- Get total number of borrow transactions
        ),
        2
    ) AS borrow_percentage -- Share of each genre in total borrowings
FROM Loan l
    JOIN Originate o ON l.copy_id = o.copy_id -- Get item info from copy
    LEFT JOIN Book bk ON bk.item_id = o.item_id -- Join with Book if it's a book
    LEFT JOIN Magazine m ON m.item_id = o.item_id -- Join with Magazine if it's a magazine
    LEFT JOIN Digital_Media_Item dmi ON dmi.item_id = o.item_id -- Join with Digital Media if applicable
WHERE bk.item_id IS NOT NULL
    OR m.item_id IS NOT NULL
    OR dmi.item_id IS NOT NULL -- Ensure the item exists in one of the media tables
GROUP BY COALESCE(bk.genre, m.genre, dmi.genre) -- Group by merged genre name
ORDER BY total_borrows DESC;
-- Show most borrowed genres first
-- Most Active Library Members (Most Books Returned) ---------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    COUNT(*) AS books_read -- Counts the total books read for each member
FROM Library_Member lm --  Join with Make to find members that made transactions
    JOIN Make mk ON lm.member_id = mk.member_id -- Join with Library_Transactions to find the transaction details
    JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id -- Join with Loan to find loan record
    JOIN Loan l ON lt.transaction_id = l.transaction_id -- Join with Copy to find the copy that was loaned
    JOIN Copy c ON l.copy_id = c.copy_id -- Join with Originate to find the item id of the copy
    JOIN Originate o ON c.copy_id = o.copy_id -- Join with Book to get details of the book
    JOIN Book b ON o.item_id = b.item_id
WHERE lt.return_date IS NOT NULL -- Only include items that were returned
    AND YEAR(lt.return_date) = YEAR(CURDATE()) -- Only include returns made this year
GROUP BY lm.member_id,
    lm.name -- Group by member to count books read
ORDER BY books_read DESC -- Order members by most books read
    -- Top 10 readers only
LIMIT 10;
/*
 ===============================
 Additional Queries of Our Own.
 ===============================
 */
-- 1. Average Time on the Waitlist ---------------------------------------------------------------------------------
SELECT ROUND(AVG(DATEDIFF(fulfilled_date, request_date)), 2) AS avg_fulfillment_days
FROM Waitlist -- Calculate the average waitlist time for items that are now available to be checked out
WHERE waitlist_status = 'available_for_checkout';
-- 2. Best Rated Books In Library ----------------------------------------------------------------------------------
SELECT b.title,
    ROUND(AVG(r.stars_given), 2) AS average_rating,
    -- Average stars given to the book
    COUNT(*) AS total_ratings -- Total number of rating received
FROM Rating r -- Join with Library_Member to find which members gave ratings
    JOIN Library_Member lm ON r.member_id = lm.member_id -- Join with Book to find which books were given ratings
    JOIN Book b ON r.item_id = b.item_id
GROUP BY b.title -- Group by book title
HAVING COUNT(*) >= 1 -- Only include books with at least 5 ratings (can be edited out)
ORDER BY average_rating DESC,
    total_ratings DESC -- Order by average rating, then number of ratings
    -- Show top 10 best-rated books
LIMIT 10;
-- 3. Author with the Highest Amount of Books In Library -----------------------------------------------------------
WITH author_and_books AS (
    -- Create CTE to count the number of books per author
    SELECT author AS author_name,
        COUNT(*) AS book_count
    FROM Book
    GROUP BY author
    ORDER BY book_count DESC -- Order authors by the number of books in descending order
)
SELECT author_name,
    -- Select the author(s) with the max number of books
    MAX(book_count) AS max_books_by_author
FROM author_and_books;
-- 4. Book Recommendations by Library Members ----------------------------------------------------------------------
SELECT m.member_id,
    m.name AS member_name,
    m.contact_information,
    b.title AS recommended_book,
    b.author AS book_author
FROM Library_Member m -- Join with Give to find which recommendations were given to ecah member
    JOIN Give g ON m.member_id = g.member_id -- Join with Recommendation to get the recommendation details
    JOIN Recommendation r ON g.recommendation_id = r.recommendation_id -- Join with Consists_Of to find which books are in each recommendation
    JOIN Consists_Of co ON r.recommendation_id = co.recommendation_id -- Join with Book to get book title and author
    JOIN Book b ON co.item_id = b.item_id
ORDER BY m.member_id,
    b.title;
-- Order reults by member ID and then by book title
-- 5. Library Members that Have Never Borrowed ---------------------------------------------------------------------
SELECT lm.member_id,
    lm.name,
    lm.contact_information,
    lm.account_status,
    CASE
        -- Gives decriptive names for member type
        WHEN lm.type_id = 1 THEN 'Regular'
        WHEN lm.type_id = 2 THEN 'Student'
        WHEN lm.type_id = 3 THEN 'Senior Citizen'
    END AS member_type
FROM Library_Member lm
WHERE lm.member_id NOT IN (
        -- Exclude members who have made at least one loan
        SELECT DISTINCT m.member_id
        FROM Make m
            JOIN Loan l ON m.transaction_id = l.transaction_id
    )
ORDER BY lm.member_id -- Order the result by member ID