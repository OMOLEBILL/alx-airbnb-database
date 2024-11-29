# Airbnb Clone Database Schema

## Overview
This document provides an overview of the SQL schema for the Airbnb Clone application. The schema consists of six key tables that support the core functionalities of the platform, including user management, property listings, bookings, payments, reviews, and messaging.

## Key Tables

### 1. User Table
- **Attributes**: Stores information about users, including their ID, name, email, password hash, phone number, role (guest, host, admin), and account creation time.
- **Indexes**: An index on the `email` column ensures fast lookup and uniqueness checks.

### 2. Property Table
- **Attributes**: Contains details of properties listed by hosts, including the property ID, host ID, name, description, location, price per night, and timestamps for creation and updates.
- **Indexes**: An index on the `host_id` optimizes queries for properties owned by a specific host.

### 3. Booking Table
- **Attributes**: Manages property bookings by guests, storing booking ID, property ID, user ID, booking dates, status, and creation time.
- **Indexes**: Indexes on `property_id` and `user_id` are created to speed up booking-related queries.

### 4. Payment Table
- **Attributes**: Tracks payments for bookings, including payment ID, booking ID, amount, payment date, and payment method (credit card, PayPal, Stripe).
- **Indexes**: An index on `booking_id` is added for efficient payment retrievals related to bookings.

### 5. Review Table
- **Attributes**: Holds reviews left by users on properties, with attributes like review ID, property ID, user ID, rating, comment, and creation timestamp.
- **Indexes**: Indexes on `property_id` and `user_id` facilitate efficient lookups for property reviews and user reviews.

### 6. Message Table
- **Attributes**: Stores messages exchanged between users, including message ID, sender ID, recipient ID, message body, and timestamp.
- **Indexes**: Indexes on `sender_id` and `recipient_id` enable quick access to messages sent or received by specific users.

## Constraints and Relationships
- **Primary Keys**: Each table has a primary key (`user_id`, `property_id`, `booking_id`, etc.) to uniquely identify each record.
- **Foreign Keys**: Relationships between tables are established through foreign keys. For instance, `host_id` in the Property table references `user_id` in the User table.
- **Constraints**: Includes checks like ensuring `rating` values are between 1 and 5 in the Review table and maintaining referential integrity between related tables.

## Performance Considerations
- **Indexes**: Indexes are used to optimize the performance of frequently queried columns, particularly those involved in relationships or used in search operations.
- **Normalization**: The database has been normalized to eliminate redundancy and ensure data integrity.


