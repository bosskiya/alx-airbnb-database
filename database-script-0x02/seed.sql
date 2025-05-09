-- Checking with insert statement

INSERT INTO users VALUES (UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword1', '123-456-7890', 'guest', CURRENT_TIMESTAMP);
INSERT INTO users VALUES (UUID(), 'Bob', 'Smith', 'bob.smith@example.com', 'hashedpassword2', '234-567-8901', 'host', CURRENT_TIMESTAMP);
INSERT INTO users VALUES (UUID(), 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashedpassword3', NULL, 'admin', CURRENT_TIMESTAMP);

INSERT INTO property VALUES (UUID(), (SELECT user_id FROM users WHERE first_name = 'Bob' AND last_name = 'Smith'), 'Cozy Cottage', 'A small and cozy cottage in the countryside.', '123 Countryside Rd, Springfield', 100.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO property VALUES (UUID(), (SELECT user_id FROM users WHERE first_name = 'Bob' AND last_name = 'Smith'), 'Luxury Apartment', 'A luxurious apartment in the city center.', '456 City St, Springfield', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO booking VALUES (UUID(), (SELECT property_id FROM property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM users WHERE first_name = 'Alice' AND last_name = 'Johnson'), '2025-06-01', '2025-06-07', 700.00, 'confirmed', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES (UUID(), (SELECT property_id FROM property WHERE name = 'Luxury Apartment'), (SELECT user_id FROM users WHERE first_name = 'Alice' AND last_name = 'Johnson'), '2025-06-10', '2025-06-15', 1250.00, 'pending', CURRENT_TIMESTAMP);

INSERT INTO payment VALUES (UUID(), (SELECT booking_id FROM booking WHERE status = 'confirmed' AND total_price = 700.00), 700.00, CURRENT_TIMESTAMP, 'credit_card');
INSERT INTO payment VALUES (UUID(), (SELECT booking_id FROM booking WHERE status = 'pending' AND total_price = 1250.00), 1250.00, CURRENT_TIMESTAMP, 'paypal');

INSERT INTO review VALUES (UUID(), (SELECT property_id FROM property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM users WHERE first_name = 'Alice' AND last_name = 'Johnson'), 4, 'Great stay! The cottage was cozy and peaceful.', CURRENT_TIMESTAMP);
INSERT INTO review VALUES (UUID(), (SELECT property_id FROM property WHERE name = 'Luxury Apartment'), (SELECT user_id FROM users WHERE first_name = 'Alice' AND last_name = 'Johnson'), 5, 'Amazing apartment, very luxurious and spacious.', CURRENT_TIMESTAMP);

INSERT INTO message VALUES (UUID(), (SELECT user_id FROM users WHERE first_name = 'Alice' AND last_name = 'Johnson'), (SELECT user_id FROM users WHERE first_name = 'Bob' AND last_name = 'Smith'), 'Hi Bob, I just booked your Cozy Cottage for my vacation!', CURRENT_TIMESTAMP);
INSERT INTO message VALUES (UUID(), (SELECT user_id FROM users WHERE first_name = 'Bob' AND last_name = 'Smith'), (SELECT user_id FROM users WHERE first_name = 'Alice' AND last_name = 'Johnson'), 'Hello Alice, thank you for your booking! I hope you enjoy your stay at the cottage.', CURRENT_TIMESTAMP);