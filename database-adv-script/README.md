# SQL Joins – Complex Query Practice

This task demonstrates how to write complex SQL queries using different types of joins to retrieve meaningful data from multiple tables in a relational database.

## Objective

To practice and master SQL joins by writing queries that use:
- INNER JOIN
- LEFT JOIN
- FULL OUTER JOIN

Each query is designed to handle a specific use case based on an Airbnb-style database schema.

---

## Queries

### 1. INNER JOIN
Retrieve all bookings and the respective users who made those bookings. Only includes bookings that are linked to an existing user.

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b
INNER JOIN 
    User u
ON 
    b.user_id = u.user_id;


## Advanced Queries

This section includes two advanced SQL queries that demonstrate how to use subqueries to retrieve meaningful insights from the database:

- **Find all properties where the average rating is greater than 4.0**
- **Find all users who have made more than 3 bookings**

Both queries use subqueries — one with aggregation and one correlated — to analyze data across related tables.

### Query

The following query retrieves all properties where the average rating of reviews is greater than 4.0. It uses a subquery with `GROUP BY` and `HAVING` to calculate the average rating for each property and filters for properties that meet the condition:

```sql
SELECT * 
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);
