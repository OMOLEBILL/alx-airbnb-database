
# Airbnb Clone Entity Relationship Diagram (ERD)

This document provides an overview of the Entity Relationship Diagram (ERD) for the Airbnb Clone backend. The ERD captures the relationships between the main entities, highlighting how data flows across users, properties, bookings, reviews, messages, and payments.

![Airbnb Clone ERD](/ERD/entityRelation.png)

## Diagram Overview

### User Entity
- **Attributes**: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
- **Relationships**: Users can act as hosts for properties or make bookings. They also send and receive messages, and write reviews for properties.

### Property Entity
- **Attributes**: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`.
- **Relationships**: Properties are managed by hosts (users). They can have associated bookings made by guests and receive reviews.

### Booking Entity
- **Attributes**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`.
- **Relationships**: Bookings are linked to properties and users (guests). They also have associated payments.

### Payment Entity
- **Attributes**: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`.
- **Relationships**: Payments are linked to specific bookings, ensuring that each booking is properly accounted for.

### Review Entity
- **Attributes**: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`.
- **Relationships**: Reviews are linked to properties and users (guests). A property can have multiple reviews, and each review is written by a user.

### Message Entity
- **Attributes**: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`.
- **Relationships**: Messages are linked to users. A user can send and receive messages, allowing communication between guests and hosts.

## Explanation of Relationships
- **One-to-Many Relationships** (`1:N`): The arrows with a circle at one end and a crow's foot at the other represent one-to-many relationships.
  - Example: A `User` (acting as a host) can have many `Properties`, but each property has only one host.

- **Foreign Key Relationships**: Each relationship shown in the diagram is based on foreign key constraints, linking primary keys from one entity to relevant records in another.
