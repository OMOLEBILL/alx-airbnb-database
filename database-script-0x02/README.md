## Overview
This document provides an overview of the sample data used to populate the Airbnb Clone database. The SQL `INSERT` statements add realistic data for each key entity, including users, properties, bookings, payments, reviews, and messages. This sample data is useful for testing and validating the functionalities of the application.

## Sample Data Description

### 1. User Table
- **Purpose**: Contains sample data for users of the platform, including hosts and guests.
- **Sample Records**:
  - Alice Smith (Host)
  - Bob Johnson (Guest)
  - Charlie Brown (Guest)
  - Dana White (Host)
- **Usage**: The sample users are assigned roles as either guests or hosts, allowing for testing user-based functionalities such as property listings and bookings.

### 2. Property Table
- **Purpose**: Stores information about properties listed by hosts.
- **Sample Records**:
  - Ocean View Apartment (Miami, FL) listed by Alice Smith
  - Mountain Cabin Retreat (Asheville, NC) listed by Dana White
  - Downtown Loft (New York, NY) listed by Alice Smith
- **Usage**: These sample properties provide a range of options for testing property searches, bookings, and reviews.

### 3. Booking Table
- **Purpose**: Manages bookings made by guests for the listed properties.
- **Sample Records**:
  - Bob Johnson booked the Ocean View Apartment for December 1-5, 2024 (Confirmed)
  - Charlie Brown booked the Mountain Cabin Retreat for December 10-15, 2024 (Pending)
  - Bob Johnson booked the Downtown Loft for December 20-25, 2024 (Canceled)
- **Usage**: The sample bookings help test the booking process, status updates, and related operations.

### 4. Payment Table
- **Purpose**: Tracks payments for bookings made by guests.
- **Sample Records**:
  - Payment of $800 made by Bob Johnson for booking the Ocean View Apartment (Credit Card)
  - Payment of $750 made by Charlie Brown for booking the Mountain Cabin Retreat (PayPal)
- **Usage**: These records facilitate testing payment processing and linking payments to bookings.

### 5. Review Table
- **Purpose**: Holds reviews left by guests for properties they have stayed at.
- **Sample Records**:
  - Bob Johnson gave a 5-star review for the Ocean View Apartment: "Amazing place with a fantastic view!"
  - Charlie Brown gave a 4-star review for the Mountain Cabin Retreat: "Great cabin, very peaceful and relaxing."
- **Usage**: These reviews allow testing of the review system, including adding, viewing, and linking reviews to properties and users.

### 6. Message Table
- **Purpose**: Stores messages exchanged between users (e.g., guests and hosts).
- **Sample Records**:
  - Bob Johnson sent a message to Alice Smith about apartment availability.
  - Alice Smith replied to Bob Johnson, discussing available dates.
  - Charlie Brown asked Dana White if the cabin is pet-friendly.
- **Usage**: These sample messages provide data for testing the messaging system, including sending, receiving, and retrieving conversations between users.

## How to Use the Sample Data
- **Testing User Roles**: The sample data includes hosts and guests to test different user roles and their permissions (e.g., booking a property vs. listing a property).
- **Booking Flow**: The bookings and payments data help validate the entire booking process, from making a reservation to completing payment.
- **Review System**: Use the reviews to test how guests can leave feedback for properties, and ensure that reviews are correctly linked to bookings and properties.
- **Messaging Feature**: The messages between users can be used to verify the in-app messaging system, ensuring users can communicate effectively.

## Important Notes
- **UUIDs**: Each record is assigned a unique identifier (`UUID`) to ensure consistency and proper linking between tables.
- **Realistic Data**: The sample data reflects typical scenarios one might expect in a rental property marketplace, allowing for comprehensive testing of the core functionalities.
- **Data Integrity**: Foreign keys and constraints are used to maintain data integrity and ensure the relationships between entities are respected.
