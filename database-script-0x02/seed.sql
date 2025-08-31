INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('uuid-001', 'Chinda', 'Okoro', 'chinda@example.com', 'hashed_pw_1', '08012345678', 'host', CURRENT_TIMESTAMP),
  ('uuid-002', 'Ada', 'Nwosu', 'ada@example.com', 'hashed_pw_2', '08023456789', 'guest', CURRENT_TIMESTAMP),
  ('uuid-003', 'Tunde', 'Balogun', 'tunde@example.com', 'hashed_pw_3', '08034567890', 'guest', CURRENT_TIMESTAMP),
  ('uuid-004', 'Ngozi', 'Eze', 'ngozi@example.com', 'hashed_pw_4', '08045678901', 'host', CURRENT_TIMESTAMP);

INSERT INTO Location (location_id, city, state, country) VALUES
  ('loc-001', 'Lagos', 'Lagos State', 'Nigeria'),
  ('loc-002', 'Abuja', 'FCT', 'Nigeria'),
  ('loc-003', 'Cape Town', 'Western Cape', 'South Africa');

INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night, created_at, updated_at) VALUES
  ('prop-001', 'uuid-001', 'loc-001', 'Ocean View Apartment', 'A cozy apartment with sea view in Lekki.', 25000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-002', 'uuid-004', 'loc-002', 'City Center Loft', 'Modern loft in the heart of Abuja.', 30000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('prop-003', 'uuid-001', 'loc-003', 'Mountain Retreat', 'Peaceful retreat near Table Mountain.', 40000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('book-001', 'prop-001', 'uuid-002', '2025-09-10', '2025-09-15', 125000.00, 'confirmed', CURRENT_TIMESTAMP),
  ('book-002', 'prop-002', 'uuid-003', '2025-10-01', '2025-10-05', 120000.00, 'pending', CURRENT_TIMESTAMP),
  ('book-003', 'prop-003', 'uuid-002', '2025-11-20', '2025-11-25', 200000.00, 'confirmed', CURRENT_TIMESTAMP);

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
  ('pay-001', 'book-001', 125000.00, CURRENT_TIMESTAMP, 'credit_card'),
  ('pay-002', 'book-003', 200000.00, CURRENT_TIMESTAMP, 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('rev-001', 'prop-001', 'uuid-002', 5, 'Amazing stay! Beautiful view and clean space.', CURRENT_TIMESTAMP),
  ('rev-002', 'prop-003', 'uuid-002', 4, 'Very relaxing. Would visit again.', CURRENT_TIMESTAMP);

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('msg-001', 'uuid-002', 'uuid-001', 'Hi Chinda, is the Ocean View Apartment available next weekend?', CURRENT_TIMESTAMP),
  ('msg-002', 'uuid-001', 'uuid-002', 'Hi Ada, yes it is! Let me know if you want to book.', CURRENT_TIMESTAMP),
  ('msg-003', 'uuid-003', 'uuid-004', 'Hello Ngozi, I have a question about the City Center Loft.', CURRENT_TIMESTAMP);
