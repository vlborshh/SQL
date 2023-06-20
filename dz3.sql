create table staff
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname varchar(45) NOT NULL,
    lastname varchar(45) NOT NULL,
    post varchar(25),
    seniority INT,
    salary INT,
    age INT
);

INSERT INTO staff 
    (firstname, lastname, post, seniority, salary, age)
VALUES
    ('Василий', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катерина', 'Катина', 'Инженер', 2, 70000, 25),
    ('Александр', 'Сашкин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
    ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49)
;

-- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
SELECT * 
FROM staff 
ORDER BY salary DESC;

SELECT * 
FROM staff 
ORDER BY salary;

-- Выведите 5 максимальных зарплат (salary)
SELECT lastname, salary  
FROM staff 
LIMIT 5;

-- Подсчитать суммарную зарплату(salary) по каждой специальности (post)
SELECT post, SUM(salary) AS "Сумма зарплат"
FROM staff
GROUP BY post;

-- Найти количество сотрудников по специальности “Рабочий” (post) в возрасте от 24 до 49 лет.
SELECT post, COUNT(*)  AS "Кол-во сотрудников по специальности"
FROM staff 
WHERE post = 'Рабочий' && age >= 24 && age <= 49
GROUP BY post;

-- Найти количество специальностей
SELECT  COUNT(distinct post) AS "Количество специальностей"
FROM staff;

-- Вывести специальности, у которых средний возраст сотрудника меньше 30 лет
SELECT post
FROM staff 
GROUP BY post
HAVING AVG(age) <= 30;

