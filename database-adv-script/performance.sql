mysql> SELECT
    ->     b.booking_id,
    ->     b.start_date,
    ->     b.end_date,
    ->     u.user_id,
    ->     u.first_name,
    ->     u.last_name,
    ->     u.email,
    ->     p.property_id,
    ->     p.name AS property_name,
    ->     p.price_per_night,
    ->
    ->     pm.payment_id,
    ->     pm.amount
    -> FROM
    ->     Booking AS b
    -> JOIN
    ->     User AS u ON b.user_id = u.user_id
    -> JOIN
    ->     Property AS p ON b.property_id = p.property_id
    -> JOIN
    ->     Payment AS pm ON b.booking_id = pm.booking_id;


# Analyze Query Performance with EXPLAIN

mysql> EXPLAIN
    -> SELECT
    ->     b.booking_id,
    ->     b.start_date,
    ->     b.end_date,
    ->     u.user_id,
    ->     u.first_name,
    ->     u.last_name,
    ->     u.email,
    ->     p.property_id,
    ->     p.name AS property_name,
    ->     p.price_per_night,
    ->     pm.payment_id,
    ->     pm.amount,
    ->     pm.payment_date
    -> FROM
    ->     Booking AS b
    -> JOIN
    ->     User AS u ON b.user_id = u.user_id
    -> JOIN
    ->     Property AS p ON b.property_id = p.property_id
    ->
    -> JOIN
    ->     Payment AS pm ON b.booking_id = pm.booking_id;
 
 # Refactoring

 mysql> SELECT
    ->     b.booking_id,
    ->     b.start_date,
    ->     b.end_date,
    ->     u.user_id,
    ->     u.first_name,
    ->     u.last_name,
    ->     u.email,
    ->     p.property_id,
    ->     p.name AS property_name,
    ->     p.price_per_night,
    ->     pm.payment_id,
    ->     pm.amount,
    ->     pm.payment_date
    -> FROM
    ->     Booking AS b
    -> JOIN
    ->     User AS u ON b.user_id = u.user_id
    -> JOIN
    ->     Property AS p ON b.property_id = p.property_id
    -> JOIN
    ->     Payment AS pm ON b.booking_id = pm.booking_id
    -> WHERE b.booking_id = 5;