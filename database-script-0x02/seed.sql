-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-1', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_1', '1234567890', 'host', CURRENT_TIMESTAMP),
('uuid-2', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_2', '0987654321', 'guest', CURRENT_TIMESTAMP),
('uuid-3', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password_3', '1122334455', 'guest', CURRENT_TIMESTAMP),
('uuid-4', 'Dana', 'White', 'dana.white@example.com', 'hashed_password_4', '2233445566', 'host', CURRENT_TIMESTAMP);

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('prop-1', 'uuid-1', 'Ocean View Apartment', 'A beautiful apartment with ocean views.', 'Miami, FL', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('prop-2', 'uuid-4', 'Mountain Cabin Retreat', 'Cozy cabin in the mountains, perfect for a weekend getaway.', 'Asheville, NC', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('prop-3', 'uuid-1', 'Downtown Loft', 'Modern loft in the heart of downtown.', 'New York, NY', 300.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
('booking-1', 'prop-1', 'uuid-2', '2024-12-01', '2024-12-05', 'confirmed', CURRENT_TIMESTAMP),
('booking-2', 'prop-2', 'uuid-3', '2024-12-10', '2024-12-15', 'pending', CURRENT_TIMESTAMP),
('booking-3', 'prop-3', 'uuid-2', '2024-12-20', '2024-12-25', 'canceled', CURRENT_TIMESTAMP);

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('payment-1', 'booking-1', 800.00, CURRENT_TIMESTAMP, 'credit_card'),
('payment-2', 'booking-2', 750.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('review-1', 'prop-1', 'uuid-2', 5, 'Amazing place with a fantastic view!', CURRENT_TIMESTAMP),
('review-2', 'prop-2', 'uuid-3', 4, 'Great cabin, very peaceful and relaxing.', CURRENT_TIMESTAMP);

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg-1', 'uuid-2', 'uuid-1', 'Hi Alice, I have a question about the apartment availability.', CURRENT_TIMESTAMP),
('msg-2', 'uuid-1', 'uuid-2', 'Hi Bob, sure! Let me know what dates you are interested in.', CURRENT_TIMESTAMP),
('msg-3', 'uuid-3', 'uuid-4', 'Hi Dana, is the cabin pet-friendly?', CURRENT_TIMESTAMP);
