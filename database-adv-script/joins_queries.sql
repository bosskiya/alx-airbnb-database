-- Joins Query

-- Inner Join
SELECT * FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;

-- Left Join
SELECT * FROM Property LEFT JOIN Review ON Property.property_id = Review.review_id ORDER BY property_id;

-- Full Join
SELECT * FROM User FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;