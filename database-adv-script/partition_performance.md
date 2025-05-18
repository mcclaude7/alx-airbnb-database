# Partition Performance Report

## Objective
Improve query performance on the large `Booking` table by partitioning it based on `start_date`.

---

## Partitioning Strategy
- Used **RANGE partitioning** on `YEAR(start_date)`
- Created partitions: 2020, 2021, 2022, 2023, and a MAXVALUE fallback

---

## Observations
- After inserting data into the partitioned table and running date range queries, performance improved.
- `EXPLAIN` showed fewer rows scanned for queries that targeted a specific year.
- Example query:
  ```sql
  SELECT * FROM Booking_Partitioned
  WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';
