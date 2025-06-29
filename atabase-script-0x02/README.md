# Airbnb Clone – Seeding Script

This script populates the database with realistic sample data to simulate user interactions.

## Entities Seeded

- **Users:** 3 (1 guest, 2 hosts)
- **Properties:** 2 listings tied to hosts
- **Bookings:** 1 confirmed booking made by the guest
- **Payments:** 1 completed payment
- **Reviews:** 1 guest review on a property

## Usage

Run the script in your SQL environment:

```bash
psql -U youruser -d yourdatabase -f seed.sql
