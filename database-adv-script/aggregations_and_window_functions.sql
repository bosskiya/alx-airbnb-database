-- Aggregations and Window functions

-- Query to find the total number of bookings made by each user
SELECT COUNT(user_id) FROM Booking GROUP BY (user_id);

-- ROW_NUMBER, RANK to rank properties based on the total number of bookings
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
