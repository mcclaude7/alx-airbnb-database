mysql> SELECT
    ->     u.user_id,
    ->     u.first_name,
    ->     u.last_name,
    ->     COUNT(b.booking_id) AS total_bookings
    -> FROM
    ->     User AS u
    -> LEFT JOIN
    ->     Booking AS b ON u.user_id = b.user_id
    -> GROUP BY
    ->     u.user_id, u.first_name, u.last_name
    -> ORDER BY
    ->     total_bookings DESC;

mysql> SELECT
    ->     p.property_id,
    ->     p.name AS property_name,
    ->     total_bookings,
    ->     booking_rank,
    ->     ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num
    -> FROM (
    ->     SELECT
    ->         p.property_id,
    ->         p.name AS property_name,
    ->         COUNT(bk.booking_id) AS total_bookings,
    ->         RANK() OVER (ORDER BY COUNT(bk.booking_id) DESC) AS booking_rank
    ->     FROM
    ->         Property AS p
    ->     LEFT JOIN
    ->         Booking AS bk ON p.property_id = bk.property_id
    ->     GROUP BY
    ->         p.property_id, p.name
    -> ) AS ranked_properties
    -> ORDER BY
    ->     booking_rank ASC, row_num ASC;

