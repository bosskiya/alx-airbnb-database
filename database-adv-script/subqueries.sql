-- Sub-Queries

-- Find properties where average rating is greater than 4.0
SELECT * FROM Property WHERE property_id > (SELECT property_id FROM Review WHERE AVG(rating) > 4.0);

-- Correlated subquery to find users who have made more than 3 bookings
SELECT * FROM User WHERE user_id = (SELECT user_id FROM Booking WHERE COUNT(user_id) > 3);