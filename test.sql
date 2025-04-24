SELECT m.member_id,
    m.name AS member_name,
    m.contact_information,
    b.title AS recommended_book,
    b.author AS book_author
FROM Library_Member m
    JOIN Give g ON m.member_id = g.member_id
    JOIN Recommendation r ON g.recommendation_id = r.recommendation_id
    JOIN Consists_Of co ON r.recommendation_id = co.recommendation_id
    JOIN Book b ON co.item_id = b.item_id
ORDER BY m.member_id,
    b.title;