
set @min = 1000000;
set @max = 5000000;
SELECT  floor(rand() * (@max - @min) ) + @min;

select elt(rand() * 6 + 0.5, 'a', 'b', 'c', 'd','e', 'f');

SELECT replace(rand(), '.','');

SELECT CAST( md5(rand()) AS CHAR);

DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT, 
  `user_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL, 
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '0',
  `record_status` ENUM ('ACTIVE', 'INACTIVE', 'TEST-ONLY') NOT NULL,
  `record_created` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `record_created_user` varchar(32) NOT NULL,
  `record_created_app` varchar(32) NOT NULL,
  `record_updated_user` varchar(32) DEFAULT NULL,
  `record_updated_app` varchar(32) DEFAULT NULL,
  `record_updated_count` int(11) DEFAULT NULL,
  `record_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `IDX_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

INSERT INTO user_profile
	(
		user_name,
        first_name,
        last_name,
        password,
        record_status,
        record_created,
        record_created_user,
        record_created_app
    )
values ( 
	substring( CAST( md5(rand()) AS CHAR) , 1, 10),
    substring( CAST( md5(rand()) AS CHAR) , 1, 7),
    substring( CAST( md5(rand()) AS CHAR) , 1, 15),
    CAST( md5(rand()) AS CHAR) ,
    elt(rand() * 3 + 0.5, 'ACTIVE', 'INACTIVE', 'TEST-ONLY'),
    now(),
    'me',
    'direct'
    );
    
select * from user_profile;
	