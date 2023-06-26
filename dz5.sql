-- Получите друзей пользователя с id=1

CREATE VIEW friend AS
SELECT *
FROM friend_requests
WHERE initiator_user_id = 1 AND status = 'approved'
UNION
SELECT *
FROM friend_requests
WHERE target_user_id = 1 AND status = 'approved';

CREATE VIEW friend_1 AS SELECT DISTINCT id, concat(firstname, ' ', lastname) AS friends
FROM users JOIN friend ON initiator_user_id = id OR target_user_id = id
WHERE id != 1;

-- Список медиафайлов пользователей с количеством лайков
SELECT 
	m.id,
	m.filename AS 'медиа',
	CONCAT(u.firstname, ' ', u.lastname) AS 'владелец медиа',	
	COUNT(l.id) AS 'кол-во лайков'
FROM media m
LEFT JOIN likes l ON l.media_id = m.id
JOIN users u ON u.id = m.user_id
GROUP BY m.id
ORDER BY m.id;

-- Количество групп у пользователей
SELECT firstname, lastname, COUNT(*) AS total_communities
FROM users
JOIN users_communities ON users.id = users_communities.user_id
GROUP BY users.id
ORDER BY count(*) desc;
  
  
-- Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.

CREATE OR REPLACE VIEW view_user AS 
SELECT CONCAT(firstname, ' ', lastname, '; ', hometown, '; ', gender) AS 'Пользователи (младше 20 лет)'
FROM users u
JOIN profiles p ON u.id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 20
GROUP BY u.id;
SELECT * FROM view_user;

/*
Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователь, 
указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге 
(первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)
*/

SELECT 
	DENSE_RANK() OVER (ORDER BY COUNT(from_user_id) DESC) AS 'Место в рейтинге',
	COUNT(from_user_id) AS 'Количество отправленных сообщений',
	CONCAT(firstname, ' ', lastname) AS 'Пользователи'
FROM users u
JOIN messages m ON u.id = m.from_user_id
GROUP BY u.id
;

/*
Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) 
и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
*/

SELECT *, 
LAG(created_at, 1, 0) OVER (PARTITION BY TIMESTAMPDIFF(SECOND, created_at, created_at)) AS lag_created_at, 
LEAD(created_at) OVER (PARTITION BY TIMESTAMPDIFF(SECOND, created_at, created_at)) AS lead_created_at
FROM messages ORDER BY TIMESTAMPDIFF(SECOND, created_at, NOW()) DESC;
