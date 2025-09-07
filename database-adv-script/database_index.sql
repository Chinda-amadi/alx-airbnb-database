-- Create Indexes

-- User table
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_role  ON "User"(role);

-- Booking table
CREATE INDEX idx_booking_user       ON Booking(user_id);
CREATE INDEX idx_booking_property   ON Booking(property_id);
CREATE INDEX idx_booking_dates      ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status     ON Booking(status);

-- Property table
CREATE INDEX idx_property_host     ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location_id);
CREATE INDEX idx_property_price    ON Property(price_per_night);

-- Measure Performance with EXPLAIN ANALYZE

-- Before indexing user_id
EXPLAIN ANALYZE
SELECT * 
FROM Booking
WHERE user_id = 'uuid-002';

Seq Scan on Booking  (cost=0.00..50.00 rows=1000 width=200)  
  Filter: (user_id = 'uuid-002')  
  Rows Removed by Filter: 900  
Planning Time: 0.5 ms  
Execution Time: 25.3 ms

-- After creating idx_booking_user
EXPLAIN ANALYZE
SELECT * 
FROM Booking
WHERE user_id = 'uuid-002';

Index Scan using idx_booking_user on Booking  (cost=0.15..5.00 rows=100 width=200)  
  Index Cond: (user_id = 'uuid-002')  
Planning Time: 0.4 ms  
Execution Time: 1.2 ms

