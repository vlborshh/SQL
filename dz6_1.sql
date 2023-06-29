CREATE DATABASE IF NOT EXISTS dz6;
USE dz6;

DROP TABLE IF EXISTS times;
CREATE TABLE times 
  (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	seconds INT
  );

INSERT INTO times(seconds) 
VALUES (125478),
       (258147),
       (369874);
       
SELECT * from asdf;    
   
DELIMITER $$
DROP FUNCTION IF EXISTS format_time;
CREATE FUNCTION format_time(seconds INT)
RETURNS CHAR(45)
DETERMINISTIC
BEGIN
  
	DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
	DECLARE result CHAR(45);
    
	IF seconds >= 84600 THEN 
		SET days = seconds / 84600;
		SET seconds = seconds % 84600;
    END IF;
    
	IF seconds >= 3600 THEN 
		SET hours = seconds / 3600;
		SET seconds = seconds % 3600;
    END IF;
    
	IF seconds >= 60 THEN 
		SET minutes = seconds / 60;
		SET seconds = seconds % 60;
    END IF;
    
    SET result = concat(days,' day(s); ',hours,' hour(s); ',minutes,' minute(s); ',seconds,' second(s); ');
	return result;
END $$
SElECT format_time(seconds) AS result FROM times;       

 