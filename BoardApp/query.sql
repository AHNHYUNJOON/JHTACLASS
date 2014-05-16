CREATE TABLE tblBoard(
	num			number,				-- �۹�ȣ
	name		varchar2(20),		-- �ۼ���
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- �� ����
	content		varchar2(4000),		-- �� ����
	pass		varchar2(10),		
	count		number,				-- ��ȸ��
	ip			varchar2(50),		-- �ۼ��� ip�ּ�
	regdate		date,				-- �����
	pos			number,				-- �亯�� ��ġ
	depth		number,				-- �亯�� ����
	constraint pk_num	primary key(num)
);

DROP TABLE tblBoard1;

CREATE SEQUENCE seq_num;

insert into TBLBOARD values(seq_num.nextVal, 'aaa', 'aaa', 'aaa', 
'aaa', 'aaa', 'aaa', 0, 'aaa', sysdate, 0, 0);

insert into TBLBOARD values(seq_num.nextVal, 'bbb', 'bbb', 'bbb', 
'bbb', 'bbb', 'bbb', 0, 'bbb', sysdate, 0, 0);

select * from tblboard;

delete * from tblBoard;


--�亯�ޱ� �׽�Ʈ ���̺�
CREATE TABLE replyTest(
	num		number,
	subject	varchar2(10),
	pos		number,--��ġ�� ����ִ� ����(position)
	depth	number --�鿩����(����� ��� ����)
);
/*
*�������� : pos�� �������� �������� ����
*1. ���ο� �����͸� �Է��� �� ���� ���� �������� ��� pos���� 1 ����
*2. ���� �ԷµǴ� �����ʹ� ������ pos�� depth�� 0���� �Է�
*3. �亯���� �Է��� �� �θ�(�亯�� �ް����� ��)���� ū pos�� 1�� �����Ѵ�.
*4. �亯���� pos�� �θ���� pos�� 1�� ���Ѵ�.
*�θ��(���� ��)
--pos�������� ����			
num	subject	pos	depth	
1	aaa		0	0	
2	bbb		0	0	���۴޸�
				
2	bbb		0	0	
1	aaa		1	0	pos1����
3	ccc		0	0	���۴޸�
				
3	ccc		0	0	
2	bbb		1	0	pos1����
1	aaa		2	0	pos1����
4	aaa_a	3	1	1���� �亯�޸�
				
3	ccc		0	0	
2	bbb		1	0	pos1����
1	aaa		2	0	pos1����
4	aaa_a	3	1	1���� �亯�޸�
5	ccc_c		1	3���� �亯�޸�
				
3	ccc		0	0	
5	ccc_c	1	1	3���� �亯�޸�
2	bbb		2	0	pos1����
1	aaa		3	0	pos1����
4	aaa_a	4	1	pos1����
6	ccc_c_c		2	3���� �亯�� �亯
				
3	ccc		0	0	
5	ccc_c	1	1	
6	ccc_c_c	2	2	3���� �亯�� �亯
2	bbb		3	0	pos1����
1	aaa		4	0	pos1����
4	aaa_a	5	1	pos1����

*/
--1���� �Է�
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(1,'aaa', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--2���� �Է�
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(2,'bbb', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--3���� �Է�
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(3,'ccc', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--4���� �Է�
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(4,'ddd', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--3���ۿ� ���� �亯�� �Է�
UPDATE replyTest SET pos=pos+1 WHERE pos >1; --3���� �������� 1
INSERT INTO replyTest values(5, 'ccc_c', 2, 1);

SELECT * FROM replyTest ORDER BY pos;

--2���ۿ� ���� �亯�� �Է�
UPDATE replyTest SET pos=pos+1 WHERE pos >3; --2���� �������� 3
INSERT INTO replyTest values(6, 'bbb_b', 4, 1);

SELECT * FROM replyTest ORDER BY pos;

--1���ۿ� ���� �亯�� �Է�
UPDATE replyTest SET pos=pos+1 WHERE pos >5; --1���� �������� 5
INSERT INTO replyTest values(7, 'aaa_a', 6, 1);

SELECT * FROM replyTest ORDER BY pos;

--3���� �亯�� �亯�� �Է�
UPDATE replyTest SET pos=pos+1 WHERE pos >2; --3���۴亯�� �������� 2
INSERT INTO replyTest values(8, 'ccc_cc', 3, 2);

SELECT * FROM replyTest ORDER BY pos;

--4���� �亯 �Է�
UPDATE replyTest SET pos=pos+1 WHERE pos >0; --3���۴亯�� �������� 2
INSERT INTO replyTest values(9, 'ddd_d', 1, 1);

SELECT * FROM replyTest ORDER BY pos;

/*
�ٸ� ��Ŀ����
num		subject		group		pos		depth
4		ddd			4			0		0
3		ccc			3			0		0
2		bbb			2			0		0
1		aaa			1			0		0
5		ccc_c		3			1		1	 3���ۿ� ���� �亯 �޸�

4		ddd			4			0		0
3		ccc			3			0		0
5		ccc_c		3			1		1	 2������(�׷����� �ѹ� ����, pos�� �ѹ� ����)
2		bbb			2			0		0
1		aaa			1			0		0

4		ddd			4			0		0
3		ccc			3			0		0
5		ccc_c		3			1		1	 2������(�׷����� �ѹ� ����, pos�� �ѹ� ����)
2		bbb			2			0		0
1		aaa			1			0		0
6		ccc_cc		3					1	 3���ۿ� �ٸ� ���� �޸� 

4		ddd			4			0		0
3		ccc			3			0		0
6		ccc_cc		3			1		1	 3���ۿ� �ٸ� ���� �޸� 
5		ccc_c		3			2		1	 pos1����
2		bbb			2			0		0
1		aaa			1			0		0
7 		ccc_cc_c	3					2	 6���ۿ�((�亯��) �亯�� �޸�)

4		ddd			4			0		0
3		ccc			3			0		0
6		ccc_cc		3			1		1	 3���ۿ� �ٸ� ���� �޸� 
7 		ccc_cc_c	3			2		2	 6���ۿ�((�亯��) �亯�� �޸�)
5		ccc_c		3			3		1	 pos1����
2		bbb			2			0		0
1		aaa			1			0		0
*/

CREATE TABLE replyTest2(
	num			number,
	subject		varchar2(10),
	grouping	number,
	pos			number,
	depth		number 
);

UPDATE replyTest2 set grouping=grouping+1;
INSERT INTO replyTest2 values(1,'aaa', 0, 0, 0);

UPDATE replyTest2 set grouping=grouping+1;
INSERT INTO replyTest2 values(2,'bbb', 0, 0, 0);

UPDATE replyTest2 set grouping=grouping+1;
INSERT INTO replyTest2 values(3,'ccc', 0, 0, 0);

UPDATE replyTest2 set grouping=grouping+1;
INSERT INTO replyTest2 values(4,'ddd', 0, 0, 0);

SELECT * FROM replyTest2 ORDER BY grouping ASC;

--3���ۿ� ���� �亯�� �Է�
UPDATE replyTest2 SET pos=pos+1 WHERE pos >1;
INSERT INTO replyTest2 values(5, 'ccc_c', 1, 1, 1);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

--2���ۿ� ���� �亯�� �Է�
UPDATE replyTest2 SET pos=pos+1 WHERE pos >1;
INSERT INTO replyTest2 values(6, 'bbb_b', 2, 1, 1);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

--2���ۿ� ���� �亯�� �亯�� �Է�
UPDATE replyTest2 SET pos=pos+1 WHERE pos >1;
INSERT INTO replyTest2 values(7, 'bbb_b_b', 2, 2, 2);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

--2���ۿ� �ٸ� �亯�� �޸�(���ο� �亯�� ����)
UPDATE replyTest2 SET pos=pos+1 WHERE grouping=2 and pos >=1;
INSERT INTO replyTest2 values(8, 'bbb_b2', 2, 1, 1);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

DROP TABLE replyTest;
DROP TABLE replyTest2;









-- �ڷ��
CREATE TABLE tblPds(
	num			number,				-- �۹�ȣ
	name		varchar2(20),		-- �ۼ���
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- �� ����
	content		varchar2(4000),		-- �� ����
	pass		varchar2(10),		
	count		number,				-- ��ȸ��
	ip			varchar2(50),		-- �ۼ��� ip�ּ�
	regdate		date,				-- �����
	pos			number,				-- �亯�� ��ġ
	depth		number,				-- �亯�� ����
	constraint pk_num	primary key(num)
);


CREATE TABLE tblFile(
	fileId 		number,
	num			number,
	filePath	varchar2(50),
	constraint pk_fileId	primary key(fileId))
);