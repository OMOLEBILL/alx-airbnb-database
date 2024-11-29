-- Query using INNER JOIN to retrieve all bookings and the respective users who made those bookings
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

-- Query using LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
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
    Review ON Property.property_id = Review.property_id;

-- Query using FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status
FROM 
    User
FULL OUTER JOIN 
    Booking ON User.user_id = Booking.user_id;
