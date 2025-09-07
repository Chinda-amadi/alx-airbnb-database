-- 1) Total Bookings per User (Aggregation + GROUP BY)
SELECT
  u.user_id,
  u.first_name,
  u.last_name,
  COUNT(b.booking_id) AS total_bookings
FROM "User" AS u
LEFT JOIN Booking AS b
  ON u.user_id = b.user_id
GROUP BY
  u.user_id,
  u.first_name,
  u.last_name
ORDER BY
  total_bookings DESC;

-- 2) Rank Properties by Number of Bookings (Window Function + Subquery)
WITH booking_counts AS (
  SELECT
    property_id,
    COUNT(*) AS total_bookings
  FROM Booking
  GROUP BY property_id
)
SELECT
  p.property_id,
  p.name,
  bc.total_bookings,
  RANK() OVER (ORDER BY bc.total_bookings DESC) AS booking_rank
FROM booking_counts AS bc
JOIN Property AS p
  ON p.property_id = bc.property_id
ORDER BY
  booking_rank;
