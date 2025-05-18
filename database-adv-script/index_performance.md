# User Table:

email: Used for login and finding specific users. Likely used in WHERE clauses.
user_id: Primary key, heavily used in JOIN clauses with Booking and Review tables.
role: Used for filtering users based on their role (e.g., finding all hosts). Likely used in WHERE clauses.

# Booking Table:

user_id: Foreign key, used in JOIN clauses with the User table to find bookings made by a specific user. Also used in WHERE clauses.
property_id: Foreign key, used in JOIN clauses with the Property table to find bookings for a specific property. Also used in WHERE clauses.
start_date, end_date: Used for filtering bookings within a specific date range. Likely used in WHERE clauses.

# Property Table:

host_id: Foreign key, used in JOIN clauses with the User table to find properties listed by a specific host. Also used in WHERE clauses.
location: Used for searching properties in a specific area. Likely used in WHERE clauses.
pricepernight: Used for filtering properties within a certain price range or for ordering. Likely used in WHERE and ORDER BY clauses.

# Performance Measurement

Query: Find properties in a specific location and price_per_night:

## 1.  Performance Before Indexes
mysql> EXPLAIN SELECT *
    -> FROM property
    -> where location = 'kacyiru'
    -> AND price_per_night <= 100;

* type: ALL
* key: NULL
* rows: 2
* extra: Using where

## 2. Apply Indexes
mysql> CREATE INDEX idx_location_price ON property (location, price_per_night);

## 3.  Performance after Indexes
mysql> EXPLAIN SELECT *
    -> FROM property
    -> where location = 'kacyiru'
    -> AND price_per_night <= 100;

* type: range
* key: idx_location_price
* rows: 1
* extra: Using index condition
