-- Ctrl D (행 복사)

-- MySQL 버전
SELECT version();
-- 시스템 날짜 시간 정보
SELECT current_date(),current_time(),now();
-- 현재 접속한 사용자 아이디 확인
SELECT user();


-- DB 생성
create database DBName;
-- DB 목록 조회
show databases;
-- DB 삭제
drop database DBName;

-- 작업 DB 선택·변경
USE DBName;
-- 테이블 생성
CREATE TABLE tableName (
 -- 컬럼(열) 이름 · 데이터타입   
	column01 int primary key auto_increment, -- auto_increment(자동 번호 상승)
    column02 int,
    column03 varchar(5),
    column04 int
);
-- 테이블 구성 보기
desc tableName;
describe tableName;
-- 테이블 목록 조회
show tables;

-- 테이블에 데이터 넣기
INSERT INTO tableName values(NULL, 123, '넣을문자열', 321);

-- 테이블 모든 열(*) 검색
SELECT * FROM tableName;
-- 고른 열만 검색
SELECT column01, column02 FROM tableName;
-- 중복 없이 검색
SELECT DISTINCT column01 FROM tableName;
-- 조건(where)을 걸어 검색
SELECT column01 from tableName where column02 = 123;
select * from DBName.tableName; -- DBName데이터베이스 내의 tableName테이블의 내용 확인

-- SUB QUERY [ 전체는 main query ,  ()안에 있는 것이 sub query ]
select * from tableName where column01 < (select column02 from tableName); 

-- 테이블 컬럼명 변경
ALTER TABLE tableName RENAME COLUMN column01 TO column00; 
-- 테이블 컬럼 데이터타입 변경
ALTER TABLE tableName MODIFY COLUMN column02 varchar(10);
-- 테이블 컬럼명과 데이터타입 한번에 변경
ALTER TABLE tableName CHANGE COLUMN column03 newColumn03 varchar(20);
-- 테이블 열 삭제
ALTER TABLE tableName DROP COLUMN column04;
-- alter table testtbl2 auto_increment = 100;


-- 테이블 컬럼 더하기
ALTER TABLE tableName ADD COLUMN plusColumnName1 int;
-- 테이블 컬럼 위치 정해 넣기
ALTER TABLE tableName ADD COLUMN plusColumnName2 int FIRST;

-- 테이블 컬럼에 기본키 설정 추가
ALTER TABLE tableName ADD PRIMARY KEY(column01);
-- 테이블 기본키 설정 삭제
ALTER TABLE tableName DROP PRIMARY KEY;

-- 테이블 삭제
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
-- 테이블 데이터 수정
UPDATE tableName SET column04 = 456789 WHERE column01 = 1;
-- 데이터 삭제 
DELETE FROM tableName;
DELETE FROM tableName where column04 = 456789;
 
 
 
 -- ========================================================
 
 
 
CREATE TABLE tableName (
	column01 int primary key auto_increment,
    column02 int,
    column03 varchar(10),
    column04 int
);
INSERT INTO tableName VALUES(NULL, 123, '넣을문자열1', 321);
INSERT INTO tableName VALUES(NULL, 456, '넣을문자열2', 654);

 -- and / or / between and / 
SELECT * FROM tableName WHERE column01 = 1 and column02=123;
SELECT * FROM tableName WHERE column02 between 100 and 125;
SELECT * FROM tableName WHERE column01 = 1 or column01 = 500;
 
 -- in(집합), 포함되어 있는가?
SELECT * FROM tableName WHERE column03 in('넣을문자열1','넣을문자열2');

-- like
SELECT * FROM tableName WHERE column03 like '넣%'; -- 넣~로 시작하는
SELECT * FROM tableName WHERE column03 like '%_문_%'; -- 중관에 문이 들어가는
SELECT * FROM tableName WHERE column03 like '%문%'; -- 중관에 문이 들어가는

-- ORDER // 오름차순(ASC)ascending // DESC (내림차순) descending
SELECT * FROM tableName ORDER BY column03 DESC; 

-- ANY(하나라도 만족하면) ,  ALL(모든 만족해야, 교집합)
SELECT * FROM tableName WHERE column02 > any(select column02 from tableName where column01 >= 1);
SELECT * FROM tableName WHERE column02 >= all(select column02 from tableName where column01 >= 1);
