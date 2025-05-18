-- Indexes for User table
CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_role ON User (role);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_start_date ON Booking (start_date);
CREATE INDEX idx_booking_end_date ON Booking (end_date);
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date); -- Composite index for range queries

-- Indexes for Property table
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_pricepernight ON Property (pricepernight);

# Performance Measurement

## 1.  Performance Before Indexes

### by using MySQL
EXPLAIN SELECT * FROM property where location = 'kacyiru' AND price_per_night <= 100;

### By using Postgre SQL
EXPLAIN ANALYZE SELECT * FROM property where location = 'kacyiru' AND price_per_night <= 100;
Query: Find properties in a specific location and price_per_night:

* type: ALL
* key: NULL
* rows: 2
* extra: Using where

## 2. Apply Indexes
CREATE INDEX idx_location_price ON property (location, price_per_night);

## 3.  Performance after Indexes

### by using MySQL
EXPLAIN SELECT * FROM property where location = 'kacyiru' AND price_per_night <= 100;

### By using Postgre SQL
EXPLAIN ANALYZE SELECT * FROM property where location = 'kacyiru' AND price_per_night <= 100;
* type: range
* key: idx_location_price
* rows: 1
* extra: Using index condition
