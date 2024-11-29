## Overview
This document provides a brief description of SQL queries designed to retrieve data from the Airbnb Clone database using different types of joins. The queries demonstrate the usage of `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` to handle relationships between key entities such as users, bookings, properties, and reviews.

## Queries Description

### 1. INNER JOIN: Retrieve Bookings and Users
- **Objective**: Retrieve all bookings along with the respective users who made those bookings.
- **Query Explanation**: The `INNER JOIN` is used to join the `Booking` table with the `User` table based on `user_id`. This ensures that only bookings with associated users are included in the results.

### 2. LEFT JOIN: Retrieve Properties and Reviews
- **Objective**: Retrieve all properties along with their reviews, including properties that have no reviews.
- **Query Explanation**: The `LEFT JOIN` is used to join the `Property` table with the `Review` table based on `property_id`. This allows the result to include properties that have no reviews, showing `NULL` for review-related columns where no review exists.

### 3. FULL OUTER JOIN: Retrieve All Users and All Bookings
- **Objective**: Retrieve all users and all bookings, even if a user has no booking or if a booking is not linked to a user.
- **Query Explanation**: The `FULL OUTER JOIN` is used to join the `User` table with the `Booking` table based on `user_id`. This ensures that all users and all bookings are included in the result, even if there is no direct relationship between them.

## Use Cases
- **INNER JOIN**: Useful for generating reports where only valid bookings with registered users are needed.
- **LEFT JOIN**: Helps in listing all properties along with their feedback, which is useful when displaying properties that may not have any reviews yet.
- **FULL OUTER JOIN**: Useful for comprehensive auditing purposes, where you need a complete view of both users and bookings, regardless of their association.