-- Ctrl + Enter (실행)
-- 스크롤 + Ctrl + Shift + Enter (다수 명령어 실행)
-- Ctrl + D (행 복사)


-- MySQL 버전
SELECT version();
-- 시스템 날짜 시간 정보
SELECT current_date(),current_time(),now();
-- 현재 접속한 사용자 아이디 확인
SELECT USER();


-- DB 생성
CREATE DATABASE DBName;
-- DB 목록 조회
SHOW DATABASES;
-- DB 삭제
DROP DATABASE DBName;


-- 작업 DB 선택·변경
USE DBName;
-- 테이블 생성
CREATE TABLE tableName (
 -- 컬럼(열) 이름 · 데이터타입   
	column01 int,
    column02 int,
    column03 varchar(5),
    column04 int
);
-- 테이블 구성 보기
DESC tableName;
DESCRIBE tableName;
-- 테이블 목록 조회
SHOW TABLES;

-- 테이블에 데이터 넣기
INSERT INTO tableName VALUES(1, 123, '넣을문자열', 321);

-- 테이블 모든 열(*) 검색
SELECT * FROM tableName;
-- 고른 열만 검색
SELECT column01, column02 FROM tableName;
-- 중복 없이 검색
SELECT DISTINCT column01 FROM tableName;
-- 조건(where)을 걸어 검색
SELECT column01 FROM tableName WHERE column02 = 123;
SELECT * FROM DBName.tableName; -- DBName데이터베이스 내의 tableName테이블의 내용 확인

-- SUB QUERY [ 전체는 main query ,  ()안에 있는 것이 sub query ]
SELECT * FROM tableName WHERE column01 < (SELECT column02 FROM tableName); 


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
	column01 int  primary key auto_increment,	-- auto_increment(자동 번호 상승): 기본키(primary key)여야 가능함.
    column02 int,
    column03 varchar(5),
    column04 int
);
INSERT INTO tableName values(NULL, 123, '넣을문자열', 321);

SET sql_safe_updates=1; -- 안전한 업데이트 모드가 활성화
SET sql_safe_updates=0; -- 안전한 업데이트 모드가 비활성화
-- 테이블 데이터 수정
UPDATE tableName SET column04 = 456789 WHERE column01 = 1;
-- 데이터 삭제 
DELETE FROM tableName; -- 테이블 데이터들 전부 삭제
DELETE FROM tableName where column04 = 456789;	-- 조건에 맞는 데이터 전부 삭제


 
 -- ========================================================
 


CREATE TABLE tableName (
	column01 int primary key auto_increment,
    column02 varchar(10)
);
INSERT INTO tableName VALUES(null, "가");
INSERT INTO tableName VALUES(null, "나");
INSERT INTO tableName VALUES(null, "나");

-- 내림차순
SELECT * FROM tableName ORDER BY column01 DESC;
-- 오름차순
SELECT * FROM tableName ORDER BY column01 ASC; 

-- group by
SELECT sum(column01) FROM tableName GROUP BY column02;


 
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
SELECT * FROM tableName WHERE column03 like '__문___'; -- 중관에 문이 들어가는
SELECT * FROM tableName WHERE column03 like '%문%'; -- 중관에 문이 들어가는

-- ORDER // 오름차순(ASC)ascending // DESC (내림차순) descending
SELECT * FROM tableName ORDER BY column03 DESC; 

-- ANY(하나라도 만족하면) ,  ALL(모든 만족해야, 교집합)
SELECT * FROM tableName WHERE column02 > any(SELECT column02 FROM tableName WHERE column01 >= 1);
SELECT * FROM tableName WHERE column02 >= all(SELECT column02 FROM tableName WHERE column01 >= 1);



-- ========================================================



 CREATE TABLE tableName1 (
    column01 int,
    column02 varchar(10)
);
CREATE TABLE tableName2 (
    column01 int,
    column02 varchar(10)
);
INSERT INTO tableName1 VALUES(1, 'abc');
INSERT INTO tableName2 VALUES(1, 'def');

-- INNER JOIN은 두 테이블 간의 공통된 값을 가지고 있는 행들만을 반환 ,  on은 join조건
SELECT * FROM tableName1 as A INNER JOIN tableName2 as B on A.column01 = B.column01;
SELECT * FROM tableName1 A INNER JOIN tableName2 B on A.column01 = B.column01;
-- left (outer) join은 오른쪽이 만족하지 않아도 왼쪽은 무슨 일이 있어도 반환 ,  on은 join조건
SELECT * FROM tableName1 A LEFT OUTER JOIN tableName2 B on A.column01 > B.column01;
SELECT * FROM tableName1 A LEFT JOIN tableName2 B on A.column01 > B.column01;
-- right (outer) join은 왼쪽이 만족하지 않아도 오른쪽은 무슨 일이 있어도 반환 ,  on은 join조건
SELECT * FROM tableName1 A RIGHT OUTER JOIN tableName2 B on A.column01 > B.column01;
SELECT * FROM tableName1 A RIGHT JOIN tableName2 B on A.column01 > B.column01;



-- ========================================================



CREATE TABLE tableName (
	column01 int primary key auto_increment,
    column02 int,
    column03 varchar(10),
    column04 int
);
INSERT INTO tableName VALUES(null, 123, 'abc', 12345);
INSERT INTO tableName(column01, column03, column04) VALUES(null, 'abc', 12345);
INSERT INTO tableName VALUES(null, 456, 'abc', 56789);

-- concat :  문자열 결합 (concatenate의 약자)
SELECT concat('a','b','c');
SELECT reverse('MYSQL') '역변환';
SELECT substring('대한 민국만세',3,2) as '문자열 자르기'; 
SELECT substring('대한 민국만세',4,2) '문자열 자르기'; 
-- null인 것들만 조회
SELECT concat(column01, ' & ',column03,' & ',column04) FROM tableName WHERE column02 is null;
-- null이 아닌 것들만 조회
SELECT concat(column01,' & ',column02,' & ',column03,' & ',column04) FROM tableName WHERE column02 is not null;

-- 집계 함수(aggregate function)
SELECT count(column02) as '개수' FROM tableName;	-- 개수
SELECT max(column01) FROM tableName;	-- 최댓값
SELECT min(column01) FROM tableName;	-- 최솟값
SELECT sum(column01) FROM tableName;	-- 합계
SELECT avg(column01) FROM tableName;	-- 평균
SELECT stddev(column01) '평균편차' FROM tableName; -- stddev() 평균편차
SELECT pow(2,3) 'a의 b제곱'; -- 제곱
SELECT mod(8,3) '나머지 연산';	-- 나머지

-- cast 
-- int a = (int) 5.6f  자바의 casting(형변환) 
-- cast형변환한다 as unsigned부호가 있는 integer타입으로
SELECT cast(avg(column01) as unsigned integer) FROM tableName;
SELECT cast(avg(column01) as signed integer) FROM tableName;

SELECT cast(-3.4 as unsigned integer); -- 18446744073709551613
SELECT cast(-3.4 as signed integer); -- -3

SELECT convert(avg(column01), unsigned integer) FROM tableName; 



-- ========================================================



-- 조건검색문 SELECT
SELECT IF(100>200, '참이다','거짓이다');

SELECT CASE 10
	when 1 then '일'
	when 5 then '오'
	when 10 then '십'
	ELSE '모름'
    END AS 'case 연습';
    -- end;
    
SELECT CASE 10
	when 1 then '일'
	when 5 then '오'
	when 10 then '십'
	ELSE '모름'
	END AS 'case 연습', IF(100>200, '참','거짓')'if 연습';



-- ========================================================



-- 프로시저: 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합 (p.295 SQL프로그래밍)
-- 특정한 로직을 처리하기만 하고 결과 값을 반환하지 않는 서브 프로그램

-- 프로시저 삭제
DROP PROCEDURE if exists ifproc;

-- 여기부터 프로시저 만들기(Stored Procedures), 
				-- 다시 $$올 때까지 멈추지 말라, 이 밑에 주석은 실행 방해
delimiter $$
CREATE PROCEDURE ifproc()
BEGIN
	declare var1 int; -- 변수 선언
    set var1 = 100; -- 변수에 값 대입
    if var1 = 100 then
		select '100입니다';
	end if;
    
END $$
delimiter ;
	-- 여기까지 한 세트
CALL ifProc();	-- 호출


-- ex)
USE DBName;

CREATE TABLE tableName (
	column01 int primary key auto_increment,
    column02 int,
    column03 varchar(10),
    column04 int
);
INSERT INTO tableName values(null, 123, "와하", 987);
DROP TABLE tableName;

DROP PROCEDURE if exists ifproc2;
					-- delimiter $aaaa 등도 됨 
delimiter \\	
CREATE PROCEDURE ifproc2()
begin
	declare col01 int; 
    declare col02 int; 
    declare col03 varchar(10); 
    declare col04 int; 
    
	select column02 into col02
		from DBName.tableName
        where column01 = 1;
        
	set col03 = "와웅"; 
    set col04 = 569789;
    
    if(col04) >= 5 then 
		select concat('5이상 ',col02, ' 입니다.');
	else 
		select '예외 ', '입니다.';
	end if;
end \\
delimiter ;

CALL ifproc2();