CREATE TABLE tblZip(
	zipcode		varchar2(10),
	sido	varchar2(10),
	gugun	varchar2(30),
	dong	varchar2(70),
	bunji	varchar2(30)
);

-- mysql�϶�
CREATE TABLE tblZip(
	zipcode		varchar(10),
	sido	varchar(10),
	gugun	varchar(30),
	dong	varchar(70),
	bunji	varchar(30)
);
select count(*) from tblzip where dong like '%��%';
select * from tblzip;
--SQL Loader(sqlldr.exe) �ܺ������� �о���̴� ���α׷�
--����� 1.��Ʈ�� ���� �ۼ�(.ctl)
/*LOAD DATA  --�����͸� �ҷ���
INFILE zipcode.csv--� ������ �ҷ��� ������
INTO TABLE tblzip INSERT 
FIELDS TERMINATED BY ','--�ʵ� ������ �޸��� 
(zipcode, sido, gugun, dong, bunji)--���̺� ������ ���� ������ ���� ������ �� �����͸� �Է��ϰڴٰ� ����
*/
--sqlldr control=zipcode.ctl userid=scott/1111@orcl

--mysql
--mysqlimport
-- load ��ɾ�
/*
 LOAD DATA
 LOCAL INFILE 'D:\\jsp\\EclipseWepApps\\MVCApp\\zipcode.csv'
 INTO TABLE tblzip(zipcode, sido, gugun, dong, bunji);
 */ 