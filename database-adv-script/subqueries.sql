-- Non-correlated subquery to find all properties where the average rating is greater than 4.0
SELECT 
    Property.property_id,
    Property.name,
    Property.location
FROM 
    Property
WHERE 
    (SELECT AVG(rating) FROM Review WHERE Review.property_id = Property.property_id) > 4.0;

-- Correlated subquery to find users who have made more than 3 bookings
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    User
WHERE 
    (SELECT COUNT(*) FROM Booking WHERE Booking.user_id = User.user_id) > 3;
