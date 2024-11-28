# Normalizing the Airbnb Clone Database to 3NF

## Objective
The goal is to apply normalization principles to ensure the Airbnb Clone database design is in **Third Normal Form (3NF)**, thereby minimizing data redundancy and enhancing data integrity. Below, we review the initial schema, identify potential violations, and adjust the database design to achieve 3NF.

## Initial Review
The initial schema consists of six key entities:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**


### Normalization Steps to Achieve 3NF

#### 1. **User Entity**
- **Initial Attributes**: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`
- **Analysis**:
  - Each attribute is functionally dependent on the primary key (`user_id`).
  - No transitive dependencies are present.
- **Conclusion**: The `User` entity already adheres to 3NF.

#### 2. **Property Entity**
- **Initial Attributes**: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`
- **Analysis**:
  - All attributes are functionally dependent on the primary key (`property_id`).
  - No partial or transitive dependencies exist.
- **Conclusion**: The `Property` entity is in 3NF.

#### 3. **Booking Entity**
- **Initial Attributes**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`
- **Analysis**:
  - `total_price` can be calculated from `pricepernight` in the `Property` entity and `start_date`/`end_date`.
  - To achieve 3NF, derived data should not be stored to avoid redundancy.
- **Adjustment**:
  - **Remove `total_price`** from the `Booking` entity to avoid redundancy. Instead, calculate the `total_price` when needed based on the duration of the booking and the `pricepernight` of the property.

#### 4. **Payment Entity**
- **Initial Attributes**: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`
- **Analysis**:
  - Each attribute is functionally dependent on the primary key (`payment_id`).
  - No transitive dependencies are present.
- **Conclusion**: The `Payment` entity is in 3NF.

#### 5. **Review Entity**
- **Initial Attributes**: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`
- **Analysis**:
  - All attributes are functionally dependent on the primary key (`review_id`).
  - No partial or transitive dependencies exist.
- **Conclusion**: The `Review` entity is in 3NF.

#### 6. **Message Entity**
- **Initial Attributes**: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`
- **Analysis**:
  - All attributes are functionally dependent on the primary key (`message_id`).
  - No partial or transitive dependencies exist.
- **Conclusion**: The `Message` entity is in 3NF.

## Final Adjusted Schema
Below is the final adjusted schema after normalization to 3NF:

### **User**
- `user_id` (Primary Key, UUID, Indexed)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **Property**
- `property_id` (Primary Key, UUID, Indexed)
- `host_id` (Foreign Key, references User(user_id))
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### **Booking**
- `booking_id` (Primary Key, UUID, Indexed)
- `property_id` (Foreign Key, references Property(property_id))
- `user_id` (Foreign Key, references User(user_id))
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **Payment**
- `payment_id` (Primary Key, UUID, Indexed)
- `booking_id` (Foreign Key, references Booking(booking_id))
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

### **Review**
- `review_id` (Primary Key, UUID, Indexed)
- `property_id` (Foreign Key, references Property(property_id))
- `user_id` (Foreign Key, references User(user_id))
- `rating` (INTEGER, CHECK rating >= 1 AND rating <= 5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### **Message**
- `message_id` (Primary Key, UUID, Indexed)
- `sender_id` (Foreign Key, references User(user_id))
- `recipient_id` (Foreign Key, references User(user_id))
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## Summary of Changes
- **Booking Entity**: Removed the `total_price` attribute to avoid storing derived data, ensuring the entity adheres to 3NF principles.
