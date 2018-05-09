
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `gender` enum('MALE' , 'FEMALE') NOT NULL,
  `first_name` varchar(50) NOT NULL, 
  `last_name` varchar(50) NOT NULL, 
  `date_of_birth` date,
  `active`  boolean DEFAULT true,
  `create_datetime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `create_user` varchar(32) NOT NULL ,
  `update_count` int(11) DEFAULT NULL DEFAULT 0,
  `update_user` varchar(32) NOT NULL ,
  `sys_update_datetime` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;


        
-- begin

DROP PROCEDURE simple_loop;
DELIMITER $$
CREATE PROCEDURE simple_loop ( )
BEGIN
  DECLARE counter BIGINT DEFAULT 0;

  my_loop: LOOP
    SET counter=counter+1;

    IF counter=1000000 THEN
      LEAVE my_loop;
    END IF;

  		INSERT INTO user_test
			(first_name, last_name, gender, date_of_birth, create_user, update_user)  
		values 
		( 	
			SUBSTRING( CAST( md5(rand()) AS CHAR), 1, 3), 
			SUBSTRING( CAST( md5(rand()) AS CHAR), 1, 4) , 
			elt(rand() * 2 + 0.5, 'MALE', 'FEMALE'), 
			concat( floor(rand() * 70 ) + 1950, '-', floor(rand() * 11 ) + 1 , '-' , floor(rand() * 25 ) + 1)
			, 'testuser', 'testuser'
		) ;
        
  END LOOP my_loop;
END$$
DELIMITER ;

-- end

call simple_loop();


SELECT * FROM user_test;
SELECT count(*) FROM user_test;


explain SELECT * FROM user_test 
where first_name = 'aab';
SELECT * FROM user_test 
where user_id = 10003;


explain SELECT * FROM user_test 
where first_name in ( 'aab', 'aad', 'aac');

explain 
SELECT * FROM user_test
WHERE month(date_of_birth) = 7 AND DAY(date_of_birth) = 20 AND YEAR(date_of_birth) = 1978;

explain
SELECT * FROM user_test
WHERE date_of_birth = '1978-07-20';

SELECT * FROM user_test
WHERe DATEDIFF(str_to_date('1978-07-20',"%Y-%c-%e"), date_of_birth) = 0;

CREATE INDEX first_name_index ON user_test(first_name);
CREATE INDEX last_name_index ON user_test(last_name);
CREATE INDEX date_of_birth_index ON user_test(date_of_birth);

DROP INDEX date_of_birth_index ON user_test;