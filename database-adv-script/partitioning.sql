-- Step 1: Create a new partitioned table for Booking
CREATE TABLE Booking_Partitioned (
    booking_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions based on start_date
CREATE TABLE Booking_Partition_2024_1 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-01-01') TO ('2024-03-31');

CREATE TABLE Booking_Partition_2024_2 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-04-01') TO ('2024-06-30');

CREATE TABLE Booking_Partition_2024_3 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-07-01') TO ('2024-09-30');

CREATE TABLE Booking_Partition_2024_4 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-10-01') TO ('2024-12-31');

-- Step 3: Index on start_date for each partition to optimize query performance
CREATE INDEX idx_booking_partition_2024_1_start_date ON Booking_Partition_2024_1(start_date);
CREATE INDEX idx_booking_partition_2024_2_start_date ON Booking_Partition_2024_2(start_date);
CREATE INDEX idx_booking_partition_2024_3_start_date ON Booking_Partition_2024_3(start_date);
CREATE INDEX idx_booking_partition_2024_4_start_date ON Booking_Partition_2024_4(start_date);

-- Step 4: Test performance of a query on the partitioned table
EXPLAIN ANALYZE
SELECT 
    booking_id,
    start_date,
    end_date,
    status
FROM 
    Booking_Partitioned
WHERE 
    start_date BETWEEN '2024-01-01' AND '2024-03-31'
    AND status = 'confirmed';
