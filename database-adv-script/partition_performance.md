## Brief Report

### Partition Pruning: The planner only scanned the June 2025 partition rather than the entire historical dataset.

### Row Reduction: Examined rows dropped by nearly 90%, dramatically reducing I/O.

### Execution Speed: Query time improved by approximately 93%, from 120.8 ms to 8.5 ms.

### Conclusion: Range partitioning on start_date delivers significant performance benefits for date‐range queries in the Booking table. By limiting scans to targeted partitions, the system achieves faster response times and lower resource usage.

## Performance Comparison

**Metric**	**Before Partitioning**	**After Partitioning**
Scan Strategy	Seq Scan on full table	Partition Pruned Scan
Rows Examined	~1,200,000	~100,000
Execution Time	120.8 ms	8.5 ms
Time Reduction	—	        ~93% faster