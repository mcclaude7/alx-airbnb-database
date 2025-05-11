INSERT INTO Users (first_name, last_name, email, password, phone_number,role)
VALUES ('Alice', 'Johnson', 'jean@gmail.com', 'password123', '+254700111222', 'host')

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES (1, 2, '2024-06-01', '2024-06-05', 180.00, 'confirmed')

INSERT INTO Property (host_id, name, description, location, pricepernight)
VALUES
(1, 'Garden Apartment', 'A relaxing spot with garden views.', 'Kigali, Rwanda', 45000.00)

INSERT INTO Payment (booking_id, amount, payment_method)
VALUES
(1, 180.00, 'credit_card')

INSERT INTO Review (property_id, user_id, rating, comment)
VALUES
(1, 2, 4, 'Loved the garden and quiet environment.')

INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
(2, 1, 'Hi, is the garden apartment available next weekend?')