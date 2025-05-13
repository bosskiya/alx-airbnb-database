-- Aggregations and Window functions

-- Query to find the total number of bookings made by each user
SELECT COUNT(user_id) FROM Booking GROUP BY (user_id);

-- ROW_NUMBER, RANK to rank properties based on the total number of bookings
SELECT property_id, property_name, total_bookings, RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT p.property_id, p.name AS property_name, COUNT(b.booking_id) AS total_bookings
    FROM Property p LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
) AS booking_counts;