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
    -- overdue_balance total unpaid fees on the member's account
    -- Reserved items: collect titles from Book, Digital Media, or Magazine
    GROUP_CONCAT(
        DISTINCT COALESCE(rb.title, rdm.title, rm.title) SEPARATOR ', '
    ) AS reserved_items -- reserved_items comma-separated titles on hold
FROM Library_Member lm -- Borrowing History
    LEFT JOIN Make mk ON lm.member_id = mk.member_id
    LEFT JOIN Library_Transaction lt ON mk.transaction_id = lt.transaction_id
    LEFT JOIN Loan l ON lt.transaction_id = l.transaction_id
    LEFT JOIN Copy c ON l.copy_id = c.copy_id
    LEFT JOIN Originate o ON c.copy_id = o.copy_id
    LEFT JOIN Library_Item li ON o.item_id = li.item_id
    LEFT JOIN Book b ON li.item_id = b.item_id -- join with Book table
    LEFT JOIN Digital_Media_Item dm ON li.item_id = dm.item_id -- join with Digital Media table
    LEFT JOIN Magazine m ON li.item_id = m.item_id -- join with Magazines table
    -- Member Account
    LEFT JOIN Member_Account ma ON lm.member_id = ma.account_id -- View relationship: member_id ↔ account_id
    -- Reserved Items (on Hold)
    LEFT JOIN Hold h ON lm.member_id = h.member_id
    LEFT JOIN Copy rc ON h.copy_id = rc.copy_id
    LEFT JOIN Originate ro ON rc.copy_id = ro.copy_id
    LEFT JOIN Library_Item rli ON ro.item_id = rli.item_id
    LEFT JOIN Book rb ON rli.item_id = rb.item_id -- reserved Book title
    LEFT JOIN Digital_Media_Item rdm ON rli.item_id = rdm.item_id -- reserved Digital Media title
    LEFT JOIN Magazine rm ON rli.item_id = rm.item_id -- reserved Magazine title
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