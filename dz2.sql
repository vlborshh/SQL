CREATE DATABASE IF NOT EXISTS dz2;
USE dz2;

-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	orderDate DATE NOT NULL,
	orderCnt INT NOT NULL);
INSERT sales(orderDate, orderCnt) 
VALUES 	("2021-01-01", 150), 
		("2021-01-02", 250), 
		("2021-01-03", 25), 
		("2021-01-04", 450), 
		("2021-01-05", 60);    
SELECT * FROM sales;

# Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id, orderDate,
CASE 
	WHEN orderCnt < 100 THEN 'x < 100'
	WHEN orderCnt >= 100 AND orderCnt <= 300 THEN '100 > x < 300'
	ELSE 'x > 300'
END AS bucket
FROM sales;

/*
	Задача 3. Создайте таблицу “orders”, заполните ее значениями. 
	Покажите “полный” статус заказа, используя оператор CASE.
*/
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	employeeId VARCHAR(3) NOT NULL,
	amount FLOAT(8,2) NOT NULL,
	orderStatus VARCHAR(20) NOT NULL);

INSERT orders(employeeId, amount, orderStatus) 
VALUES 	("e03", 15.00, 'открыт'),
		("e01", 25.50, 'открыт'),
		("e05", 100.70, 'закрыт'),
		("e02", 22.18, 'открыт'),
		("e04", 9.50, 'отменен'),
		("e04", 99.99, 'открыт');

SELECT * FROM orders;

SELECT id, orderStatus,
CASE 
	WHEN orderStatus = 'открыт' THEN 'Заказ открыт.'
	WHEN orderStatus = 'закрыт' THEN 'Заказ закрыт.'
	WHEN orderStatus = 'отменен' THEN 'Заказ отменен.'
	ELSE 'не установлен'
END AS fullOrderStatus
FROM orders;