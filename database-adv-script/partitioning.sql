-- 1. Partitioning Setup (PostgreSQL)

-- 1.1 Rename original table
ALTER TABLE Booking RENAME TO Booking_old;

-- 1.2 Create new partitioned table
CREATE TABLE Booking (
  booking_id    UUID        PRIMARY KEY,
  property_id   UUID        NOT NULL,
  user_id       UUID        NOT NULL,
  start_date    DATE        NOT NULL,
  end_date      DATE        NOT NULL,
  total_price   DECIMAL(10,2) NOT NULL,
  status        VARCHAR(20) NOT NULL,
  created_at    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 1.3 Create monthly partitions for 2025
CREATE TABLE Booking_2025_01 PARTITION OF Booking
  FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');
CREATE TABLE Booking_2025_02 PARTITION OF Booking
  FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');
CREATE TABLE Booking_2025_03 PARTITION OF Booking
  FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');
CREATE TABLE Booking_2025_04 PARTITION OF Booking
  FOR VALUES FROM ('2025-04-01') TO ('2025-05-01');
CREATE TABLE Booking_2025_05 PARTITION OF Booking
  FOR VALUES FROM ('2025-05-01') TO ('2025-06-01');
CREATE TABLE Booking_2025_06 PARTITION OF Booking
  FOR VALUES FROM ('2025-06-01') TO ('2025-07-01');
CREATE TABLE Booking_2025_07 PARTITION OF Booking
  FOR VALUES FROM ('2025-07-01') TO ('2025-08-01');
CREATE TABLE Booking_2025_08 PARTITION OF Booking
  FOR VALUES FROM ('2025-08-01') TO ('2025-09-01');
CREATE TABLE Booking_2025_09 PARTITION OF Booking
  FOR VALUES FROM ('2025-09-01') TO ('2025-10-01');
CREATE TABLE Booking_2025_10 PARTITION OF Booking
  FOR VALUES FROM ('2025-10-01') TO ('2025-11-01');
CREATE TABLE Booking_2025_11 PARTITION OF Booking
  FOR VALUES FROM ('2025-11-01') TO ('2025-12-01');
CREATE TABLE Booking_2025_12 PARTITION OF Booking
  FOR VALUES FROM ('2025-12-01') TO ('2026-01-01');

-- 1.4 Move existing data into partitions
INSERT INTO Booking SELECT * FROM Booking_old;
DROP TABLE Booking_old;

-- 2. Performance Testing
-- I tested the following query before and after partitioning:

SELECT *
FROM Booking
WHERE start_date >= '2025-06-01'
  AND start_date <  '2025-07-01';

-- 2.1 Before Partitioning
EXPLAIN ANALYZE
SELECT *
...

-- 2.2 After Partitioning
EXPLAIN ANALYZE
SELECT *
...
