# Entity-Relationship Diagram – AirBnB Clone

This ER diagram outlines the database design for an AirBnB-like platform. It includes six main entities (User, Property, Booking, Payment, Review, and Message) and their relationships, attributes, and constraints. The design supports key functionality such as property listings, bookings, payments, reviews, and messaging.

---

## Entities and Attributes

### **User**
- `user_id` (PK, UUID)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT)

### **Property**
- `property_id` (PK, UUID)
- `host_id` (FK → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `price_pernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT)
- `updated_at` (TIMESTAMP, ON UPDATE)

### **Booking**
- `booking_id` (PK, UUID)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at` (TIMESTAMP, DEFAULT)

### **Payment**
- `payment_id` (PK, UUID)
- `booking_id` (FK → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_method` (ENUM: credit_card, paypal, stripe)
- `payment_date` (TIMESTAMP, DEFAULT)

### **Review**
- `review_id` (PK, UUID)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `rating` (INTEGER, CHECK: 1–5)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT)

### **Message**
- `message_id` (PK, UUID)
- `sender_id` (FK → User.user_id)
- `recipient_id` (FK → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT)

---

## Relationship Summary

- A **User** can host many **Properties** (Optional → Mandatory)
- A **User** can make many **Bookings** (Optional → Mandatory)
- A **Property** can be booked many times (Optional → Mandatory)
- A **Booking** can have one **Payment** (Optional → Mandatory)
- A **User** can leave multiple **Reviews** on **Properties**
- A **Message** always has a sender and recipient (Mandatory)

---

## Diagram File

The ER diagram is available in this directory as `airbnb_erd.drawio`.  
Preview image (optional): `airbnb_erd.png`
