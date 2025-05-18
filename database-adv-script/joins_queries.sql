# INNER JOIN
select b.booking_id, b.start_date, b.end_date, b.total_price, u.user_id, u.first_name, u.last_name, u.email from booking as b INNER JOIN user as u ON b.user_id = u.user_id;

# LEFT JOIN

 SELECT p.property_id, p.name AS property_name, r.review_id, r.rating, r.comment, u.first_name AS reviewer_first_name,u.last_name AS reviewer_last_name FROM Property AS p LEFT JOIN Review AS r ON p.property_id = r.property_id LEFT JOIN  User AS u ON r.user_id = u.user_id;\

# FULL OUTER JOIN

SELECT u.user_id, u.first_name, u.last_name, b.booking_id, b.start_date, b.end_date FROM User AS u FULL OUTER JOIN  Booking AS b ON u.user_id = b.user_id;
