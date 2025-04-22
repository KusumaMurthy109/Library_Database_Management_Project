SELECT CASE
        lm.type_id
        WHEN 1 THEN 'Regular'
        WHEN 2 THEN 'Student'
        WHEN 3 THEN 'Senior_Citizen'
    END AS membership_type,
    CASE
        WHEN b.item_id IS NOT NULL THEN 'Book'
        WHEN dm.item_id IS NOT NULL THEN 'Digital Media'
        WHEN m.item_id IS NOT NULL THEN 'Magazine'
        ELSE 'Unknown'
    END AS item_type,
    SUM(p.amount_paid) AS total_revenue
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