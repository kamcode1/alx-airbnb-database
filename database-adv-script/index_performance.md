# Index Performance Report

## High-usage columns identified:
- `user.email`
- `booking.user_id`
- `booking.property_id`
- `property.host_id`
- `property.location`

## Indexes created:
```sql
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_property_host_id ON property(host_id);
CREATE INDEX idx_property_location ON property(location);

EXPLAIN ANALYZE
SELECT *
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com';


✅ Save this file and make sure it’s not empty.

---

✅ **2. SQL file with CREATE INDEX commands**
- Create a SQL file at:  
  `database-adv-script/database_index.sql`

📄 Example content:
```sql
-- Create indexes
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_property_host_id ON property(host_id);
CREATE INDEX idx_property_location ON property(location);

-- Measure query performance after indexing
EXPLAIN ANALYZE
SELECT *
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com';
