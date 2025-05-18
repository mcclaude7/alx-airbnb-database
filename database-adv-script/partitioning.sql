-- 1. Create a new partitioned version of the Booking table
mysql> CREATE TABLE Booking_Partitioned (
    ->     booking_id INT NOT NULL,
    ->     user_id INT NOT NULL,
    ->     property_id INT NOT NULL,
    ->     start_date DATE NOT NULL,
    ->     end_date DATE NOT NULL,
    ->     PRIMARY KEY (booking_id, start_date)
    -> )
    -> PARTITION BY RANGE (YEAR(start_date)) (
    ->     PARTITION p2020 VALUES LESS THAN (2021),
    ->     PARTITION p2021 VALUES LESS THAN (2022),
    ->     PARTITION p2022 VALUES LESS THAN (2023),
    ->     PARTITION p2023 VALUES LESS THAN (2024),
    ->     PARTITION pmax VALUES LESS THAN MAXVALUE
    -> );


--  2.Insert Data (Optional, for Testing)
mysql> INSERT INTO Booking_Partitioned (booking_id, user_id, property_id, start_date, end_date)
    -> SELECT booking_id, user_id, property_id, start_date, end_date FROM Booking;

-- 3.Test Performance with EXPLAIN
mysql> EXPLAIN SELECT * FROM Booking_Partitioned
    -> WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

mysql> EXPLAIN SELECT * FROM Booking
    -> WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';