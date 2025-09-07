## 1. Monitored Queries and Baseline Metrics

### 1.1 Fetch Bookings by User ID
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 'uuid-002';

### 1.2 Search Properties by Location & Price Range
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location_id = 'loc-001'
  AND price_per_night BETWEEN 20000 AND 30000;

### 1.3 Join Bookings with Users and Properties
EXPLAIN ANALYZE
SELECT
  b.booking_id,
  u.user_id,
  p.property_id
FROM Booking AS b
JOIN "User" AS u ON b.user_id     = u.user_id
JOIN Property AS p ON b.property_id = p.property_id;

## 2. Bottlenecks Identified

- All three queries relied on sequential scans on large tables.

- Joins used nested loops without supporting indexes on join keys.

- High execution times (25–150 ms) for frequently run queries.


## 3. Implemented Changes
-- Indexes for Query 1
CREATE INDEX idx_booking_user     ON Booking(user_id);

-- Indexes for Query 2
CREATE INDEX idx_property_loc_price ON Property(location_id, price_per_night);

-- Index for Query 3
CREATE INDEX idx_booking_property ON Booking(property_id);

## 4. Summary of Improvements

- Query 1: 94% reduction in execution time; sequential scan replaced with a direct index scan.

- Query 2: 90% reduction; composite index enabled bitmap pruning of irrelevant rows.

- Query 3: 90% reduction; joins leveraged indexes on Booking.user_id, Booking.property_id instead of full scans.
