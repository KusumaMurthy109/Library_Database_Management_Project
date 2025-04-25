SELECT lm.member_id,
    lm.name,
    lm.contact_information,
    lm.account_status,
    CASE
        WHEN lm.type_id = 1 THEN 'Regular'
        WHEN lm.type_id = 2 THEN 'Student'
        WHEN lm.type_id = 3 THEN 'Senior Citizen'
    END AS member_type
FROM Library_Member lm
WHERE lm.member_id NOT IN (
        SELECT DISTINCT m.member_id
        FROM Make m
            JOIN Loan l ON m.transaction_id = l.transaction_id
    )
ORDER BY lm.member_id;