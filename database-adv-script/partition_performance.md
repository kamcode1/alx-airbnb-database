# Partitioning Performance Report

## Partitioning Approach
We implemented **RANGE partitioning** on the `booking` table, based on the `YEAR(start_date)` column. This allows MySQL to store bookings for different years in separate partitions.

## Test Query
We tested a query fetching bookings in July 2025:
```sql
SELECT * FROM booking
WHERE start_date BETWEEN '2025-07-01' AND '2025-07-31';
