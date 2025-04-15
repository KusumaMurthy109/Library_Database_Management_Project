SELECT c.copy_id,
    bk.title,
    bk.genre
FROM Book bk
    JOIN Library_Item li ON bk.item_id = li.item_id
    JOIN Originate o ON li.item_id = o.item_id
    JOIN Copy c ON o.copy_id = c.copy_id
WHERE c.status = 'in_stock'
    and bk.genre = 'Fantasy';