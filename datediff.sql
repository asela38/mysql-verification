SELECT d1, d2, datediff(d1,d2) as d3 FROM (select '2017-11-11 00:00:00' as d1, '2017-11-10 23:59:59' as d2 ) as d;
SELECT d1, d2, to_days(d1)- to_days(d2) FROM (select now() as d1, '1985-08-06 20:59:59' as d2 ) as d;

SELECT to_days(now());
SELECT to_days(now());

select 1;
select 1;