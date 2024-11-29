## Overview
This document provides an overview of the indexing strategy used to improve the performance of the Airbnb Clone database. The indexes are created on high-usage columns in key tables, such as `User`, `Booking`, and `Property`, to optimize query performance for common operations like `JOIN`, `WHERE`, and `ORDER BY` clauses.

## Identified Indexes

### 1. Booking Table
- **`user_id` Index (`idx_booking_user_id`)**:
  - **Purpose**: Improves performance of `JOIN` operations involving the `Booking` and `User` tables, especially when retrieving booking details along with user information.
- **`property_id` Index (`idx_booking_property_id`)**:
  - **Purpose**: Enhances the efficiency of `JOIN` operations involving the `Booking` and `Property` tables, making it faster to look up bookings for specific properties.
- **`start_date` Index (`idx_booking_start_date`)**:
  - **Purpose**: Optimizes queries that filter bookings by date, such as searching for bookings within a specific date range.

### 2. Property Table
- **`property_id` Index (`idx_property_property_id`)**:
  - **Purpose**: Improves the performance of `JOIN` operations involving the `Property` and `Review` tables, enabling faster retrieval of property reviews.
- **`location` Index (`idx_property_location`)**:
  - **Purpose**: Enhances the performance of queries that filter properties by location, supporting efficient location-based searches.

### 3. Review Table
- **`property_id` Index (`idx_review_property_id`)**:
  - **Purpose**: Optimizes the performance of subqueries involving property reviews, especially when calculating average ratings for properties.

### 4. User Table
- **`user_id` Index (`idx_user_user_id`)**:
  - **Purpose**: Improves the performance of correlated subqueries involving user bookings, enabling efficient lookups of bookings made by specific users.

## Measuring Query Performance
To measure the effectiveness of the indexes, use the `EXPLAIN` or `ANALYZE` command to analyze query execution plans before and after creating the indexes.

### Example: Using `EXPLAIN`
- **Before Adding Indexes**:
  ```sql
  EXPLAIN SELECT * FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;
  ```
  - This command will provide information about the execution plan, including the estimated cost and the method used to access rows (e.g., sequential scan).

- **After Adding Indexes**:
  ```sql
  EXPLAIN SELECT * FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;
  ```
  - After adding the index, the `EXPLAIN` output should show a reduced cost and potentially a change to an index scan, indicating improved performance.

