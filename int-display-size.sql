drop table int_test;
create table int_test (
	id int(11) NOT NULL AUTO_INCREMENT,
	int_normal int  not null,
	int_11     int(12) unsigned not null,
	int_5u    int(5) unsigned not null,
	int_5     int(5) not null,
	primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=10000;

describe int_test;

insert into int_test ( `int_normal`, `int_11`, `int_5`, `int_5u`)
 values (100000,100000,100000,100000);
 
select * from int_test;
 
 drop table A;
 create table A (
	a int,
    b int,
    c datetime
);

drop table B; 
 create table B (
	x int,
    a int
);

Insert into A values (100, 1, now());
Insert into A values (100, 11, now());    
Insert into A values (100, 11, '2018-02-02 11:11:11');
Insert into A values (200, 21, now());

select * from A;

Insert into B values (200, 100);
Insert into B values (201, 200);

SELECT 
	b.x,
    a.b,
    a.c
FROM B as b
LEFT OUTER JOIN (
		SELECT DISTINCT
			a1.*
		FROM A a1
        LEFT OUTER JOIN A a2
			ON a1.a = a2.a AND a1.c < a2.c
		WHERE a2.a IS NULL
	) AS a
	ON a.a = b.a;
/*    
GROUP BY b.x, a.b
HAVING MAX(a.c) = a.c;
*/
select now() > now();