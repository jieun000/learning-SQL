-- Ctrl D (행 복사)

create database DBName;
show databases;
drop database DBName;

USE DBName;
CREATE TABLE tableName (
	column01 int auto_increment,
    column02 int,
    column03 varchar(5),
    column04 int
);
desc tableName;
describe tableName;
show tables;

INSERT INTO tableName values(NULL, 123, '넣을문자열', 321);

SELECT * FROM tableName;
SELECT column01, column02 FROM tableName;
SELECT column01 from tableName where column02 = 123;
select * from DBName.tableName; -- DBName데이터베이스 내의 tableName테이블의 내용 확인

-- SUB QUERY [ 전체는 main query ,  ()안에 있는 것이 sub query ]
select * from tableName where column01 < (select column02 from tableName); 

ALTER TABLE tableName RENAME COLUMN column01 TO column00; 
ALTER TABLE tableName MODIFY COLUMN column02 varchar(10);
ALTER TABLE tableName CHANGE COLUMN column03 newColumn03 varchar(20);
ALTER TABLE tableName DROP COLUMN column04;
-- alter table testtbl2 auto_increment = 100;

ALTER TABLE tableName ADD COLUMN plusColumnName1 int;
ALTER TABLE tableName ADD COLUMN plusColumnName2 int FIRST;

ALTER TABLE tableName ADD PRIMARY KEY(column01);
ALTER TABLE tableName DROP PRIMARY KEY;

DROP TABLE tableName;
 
 
 
 -- ========================================================
 
 
 
 CREATE TABLE tableName (
	column01 int auto_increment,
    column02 int,
    column03 varchar(5),
    column04 int
);
INSERT INTO tableName values(NULL, 123, '넣을문자열', 321);

set sql_safe_updates=1; -- 안전한 업데이트 모드가 활성화
set sql_safe_updates=0; -- 안전한 업데이트 모드가 비활성화
UPDATE tableName SET column04 = 456789 WHERE column01 = 1;

DELETE FROM tableName where column04 = 456789;
 
 
 
 -- ========================================================