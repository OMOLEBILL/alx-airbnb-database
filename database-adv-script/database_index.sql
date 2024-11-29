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
