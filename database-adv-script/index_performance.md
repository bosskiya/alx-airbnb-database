# Query Optimization

    🔍 Identifing High-Usage Columns
        |-----------|---------------------------|---------------------------------------------------|
        |Table	    |    Column	                |    Reason for High Usage                          |
        |-----------|---------------------------|---------------------------------------------------|
        |User	    |    user_id	            |        Used in JOIN with Booking and Property     |
        |           |    email	                |    Used in authentication (WHERE)                 |
        |           |    role	                |    Often filtered in admin/host/guest interfaces  |
        |-----------|---------------------------|---------------------------------------------------|
        |Property	|    property_id	        |        Used in JOIN with Booking                  |
        |           |    host_id	            |        Used in JOIN with User                     |
        |           |    location	            |    Used in filters (e.g., property search)        |
        |           |    pricepernight	        |    Used in price range filters                    |
        |-----------|---------------------------|---------------------------------------------------|
        |Booking	|    user_id	            |        Used in JOIN with User                     |
        |           |    property_id	        |        Used in JOIN with Property                 |
        |           |    status	                |    Used in filters (WHERE)                        |
        |           |    start_date, end_date	|    Used in availability filters                   |
        |-----------|---------------------------|---------------------------------------------------|

    🛠️ SQL CREATE INDEX Commands
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

    ⏱️ 3. Performance Measurement with EXPLAIN ANALYZE
        Before adding indexes, run:
            EXPLAIN ANALYZE
            SELECT * FROM Booking
            WHERE user_id = '123e4567-e89b-12d3-a456-426614174000'
            AND status = 'confirmed';

        Expected output (before indexes):
            Seq Scan on Booking ...
            Filter: ...
            Execution time: ~ high

        After creating indexes, run the same query:
            EXPLAIN ANALYZE
            SELECT * FROM Booking
            WHERE user_id = '123e4567-e89b-12d3-a456-426614174000'
            AND status = 'confirmed';

        Expected output (after indexes):
            Bitmap Index Scan on idx_booking_user_id ...
            Bitmap Index Scan on idx_booking_status ...
            Execution time: ~ lower

        Try also:
            EXPLAIN ANALYZE
            SELECT * FROM Property WHERE location = 'New York' AND pricepernight <= 200;

            Or:

            EXPLAIN ANALYZE
            SELECT * FROM Property p
            JOIN User u ON p.host_id = u.user_id WHERE u.role = 'host' AND p.location = 'Paris';