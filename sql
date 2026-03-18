1)
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE greatest_of_three(
    ->     IN a INT,
    ->     IN b INT,
    ->     IN c INT
    -> )
    -> BEGIN
    ->     DECLARE greatest INT;
    -> 
    ->     IF a >= b AND a >= c THEN
    ->         SET greatest = a;
    -> 
    ->     ELSEIF b >= a AND b >= c THEN
    ->         SET greatest = b;
    -> 
    ->     ELSE
    ->         SET greatest = c;
    ->     END IF;
    -> 
    ->     SELECT greatest AS greatest_number;
    -> END //


mysql> 
mysql> DELIMITER ;
mysql> CALL greatest_of_three(10,25,15);
+-----------------+
| greatest_number |
+-----------------+
|              25 |
+-----------------+

2)
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE FindFactorial(
    ->     IN n INT
    -> )
    -> BEGIN
    ->     DECLARE i INT DEFAULT 1;
    ->     DECLARE fact BIGINT DEFAULT 1;
    -> 
    ->     WHILE i <= n DO
    ->         SET fact = fact * i;
    ->         SET i = i + 1;
    ->     END WHILE;
    -> 
    ->     SELECT fact AS Factorial;
    -> END //


mysql> 
mysql> DELIMITER ;
mysql> call findFactorial;
ERROR 1318 (42000): Incorrect number of arguments for PROCEDURE pro.findFactorial; expected 1, got 0
mysql> call findFactorial 5;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5' at line 1
mysql> call findFactorial (5);
+-----------+
| Factorial |
+-----------+
|       120 |
+-----------+

3)
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE grade_calc(IN mark INT)
    -> BEGIN
    ->     IF mark >= 90 THEN
    ->         SELECT 'Grade A' AS Grade;
    ->     ELSEIF mark >= 80 THEN
    ->         SELECT 'Grade B' AS Grade;
    ->     ELSEIF mark >= 70 THEN
    ->         SELECT 'Grade C' AS Grade;
    ->     ELSEIF mark >= 60 THEN
    ->         SELECT 'Grade D' AS Grade;
    ->     ELSE
    ->         SELECT 'Grade F' AS Grade;
    ->     END IF;
    -> END //


mysql> 
mysql> DELIMITER ;
mysql> call grade_calc(58);
+---------+
| Grade   |
+---------+
| Grade F |
+---------+



4)
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE reverse_number(IN num INT)
    -> BEGIN
    ->     DECLARE rev INT DEFAULT 0;
    ->     DECLARE rem INT;
    -> 
    ->     WHILE num > 0 DO
    ->         SET rem = num % 10;
    ->         SET rev = rev * 10 + rem;
    ->         SET num = num DIV 10;
    ->     END WHILE;
    -> 
    ->     SELECT rev AS Reversed_Number;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> call reverse_nunber(10);
ERROR 1305 (42000): PROCEDURE pro.reverse_nunber does not exist
mysql> CALL reverse_number(1234);
+-----------------+
| Reversed_Number |
+-----------------+
|            4321 |
+-----------------+
1 row in set (0.00 sec)



5)
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE sum_series(IN n INT)
    -> BEGIN
    ->     DECLARE total INT DEFAULT 0;
    ->     DECLARE i INT DEFAULT 1;
    -> 
    ->     WHILE i <= n DO
    ->         SET total = total + i;
    ->         SET i = i + 1;
    ->     END WHILE;
    -> 
    ->     SELECT total AS Sum_Result;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL sum_series(5);
+------------+
| Sum_Result |
+------------+
|         15 |
+------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


6)CREATE TABLE account(
    ->     account_id INT PRIMARY KEY,
    ->     balance INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> 
mysql> INSERT INTO account VALUES
    -> (100,10000),
    -> (101,4000),
    -> (102,15000),
    -> (103,1000);


mysql> DELIMITER //
mysql> 
mysql> DROP PROCEDURE IF EXISTS withdraw_amount //
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE PROCEDURE withdraw_amount(
    ->     IN acc_id INT,
    ->     IN amount INT
    -> )
    -> BEGIN
    ->     DECLARE current_balance INT;
    -> 
    ->     SELECT balance INTO current_balance
    ->     FROM account
    ->     WHERE account_id = acc_id;
    -> 
    ->     IF current_balance IS NULL THEN
    ->         SELECT 'Account does not exist' AS Message;
    -> 
    ->     ELSEIF current_balance - amount < 1000 THEN
    ->         SELECT 'Withdrawal denied: Minimum balance must be 1000' AS Message;
    -> 
    ->     ELSE
    ->         UPDATE account
    ->         SET balance = balance - amount
    ->         WHERE account_id = acc_id;
    -> 
    ->         SELECT 'Withdrawal successful' AS Message,
    ->                balance AS New_Balance
    ->         FROM account
    ->         WHERE account_id = acc_id;
    ->     END IF;
    -> 
    -> END //


mysql> 
mysql> DELIMITER ;
mysql> CALL withdraw_amount(100, 2000);
+-----------------------+-------------+
| Message               | New_Balance |
+-----------------------+-------------+
| Withdrawal successful |        8000 |
+-----------------------+-------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> CALL withdraw_amount(103, 200);
+-------------------------------------------------+
| Message                                         |
+-------------------------------------------------+
| Withdrawal denied: Minimum balance must be 1000 |
+-------------------------------------------------+


7)
mysql> DELIMITER //
mysql> 
mysql> DROP FUNCTION IF EXISTS sum_of_digits //
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> 
mysql> CREATE FUNCTION sum_of_digits(n INT)
    -> RETURNS INT
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE sumd INT DEFAULT 0;
    -> 
    ->     WHILE n > 0 DO
    ->         SET sumd = sumd + (n % 10);
    ->         SET n = n DIV 10;
    ->     END WHILE;
    -> 
    ->     RETURN sumd;
    -> END //


mysql> 
mysql> DELIMITER ;
mysql> SELECT sum_of_digits(1234);
+---------------------+
| sum_of_digits(1234) |
+---------------------+
|                  10 |
+---------------------+
1 row in set (0.00 sec)

8)mysql> INSERT INTO employee VALUES
    -> (1,'Arun',30000),
    -> (2,'Rahul',45000),
    -> (3,'Meena',50000);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DELIMITER //
mysql> 
mysql> DROP FUNCTION IF EXISTS get_salary //


mysql> 
mysql> CREATE FUNCTION get_salary(eid INT)
    -> RETURNS INT
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE sal INT;
    -> 
    ->     SELECT salary INTO sal
    ->     FROM employee
    ->     WHERE emp_id = eid;
    -> 
    ->     RETURN sal;
    -> END //


mysql> 
mysql> DELIMITER ;
mysql> SELECT get_salary(2);
+---------------+
| get_salary(2) |
+---------------+
|         45000 |
+---------------+
1 row in set (0.00 sec)

mysql> 

