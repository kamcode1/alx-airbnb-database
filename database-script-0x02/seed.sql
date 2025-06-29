-- Insert users
INSERT INTO users (user_id, name, email, password, role)
VALUES 
  (gen_random_uuid(), 'Alice Johnson', 'alice@example.com', 'hashedpassword1', 'guest'),
  (gen_random_uuid(), 'Bob Smith', 'bob@example.com', 'hashedpassword2', 'host'),
  (gen_random_uuid(), 'Clara Lee', 'clara@example.com', 'hashedpassword3', 'host');

-- Insert properties
INSERT INTO properties (property_id, host_id, title, description, location, price_per_night, available_from, available_to)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE name='Bob Smith'), 'Cozy Apartment', 'A quiet 1-bed apartment.', 'Nairobi', 40.00, '2025-07-01', '2025-07-31'),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE name='Clara Lee'), 'Beach House', 'Ocean view 2-bed villa.', 'Mombasa', 100.00, '2025-07-01', '2025-08-15');

-- Insert bookings
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE name='Alice Johnson'), (SELECT property_id FROM properties WHERE title='Beach House'), '2025-07-03', '2025-07-06', 'confirmed');

-- Insert payments
INSERT INTO payments (payment_id, booking_id, amount, status, payment_date)
VALUES
  (gen_random_uuid(), (SELECT booking_id FROM bookings LIMIT 1), 300.00, 'completed', '2025-07-01');

-- Insert review
INSERT INTO reviews (review_id, user_id, property_id, rating, comment, created_at)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE name='Alice Johnson'), (SELECT property_id FROM properties WHERE title='Beach House'), 5, 'Amazing stay!', now());
