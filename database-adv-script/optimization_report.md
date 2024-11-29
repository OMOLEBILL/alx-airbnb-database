## Overview
This document provides an overview of the steps taken to refactor a complex SQL query in order to improve performance for the Airbnb Clone database. The original query retrieved bookings along with user details, property details, and payment details. After analyzing the performance, several modifications were made to optimize query execution and reduce response time.

## Initial Query
The initial query used multiple `INNER JOIN` and `LEFT JOIN` clauses to combine data from the `Booking`, `User`, `Property`, and `Payment` tables. This query was designed to fetch all relevant details related to bookings, users, properties, and payments.

### Initial Query Issues
- **Unnecessary Inner Joins**: The `INNER JOIN` on the `Property` table caused bookings without property information to be excluded. This resulted in fewer rows and increased complexity in scenarios where properties may not have been fully populated.
- **Lack of Indexing**: The initial query lacked efficient indexing, which caused slower performance, especially on large datasets.
- **Full Data Retrieval**: The initial query retrieved all columns, even when not all were required, leading to unnecessary data being transferred.

## Performance Analysis Using EXPLAIN
The `EXPLAIN` statement was used to analyze the execution plan for the query. The analysis highlighted inefficiencies such as full table scans, which indicated a need for better indexing and more efficient join strategies.

## Refactoring Changes
### 1. Replaced INNER JOIN with LEFT JOIN
- **Change**: The `INNER JOIN` on the `Property` table was changed to a `LEFT JOIN`.
- **Reason**: To ensure that all bookings are retrieved, even if there is no corresponding property record. This reduced the risk of excluding bookings that might not yet be associated with a property.

### 2. Added Indexes for High-Usage Columns
- **Indexes Added**: Indexes were added for columns commonly used in joins (`booking_id`, `user_id`, `property_id`), improving lookup times and reducing the need for full table scans.
- **Impact**: By adding indexes, the database can use index scans instead of full table scans, resulting in faster query execution.

### 3. Reduced Column Selection
- **Change**: Limited the columns selected to only those needed for the final result.
- **Reason**: This helps minimize the data being processed and transferred, which improves performance when large tables are involved.

## Final Refactored Query
The refactored query now uses more efficient join strategies and ensures that all necessary rows are included without unnecessary exclusions.

- **LEFT JOIN**: Used for `Property` and `Payment` tables to ensure all bookings are included, regardless of whether they are fully linked to properties or have associated payments.
- **Indexes**: Improved indexing ensures that the database engine can quickly locate rows, resulting in faster response times for the query.

## Measuring Performance Improvement
To confirm the improvement, `EXPLAIN ANALYZE` was used to measure query performance before and after refactoring. The key improvements observed were:
- **Reduced Query Cost**: The cost of executing the query was significantly reduced.
- **Faster Execution Time**: Queries that previously used full table scans were converted to index scans, reducing the overall execution time.

## Summary
The refactoring of the SQL query led to notable improvements in efficiency:
- **Query Execution Time** was reduced by using `LEFT JOIN` instead of `INNER JOIN` where appropriate.
- **Indexes** were added to key columns to optimize join performance and reduce the cost of lookups.
- **Reduced Data Volume** by selecting only the necessary columns, minimizing the amount of data processed.
