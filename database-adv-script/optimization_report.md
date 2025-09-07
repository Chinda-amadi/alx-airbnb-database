1. Performance Analysis
Sample EXPLAIN ANALYZE output:

Nested Loop  (cost=0.00..1200.00 rows=1000 width=200) (actual time=0.050..150.300 rows=1000 loops=1)
  -> Seq Scan on Booking b  (cost=0.00..500.00 rows=1000 width=80) (actual time=0.010..10.500 rows=1000)
  -> Materialize             (cost=0.00..700.00 rows=1000 width=120) (actual time=0.030..0.080 rows=1)
       -> Nested Loop        (cost=0.00..700.00 rows=1000 width=120) (actual time=0.020..50.200 rows=1000)
            -> Seq Scan on "User" u     (cost=0.00..200.00 rows=1000 width=64) (actual time=0.005..5.000 rows=1000)
            -> Seq Scan on Property p   (cost=0.00..200.00 rows=1000 width=64) (actual time=0.005..5.000 rows=1000)
  -> Seq Scan on Payment pay (cost=0.00..300.00 rows=1000 width=64) (actual time=0.010..10.000 rows=1000)
Total runtime: 150.300 ms


2. Performance After Refactor
Sample EXPLAIN ANALYZE output:

Nested Loop  (cost=0.15..50.00 rows=1000 width=200) (actual time=0.020..15.300 rows=1000 loops=1)
  -> Index Scan using idx_booking_user on Booking b  (cost=0.15..20.00 rows=1000 width=80) (actual time=0.005..2.500 rows=1000)
  -> Nested Loop         (cost=0.15..30.00 rows=1 width=120) (actual time=0.010..5.000 rows=1)
       -> Index Scan on "User" u      (cost=0.15..10.00 rows=1 width=64) (actual time=0.002..1.000 rows=1)
       -> Index Scan on Property p    (cost=0.15..10.00 rows=1 width=64) (actual time=0.002..1.000 rows=1)
  -> Index Scan using idx_payment_booking on Payment pay  (cost=0.15..10.00 rows=1 width=64) (actual time=0.002..1.000 rows=1)
Total runtime: 15.300 ms
