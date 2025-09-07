-- 1) INNER JOIN: All bookings with their booking users
SELECT
  b.booking_id,
  b.property_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email
FROM Booking AS b
INNER JOIN "User" AS u
  ON b.user_id = u.user_id;

-- 2) LEFT JOIN: All properties and any reviews (properties without reviews still show up)
SELECT
  p.property_id,
  p.name,
  p.location,
  r.review_id,
  r.user_id    AS reviewer_id,
  r.rating,
  r.comment
FROM Property AS p
LEFT JOIN Review AS r
  ON p.property_id = r.property_id;

-- 3) FULL OUTER JOIN: All users and all bookings, including unmatched rows
SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  b.booking_id,
  b.property_id,
  b.start_date,
  b.end_date,
  b.total_price
FROM "User" AS u
FULL OUTER JOIN Booking AS b
  ON u.user_id = b.user_id;
