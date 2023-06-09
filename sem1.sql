-- Создание БД
create database if not exists lesson1; -- Создание БД с именем lesson1 if not exists (если она не сущ/ет)
-- Подключение к БД
use lesson1;
-- Создание таблицы
drop table if exists student;
CREATE TABLE student
(
	-- имя_столбца тип_данных ограничения
  id int PRIMARY key AUTO_INCREMENT, -- столбец id  - целое число, первичный ключ, автоикремент
  firstname VARCHAR(45), 
  phone VARCHAR(20),
  email VARCHAR(45)
);
-- Данные
INSERT student (firstname, phone, email)
VALUES
	("Антон", "+7-999-888-77-66", "hfsdjhfdjs@mail.ru"),
	("Андрей", "+7-999-888-77-55", "hfsfdgdjhfdjs@mail.ru"),
	("Артем", "+7-999-888-77-44", "hfsddfggjhfdjs@mail.ru"),
    ("Александр", "+7-999-88877-33", "hfs333djhfdjs@mail.ru"),
    ("Анастасия", "+7-999-88877-22", "hfsdj22hfdjs@mail.ru"),
    ("Виктор", "+7-999-88877-11", "h111fsdjhfdjs@mail.ru");
-- Вывод
SELECT * FROM student;    -- * дурной тон
-- Выборка
SELECT firstname, email
FROM student;
-- Выборка2
SELECT firstname, email
FROM student
WHERE firstname = "антон";
