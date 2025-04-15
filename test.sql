-- 11.
SELECT lm.type_id AS membership_type,
    SUM(p.amount_paid) AS total_fees_collected
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id
WHERE p.paid_date >= (CURDATE() - 30)
GROUP BY lm.type_id;