# Airbnb Database Schema

This directory contains the SQL schema (`schema.sql`) for the Airbnb database project.

## Contents

- `schema.sql`: SQL DDL statements to create all tables, constraints, and indexes.
- The schema reflects 3NF and includes:
  - Users
  - Properties
  - Bookings
  - Payments
  - Reviews
  - Messages

## Constraints & Features

- UUIDs as primary keys
- ENUMs for role, booking status, and payment method
- Proper foreign key relationships
- Indexes on searchable fields like email and property location
