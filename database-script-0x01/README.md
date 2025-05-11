# Property Booking System Database

A simple database schema for a property rental platform (Airbnb clone).

## Tables

User: Stores user profiles (guests and hosts)
Property: Contains rental property listings
Booking: Records property reservations
Payment: Tracks payment transactions
Review: Stores user feedback on properties
Message: Enables communication between users

## Key Features

Normalized database design (3NF)
Proper relationships between tables
Support for multiple user roles
Basic indexing for better performance

## Entity Relationships

Users can be both guests and hosts
Properties are listed by hosts
Bookings connect guests to properties
Payments are linked to bookings
Reviews are tied to properties and users
Messages allow communication between users