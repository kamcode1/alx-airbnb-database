# Database Performance Monitoring Report

## Tools Used
We used `EXPLAIN ANALYZE` to monitor the performance of two frequently used queries.

---

## Query 1: Confirmed bookings for a specific user
```sql
SELECT *
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com'
AND b.status = 'confirmed';

SELECT *
FROM review r
WHERE r.property_id = 'some-property-id';
