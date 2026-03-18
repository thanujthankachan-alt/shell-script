mca@mca-HP-Pro-Tower-280-G9-E-PCI-Desktop-PC:~$ sudo mysql
[sudo] password for mca: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.44-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create data base product;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'data base product' at line 1
mysql> create database product;
Query OK, 1 row affected (0.01 sec)

mysql> use product
Database changed
mysql> create table order_details(order_id int,product_name varchar(58),order_date date);
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    8
Current database: product

Query OK, 0 rows affected (0.03 sec)

mysql> create table order_details(order_id int,product_name varchar(50),order_no int,order_date date);
ERROR 1050 (42S01): Table 'order_details' already exists
mysql> desc order_details;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| order_id     | int         | YES  |     | NULL    |       |
| product_name | varchar(58) | YES  |     | NULL    |       |
| order_date   | date        | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> alter table order_details add order_no int;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc order_details;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| order_id     | int         | YES  |     | NULL    |       |
| product_name | varchar(58) | YES  |     | NULL    |       |
| order_date   | date        | YES  |     | NULL    |       |
| order_no     | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into order_details values(1,'laptop','2000-03-02',234);
Query OK, 1 row affected (0.02 sec)

mysql> insert into order_details values(2,'desktop','2001-02-02',456);
Query OK, 1 row affected (0.02 sec)

mysql> insert into order_details values(3,'keyboard','2000-03-02',457);
Query OK, 1 row affected (0.02 sec)

mysql> insert into order_details values(4,'mouse','2000-03-02',500);
Query OK, 1 row affected (0.02 sec)

mysql> select*from order_details
    -> select*from order_details;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select*from order_details' at line 2
mysql> select*from order_details;
+----------+--------------+------------+----------+
| order_id | product_name | order_date | order_no |
+----------+--------------+------------+----------+
|        1 | laptop       | 2000-03-02 |      234 |
|        2 | desktop      | 2001-02-02 |      456 |
|        3 | keyboard     | 2000-03-02 |      457 |
|        4 | mouse        | 2000-03-02 |      500 |
+----------+--------------+------------+----------+
4 rows in set (0.00 sec)

mysql> insert into order_details values(5,'antivirus','2000-03-02',501);
Query OK, 1 row affected (0.02 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into order_details values (6,'printer','2003-05-02',600);
Query OK, 1 row affected (0.00 sec)

mysql> insert into order_details values (7,'printer','2004-05-02',601);
Query OK, 1 row affected (0.00 sec)

mysql> select*from order_details;
+----------+--------------+------------+----------+
| order_id | product_name | order_date | order_no |
+----------+--------------+------------+----------+
|        1 | laptop       | 2000-03-02 |      234 |
|        2 | desktop      | 2001-02-02 |      456 |
|        3 | keyboard     | 2000-03-02 |      457 |
|        4 | mouse        | 2000-03-02 |      500 |
|        5 | antivirus    | 2000-03-02 |      501 |
|        6 | printer      | 2003-05-02 |      600 |
|        7 | printer      | 2004-05-02 |      601 |
+----------+--------------+------------+----------+
7 rows in set (0.00 sec)

mysql> update order_details set product_name='scanner' where order_id=7;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from order_details;
+----------+--------------+------------+----------+
| order_id | product_name | order_date | order_no |
+----------+--------------+------------+----------+
|        1 | laptop       | 2000-03-02 |      234 |
|        2 | desktop      | 2001-02-02 |      456 |
|        3 | keyboard     | 2000-03-02 |      457 |
|        4 | mouse        | 2000-03-02 |      500 |
|        5 | antivirus    | 2000-03-02 |      501 |
|        6 | printer      | 2003-05-02 |      600 |
|        7 | scanner      | 2004-05-02 |      601 |
+----------+--------------+------------+----------+
7 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.02 sec)

mysql> select*from order_details;
+----------+--------------+------------+----------+
| order_id | product_name | order_date | order_no |
+----------+--------------+------------+----------+
|        1 | laptop       | 2000-03-02 |      234 |
|        2 | desktop      | 2001-02-02 |      456 |
|        3 | keyboard     | 2000-03-02 |      457 |
|        4 | mouse        | 2000-03-02 |      500 |
|        5 | antivirus    | 2000-03-02 |      501 |
+----------+--------------+------------+----------+
5 rows in set (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql>  delete from order_details where order_id in (4,5);
Query OK, 2 rows affected (0.01 sec)

mysql> select*from order_details;
+----------+--------------+------------+----------+
| order_id | product_name | order_date | order_no |
+----------+--------------+------------+----------+
|        1 | laptop       | 2000-03-02 |      234 |
|        2 | desktop      | 2001-02-02 |      456 |
|        3 | keyboard     | 2000-03-02 |      457 |
+----------+--------------+------------+----------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

mysql> set autocommit=0;
Query OK, 0 rows affected (0.00 sec)

mysql> savepoint svp_update;
Query OK, 0 rows affected (0.00 sec)

mysql> select*from order_details;
+----------+--------------+------------+----------+
| order_id | product_name | order_date | order_no |
+----------+--------------+------------+----------+
|        1 | laptop       | 2000-03-02 |      234 |
|        2 | desktop      | 2001-02-02 |      456 |
|        3 | keyboard     | 2000-03-02 |      457 |
+----------+--------------+------------+----------+
3 rows in set (0.00 sec)

mysql> update order_details set product_name='Gaming Keyboard' where order_no=457;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from order_details;
+----------+-----------------+------------+----------+
| order_id | product_name    | order_date | order_no |
+----------+-----------------+------------+----------+
|        1 | laptop          | 2000-03-02 |      234 |
|        2 | desktop         | 2001-02-02 |      456 |
|        3 | Gaming Keyboard | 2000-03-02 |      457 |
+----------+-----------------+------------+----------+
3 rows in set (0.00 sec)

mysql> insert into order_details values(8,'speaker','2005-06-02',700),(9,'webcam',2006-07-02,701);
ERROR 1292 (22007): Incorrect date value: '1997' for column 'order_date' at row 2
mysql> insert into order_details values(8,'speaker','2005-06-02',700),(9,'webcam','2006-07-02',701);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select*from order_details;
+----------+-----------------+------------+----------+
| order_id | product_name    | order_date | order_no |
+----------+-----------------+------------+----------+
|        1 | laptop          | 2000-03-02 |      234 |
|        2 | desktop         | 2001-02-02 |      456 |
|        3 | Gaming Keyboard | 2000-03-02 |      457 |
|        8 | speaker         | 2005-06-02 |      700 |
|        9 | webcam          | 2006-07-02 |      701 |
+----------+-----------------+------------+----------+
5 rows in set (0.00 sec)

mysql> savepoint svp_delete;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from order_details where product_name='destop';
Query OK, 0 rows affected (0.00 sec)

mysql> select*from order_details;
+----------+-----------------+------------+----------+
| order_id | product_name    | order_date | order_no |
+----------+-----------------+------------+----------+
|        1 | laptop          | 2000-03-02 |      234 |
|        2 | desktop         | 2001-02-02 |      456 |
|        3 | Gaming Keyboard | 2000-03-02 |      457 |
|        8 | speaker         | 2005-06-02 |      700 |
|        9 | webcam          | 2006-07-02 |      701 |
+----------+-----------------+------------+----------+
5 rows in set (0.00 sec)

mysql> ROLLBACK TO svp_update;
Query OK, 0 rows affected (0.02 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> set autocommit=1;
Query OK, 0 rows affected (0.00 sec)

mysql> ^C
mysql> 

