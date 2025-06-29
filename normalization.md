# Normalization Steps for AirBnB Database Design

This document outlines the normalization process applied to the database design for an AirBnB-like platform. The goal is to ensure that all entities comply with the Third Normal Form (3NF) to eliminate redundancy and improve data integrity.

---

## ✅ First Normal Form (1NF)

**Rule:**  
Each column must contain atomic values, and each row must be uniquely identifiable.

**Applied:**  
- All tables use atomic columns (e.g., `phone_number`, `message_body`, `description`).
- No repeating groups or multi-valued fields.
- Every table has a primary key to uniquely identify rows.

**Conclusion:**  
The design satisfies 1NF.

---

## ✅ Second Normal Form (2NF)

**Rule:**  
All non-key attributes must depend on the whole primary key.

**Applied:**  
- All tables use simple primary keys (UUID-based), not composite keys.
- Every non-key attribute is fully dependent on the table’s primary key.

**Conclusion:**  
Because there are no partial dependencies (no composite keys), the design is in 2NF.

---

## ✅ Third Normal Form (3NF)

**Rule:**  
All non-key attributes must depend **only on the primary key**, not on other non-key attributes (no transitive dependencies).

**Applied:**  
- No non-key attribute depends on another non-key attribute in any table.
- Fields like `payment_method`, `total_price`, and `role` are directly tied to their respective primary keys (`payment_id`, `booking_id`, `user_id`).
- The `Message` table represents a many-to-many user interaction (sender ↔ recipient), but all non-key fields (`message_body`, `sent_at`) depend only on `message_id`. This satisfies 3NF.

**Conclusion:**  
No transitive dependencies exist. All tables meet 3NF.

---

## 🧾 Final Note on Many-to-Many Relationships

While conceptual relationships like messaging involve many-to-many interactions, these are correctly implemented using dedicated tables (`Message`) with foreign keys and atomic fields. These tables also follow 3NF.

---

## ✅ Conclusion

The current AirBnB database design satisfies:
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

No schema changes were necessary, as the initial design was already normalized up to 3NF.
