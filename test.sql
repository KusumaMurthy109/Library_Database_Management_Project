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