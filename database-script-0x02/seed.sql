-- Insert users
INSERT INTO user (user_id, first_name, last_name, email, password_hash, role)
VALUES 
  (UUID(), 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', 'guest'),
  (UUID(), 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', 'host'),
  (UUID(), 'Clara', 'Lee', 'clara@example.com', 'hashedpassword3', 'host');

-- Insert properties
INSERT INTO property (property_id, host_id, name, description, location, price_pernight)
VALUES
  (UUID(), (SELECT user_id FROM user WHERE first_name='Bob'), 'Cozy Apartment', 'A quiet 1-bed apartment.', 'Nairobi', 40.00),
  (UUID(), (SELECT user_id FROM user WHERE first_name='Clara'), 'Beach House', 'Ocean view 2-bed villa.', 'Mombasa', 100.00);

-- Insert bookings
INSERT INTO booking (booking_id, user_id, property_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), (SELECT user_id FROM user WHERE first_name='Alice'), (SELECT property_id FROM property WHERE name='Beach House'), '2025-07-03', '2025-07-06', 300.00, 'confirmed');

-- Insert payments
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
  (UUID(), (SELECT booking_id FROM booking LIMIT 1), 300.00, 'credit_card');

-- Insert review
INSERT INTO review (review_id, user_id, property_id, rating, comment)
VALUES
  (UUID(), (SELECT user_id FROM user WHERE first_name='Alice'), (SELECT property_id FROM property WHERE name='Beach House'), 5, 'Amazing stay!');
