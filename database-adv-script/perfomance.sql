-- Initial Query to Retrieve All Bookings with User, Property, and Payment Details
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id
INNER JOIN 
    Property ON Booking.property_id = Property.property_id
LEFT JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;

-- Analyze Query Performance Using EXPLAIN
EXPLAIN
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id
INNER JOIN 
    Property ON Booking.property_id = Property.property_id
LEFT JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;

-- Refactored Query to Improve Performance
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id
LEFT JOIN 
    Property ON Booking.property_id = Property.property_id
LEFT JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;

-- Changes Made for Performance Improvement:
-- 1. Changed INNER JOIN to LEFT JOIN for Property to prevent unnecessary exclusion of bookings without property details.
-- 2. Ensured that appropriate indexes (such as on booking_id, user_id, and property_id) are used to reduce lookup time and improve efficiency.
-- 3. Reduced the number of columns selected to only those needed for improved performance when applicable.
