-- Measure the query performance before adding indexes
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = '123e4567-e89b-12d3-a456-426614174000' AND status = 'confirmed';

-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes for Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Measure the query performance after adding indexes
-- After running CREATE INDEX commands
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = '123e4567-e89b-12d3-a456-426614174000' AND status = 'confirmed';