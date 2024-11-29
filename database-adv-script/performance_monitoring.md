## Overview
This document provides a summary of the ongoing efforts to monitor and refine the performance of the Airbnb Clone database by analyzing query execution plans and making adjustments to the database schema. The goal is to continuously improve query execution times and optimize the overall efficiency of the database.

## Performance Monitoring Tools
To monitor query performance, the following SQL commands were used:

### 1. **SHOW PROFILE**
- **Purpose**: To obtain detailed information about the execution stages of a query.
- **Usage**: This command was used to analyze the stages of frequently used queries and identify which parts of the query took the longest to execute.
- **Findings**: Identified bottlenecks related to full table scans on the `Booking` table, particularly when filtering by `start_date`.

### 2. **EXPLAIN ANALYZE**
- **Purpose**: To provide insights into the execution plan of queries, including the cost and performance of each step.
- **Usage**: `EXPLAIN ANALYZE` was used to measure the performance of key queries before and after implementing partitioning and indexing.
- **Findings**: Revealed that queries without partitioning required full table scans, leading to high execution costs.

## Bottlenecks Identified
1. **Full Table Scans**
   - Queries filtering bookings by `start_date` had to perform full table scans, resulting in slower response times.
2. **Lack of Efficient Indexing**
   - The absence of proper indexing on high-usage columns, such as `start_date`, led to inefficient lookups and increased I/O costs.

## Schema Adjustments Implemented
### 1. **Partitioning the Booking Table**
- **Partitioning Strategy**: The `Booking` table was partitioned by **RANGE** on the `start_date` column.
- **Benefit**: Partitioning reduced the number of rows scanned during queries that filter by `start_date`. This led to improved query performance, especially for large datasets.

### 2. **Adding Indexes to Partitions**
- **Indexing on Partitions**: Created indexes on the `start_date` column for each partition.
- **Benefit**: The indexes allowed the database engine to quickly locate rows in the appropriate partition, further reducing query execution time.

## Performance Improvements Observed
### 1. Faster Query Execution Time
- The use of `EXPLAIN ANALYZE` showed a significant reduction in query execution time after partitioning the `Booking` table and adding indexes.
- Queries that previously required full table scans now only scan relevant partitions, leading to faster execution.

### 2. Reduced Resource Utilization
- **I/O Operations**: Partitioning reduced the number of rows scanned during queries, resulting in fewer I/O operations and better use of system resources.
- **CPU Usage**: The database was able to allocate fewer CPU resources to queries, as each query now processes a smaller subset of data.

## Recommendations for Future Improvements
1. **Monitor Query Performance Regularly**
   - Continuously use `SHOW PROFILE` and `EXPLAIN ANALYZE` to monitor query performance and identify any new bottlenecks as the dataset grows.

2. **Consider Additional Partitioning**
   - As the dataset continues to expand, consider further partitioning the `Booking` table by year or other criteria to maintain optimal performance.

3. **Add Indexes to Frequently Queried Columns**
   - Monitor the most frequently queried columns and consider adding indexes to further improve lookup times, especially for complex joins.

