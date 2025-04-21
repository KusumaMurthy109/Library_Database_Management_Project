-- 11 CHECK
SELECT lm.type_id AS membership_type,
    p.paid_date,
    SUM(p.amount_paid) AS total_fees_collected,
    (
        SELECT SUM(p1.amount_paid)
        FROM Pay p1
        WHERE p1.paid_date BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
            AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
    ) AS grand_total
FROM Pay p
    JOIN Library_Member lm ON p.member_id = lm.member_id
WHERE p.paid_date BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
    AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
GROUP BY lm.type_id;