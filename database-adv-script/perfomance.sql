-- 1. Initial Query,
-- Retrieve every booking with its user, property, and payment details in one go:

EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name       AS property_name,
  p.location_id,
  pay.payment_id,
  pay.amount,
  pay.payment_date,
  pay.payment_method
FROM Booking AS b
INNER JOIN "User"     AS u   ON b.user_id     = u.user_id
INNER JOIN Property   AS p   ON b.property_id = p.property_id
INNER JOIN Payment    AS pay ON b.booking_id  = pay.booking_id;

-- Refactoring for Performance
-- Add Indexes on Join Columns

CREATE INDEX idx_booking_user     ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_payment_booking  ON Payment(booking_id);

-- Re-run with Indexes

EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name       AS property_name,
  p.location_id,
  pay.payment_id,
  pay.amount,
  pay.payment_date,
  pay.payment_method
FROM Booking AS b
INNER JOIN "User"   AS u   ON b.user_id     = u.user_id
INNER JOIN Property AS p   ON b.property_id = p.property_id
INNER JOIN Payment  AS pay ON b.booking_id  = pay.booking_id;

-- 