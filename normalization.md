# Database Normalization Analysis

## Original Schema Overview

My database schema represents a property booking system with the following entities:
1. User: System users (guests and hosts)
2. Property: Listings available for booking
3. Booking: Records of property reservations
4. Message: Communications between users
5. Payment: Transaction records for bookings
6. Review: User feedback on properties

## Normalization Analysis

1. First Normal Form (1NF)

All tables in the schema are already in 1NF because:
- All attributes contain atomic (indivisible) values
- Each column contains only one value per row
- There are no repeating groups or arrays

2. Second Normal Form (2NF)

All tables are in 2NF because:
- They are in 1NF
- All non-key attributes are fully dependent on their primary keys
- There are no partial dependencies 

3. Third Normal Form (3NF)

All tables are already in 3NF because:
- They are in 2NF
- There are no transitive dependencies 

## Table-by-Table Analysis

1. User Table

- PK: user_id
- All attributes directly depend on user_id
- No transitive dependencies detected

2. Property Table

- PK: property_id
- FK: host_id (references user_id)
- All attributes directly depend on property_id
- No transitive dependencies detected

3. Booking Table

- PK: booking_id
- FK: property_id, user_id
- All attributes directly depend on booking_id
- No transitive dependencies detected

4. Message Table

- PK: message_id
- FK: sender_id, recipient_id (both reference user_id)
- All attributes directly depend on message_id
- No transitive dependencies detected

5. Payment Table

- PK: payment_id
- FK: booking_id
- All attributes directly depend on payment_id
- No transitive dependencies detected

6. Review Table

- PK: review_id
- FK: property_id, user_id
- All attributes directly depend on review_id
- No transitive dependencies detected


## Additional Observations

1. Proper Primary Key Design: Each table has a unique identifier as its primary key.
2. Foreign Key Relationships: Foreign keys are properly implemented to establish relationships between tables.
3. No Redundant Data: The schema avoids storing the same information in multiple places.
4. Appropriate Attribute Placement: Attributes are located in tables where they logically belong.

## Conclusion

My database schema is well normalized to the Third Normal Form (3NF). No changes are required as the current design:
- Has no partial dependencies
- Has no transitive dependencies
- Minimizes data redundancy
- Maintains data integrity through proper relationships
