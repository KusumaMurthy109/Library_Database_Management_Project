SELECT ROUND(AVG(DATEDIFF(fulfilled_date, request_date)), 2) AS avg_fulfillment_days
FROM Waitlist
WHERE waitlist_status = 'available_for_checkout';