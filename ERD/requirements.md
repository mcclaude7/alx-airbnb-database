Entities and Their Attributes

1. User
Attributes:
user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

2. Property
Attributes:
property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

3. Booking
Attributes:
booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
total_price: DECIMAL, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

4. Payment
Attributes:
payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

5. Review
Attributes:
review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

6. Message
Attributes:
message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

Relationships Between Entities

1. User to Property

Relationship Type: One-to-Many
Description: A User (with role="host") can list multiple Properties, but each Property belongs to only one host.
Implementation: Foreign key host_id in Property table references user_id in User table.

2. User to Booking

Relationship Type: One-to-Many
Description: A User can make multiple Bookings, but each Booking is made by one User.
Implementation: Foreign key user_id in Booking table references user_id in User table.

3. User to Review

Relationship Type: One-to-Many
Description: A User can write multiple Reviews, but each Review is written by one User.
Implementation: Foreign key user_id in Review table references user_id in User table.

4. User to Message (as Sender)

Relationship Type: One-to-Many
Description: A User can send multiple Messages, but each Message has one sender.
Implementation: Foreign key sender_id in Message table references user_id in User table.

5. User to Message (as Recipient)

Relationship Type: One-to-Many
Description: A User can receive multiple Messages, but each Message has one recipient.
Implementation: Foreign key recipient_id in Message table references user_id in User table.


7. Property to Booking

Relationship Type: One-to-Many
Description: A Property can have multiple Bookings, but each Booking is for one Property.
Implementation: Foreign key property_id in Booking table references property_id in Property table.


8. Property to Review

Relationship Type: One-to-Many
Description: A Property can have multiple Reviews, but each Review is for one Property.
Implementation: Foreign key property_id in Review table references property_id in Property table.

9. Booking to Payment

Relationship Type: One-to-One
Description: Each Booking has one Payment, and each Payment is associated with one Booking.
Implementation: Foreign key booking_id in Payment table references booking_id in Booking table.

Entity Relationship Diagram

https://drive.google.com/file/d/19V4UfggxN-IzVvPN3ORzyVyegBiu9_Uf/view?usp=sharing

