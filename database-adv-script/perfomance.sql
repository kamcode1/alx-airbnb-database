-- Initial query: Bookings + User + Property + Payment
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id
INNER JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'
AND u.email = 'alice@example.com';

-- Performance analysis
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id
INNER JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'confirmed'
AND u.email = 'alice@example.com';
