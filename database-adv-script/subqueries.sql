mysql> SELECT
    ->     p.property_id,
    ->     p.name,
    ->     p.location,
    ->     avg_rating
    -> FROM
    ->     Property AS p
    -> JOIN
    ->     (SELECT property_id, AVG(rating) AS avg_rating
    ->      FROM Review
    ->      GROUP BY property_id
    ->      HAVING AVG(rating) > 4.0) AS subquery
    -> ON p.property_id = subquery.property_id;

mysql> SELECT
    ->     u.user_id,
    ->     u.first_name,
    ->     u.last_name,
    ->     u.email
    -> FROM
    ->     User AS u
    -> WHERE
    ->     (SELECT COUNT(*)
    ->      FROM Booking AS b
    ->      WHERE b.user_id = u.user_id) > 3;

