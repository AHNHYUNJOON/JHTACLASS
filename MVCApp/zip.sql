CREATE TABLE tblZip(
	zipcode		varchar2(10),
	sido	varchar2(10),
	gugun	varchar2(30),
	dong	varchar2(70),
	bunji	varchar2(30)
);

-- mysql일때
CREATE TABLE tblZip(
	zipcode		varchar(10),
	sido	varchar(10),
	gugun	varchar(30),
	dong	varchar(70),
	bunji	varchar(30)
);
select count(*) from tblzip where dong like '%역%';
select * from tblzip;
--SQL Loader(sqlldr.exe) 외부파일을 읽어들이는 프로그램
--사용방법 1.컨트럴 파일 작성(.ctl)
/*LOAD DATA  --데이터를 불러옴
INFILE zipcode.csv--어떤 파일을 불러올 것인지
INTO TABLE tblzip INSERT 
FIELDS TERMINATED BY ','--필드 구분은 콤마로 
(zipcode, sido, gugun, dong, bunji)--테이블에 만들지 않은 데이터 열이 있으면 이 데이터만 입력하겠다고 지정
*/
--sqlldr control=zipcode.ctl userid=scott/1111@orcl

--mysql
--mysqlimport
-- load 명령어
/*
 LOAD DATA
 LOCAL INFILE 'D:\\jsp\\EclipseWepApps\\MVCApp\\zipcode.csv'
 INTO TABLE tblzip(zipcode, sido, gugun, dong, bunji);
 */ 