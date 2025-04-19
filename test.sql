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