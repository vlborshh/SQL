CREATE DATABASE IF NOT EXISTS dz1;
USE dz1;
DROP TABLE IF EXISTS telefon;
CREATE TABLE telefon
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(45),
    manufacturer VARCHAR(15),
    productCount INT,
    price INT
);
INSERT telefon (productName, manufacturer, productCount, price)
VALUES
	("iPhone X", "Apple", 3, 76000),
    ("iPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Sumsung", 2, 56000),
    ("Galaxy S8", "Sumsung", 1, 41000),
	("P 20 Pro", "Huawei", 5, 36000);
SELECT id, productName, manufacturer, productCount, price
FROM telefon;     

SELECT productName, manufacturer, price
FROM telefon
WHERE productCount > 2;

SELECT id, productName, productCount, price
FROM telefon     
WHERE productCount*price > 100000 AND productCount*price < 145000;

SELECT id, productName, manufacturer, productCount, price
FROM telefon     
WHERE productName LIKE "iPhone%";

SELECT id, productName, manufacturer, productCount, price
FROM telefon     
WHERE productName LIKE "Galaxy%";

SELECT id, productName, manufacturer, productCount, price
FROM telefon     
WHERE productName LIKE "%8%";

SELECT id, productName, manufacturer, productCount, price
FROM telefon     
WHERE REGEXP_LIKE(productName, '[[:digit:]]');
