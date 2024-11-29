-- Create an index on Booking.user_id to improve the performance of JOIN operations involving User and Booking tables
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create an index on Booking.property_id to improve the performance of JOIN operations involving Property and Booking tables
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create an index on Property.property_id to improve the performance of JOIN operations involving Property and Review tables
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Create an index on Review.property_id to improve the performance of subqueries involving property reviews
CREATE INDEX idx_review_property_id ON Review(property_id);

-- Create an index on User.user_id to improve the performance of correlated subqueries involving user bookings
CREATE INDEX idx_user_user_id ON User(user_id);

-- Create an index on Booking.start_date to improve the performance of queries filtering by booking dates
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Create an index on Property.location to improve the performance of searches involving property locations
CREATE INDEX idx_property_location ON Property(location);

-- Measure performance before adding indexes using EXPLAIN and ANALYZE

-- Measure performance before indexing for a JOIN query involving Booking and User tables
EXPLAIN ANALYZE
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

-- Measure performance before indexing for a LEFT JOIN query involving Property and Review tables
EXPLAIN ANALYZE
SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    COALESCE(Review.review_id, 'No Review') AS review_id,
    COALESCE(Review.rating, 0) AS rating,
    COALESCE(Review.comment, 'No Comments') AS comment
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id
ORDER BY 
    Property.property_id;

-- Add indexes to improve performance
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_property_location ON Property(location);

-- Measure performance after adding indexes using EXPLAIN and ANALYZE

-- Measure performance after adding indexes for a JOIN query involving Booking and User tables
EXPLAIN ANALYZE
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

-- Measure performance after adding indexes for a LEFT JOIN query involving Property and Review tables
EXPLAIN ANALYZE
SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    COALESCE(Review.review_id, 'No Review') AS review_id,
    COALESCE(Review.rating, 0) AS rating,
    COALESCE(Review.comment, 'No Comments') AS comment
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id
ORDER BY 
    Property.property_id;

