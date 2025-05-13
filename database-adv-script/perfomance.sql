-- Query that retrieves all bookings along with the user details, property details, and payment details
SELECT * FROM Booking b 
INNER JOIN User u ON b.user_id = u.user_id 
INNER JOIN Property p ON b.property_id = p.property_id
WHERE u.user_id = p.host_id;