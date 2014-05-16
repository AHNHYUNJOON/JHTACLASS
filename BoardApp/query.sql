CREATE TABLE tblBoard(
	num			number,				-- 글번호
	name		varchar2(20),		-- 작성자
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- 글 제목
	content		varchar2(4000),		-- 글 내용
	pass		varchar2(10),		
	count		number,				-- 조회수
	ip			varchar2(50),		-- 작성자 ip주소
	regdate		date,				-- 등록일
	pos			number,				-- 답변의 위치
	depth		number,				-- 답변의 레벨
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


--답변달기 테스트 테이블
CREATE TABLE replyTest(
	num		number,
	subject	varchar2(10),
	pos		number,--위치를 잡아주는 역할(position)
	depth	number --들여쓰기(모양을 잡기 위해)
);
/*
*전제조건 : pos를 기준으로 오름차순 정렬
*1. 새로운 데이터를 입력할 때 먼저 기존 데이터의 모든 pos값을 1 증가
*2. 새로 입력되는 데이터는 무조건 pos와 depth는 0으로 입력
*3. 답변글을 입력할 때 부모(답변을 달고자한 글)보다 큰 pos는 1씩 증가한다.
*4. 답변글의 pos는 부모글의 pos에 1을 더한다.
*부모글(원래 글)
--pos기준으로 정렬			
num	subject	pos	depth	
1	aaa		0	0	
2	bbb		0	0	새글달림
				
2	bbb		0	0	
1	aaa		1	0	pos1증가
3	ccc		0	0	새글달림
				
3	ccc		0	0	
2	bbb		1	0	pos1증가
1	aaa		2	0	pos1증가
4	aaa_a	3	1	1번글 답변달림
				
3	ccc		0	0	
2	bbb		1	0	pos1증가
1	aaa		2	0	pos1증가
4	aaa_a	3	1	1번글 답변달림
5	ccc_c		1	3번글 답변달림
				
3	ccc		0	0	
5	ccc_c	1	1	3번글 답변달림
2	bbb		2	0	pos1증가
1	aaa		3	0	pos1증가
4	aaa_a	4	1	pos1증가
6	ccc_c_c		2	3번글 답변에 답변
				
3	ccc		0	0	
5	ccc_c	1	1	
6	ccc_c_c	2	2	3번글 답변에 답변
2	bbb		3	0	pos1증가
1	aaa		4	0	pos1증가
4	aaa_a	5	1	pos1증가

*/
--1번글 입력
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(1,'aaa', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--2번글 입력
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(2,'bbb', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--3번글 입력
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(3,'ccc', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--4번글 입력
UPDATE replyTest set pos=pos+1;
INSERT INTO replyTest values(4,'ddd', 0, 0);

SELECT * FROM replyTest ORDER BY pos;

--3번글에 대한 답변글 입력
UPDATE replyTest SET pos=pos+1 WHERE pos >1; --3번글 포지션이 1
INSERT INTO replyTest values(5, 'ccc_c', 2, 1);

SELECT * FROM replyTest ORDER BY pos;

--2번글에 대한 답변글 입력
UPDATE replyTest SET pos=pos+1 WHERE pos >3; --2번글 포지션이 3
INSERT INTO replyTest values(6, 'bbb_b', 4, 1);

SELECT * FROM replyTest ORDER BY pos;

--1번글에 대한 답변글 입력
UPDATE replyTest SET pos=pos+1 WHERE pos >5; --1번글 포지션이 5
INSERT INTO replyTest values(7, 'aaa_a', 6, 1);

SELECT * FROM replyTest ORDER BY pos;

--3번글 답변의 답변글 입력
UPDATE replyTest SET pos=pos+1 WHERE pos >2; --3번글답변의 포지션이 2
INSERT INTO replyTest values(8, 'ccc_cc', 3, 2);

SELECT * FROM replyTest ORDER BY pos;

--4번글 답변 입력
UPDATE replyTest SET pos=pos+1 WHERE pos >0; --3번글답변의 포지션이 2
INSERT INTO replyTest values(9, 'ddd_d', 1, 1);

SELECT * FROM replyTest ORDER BY pos;

/*
다른 메커니즘
num		subject		group		pos		depth
4		ddd			4			0		0
3		ccc			3			0		0
2		bbb			2			0		0
1		aaa			1			0		0
5		ccc_c		3			1		1	 3번글에 대한 답변 달림

4		ddd			4			0		0
3		ccc			3			0		0
5		ccc_c		3			1		1	 2차정렬(그룹으로 한번 정렬, pos로 한번 정렬)
2		bbb			2			0		0
1		aaa			1			0		0

4		ddd			4			0		0
3		ccc			3			0		0
5		ccc_c		3			1		1	 2차정렬(그룹으로 한번 정렬, pos로 한번 정렬)
2		bbb			2			0		0
1		aaa			1			0		0
6		ccc_cc		3					1	 3번글에 다른 글이 달림 

4		ddd			4			0		0
3		ccc			3			0		0
6		ccc_cc		3			1		1	 3번글에 다른 글이 달림 
5		ccc_c		3			2		1	 pos1증가
2		bbb			2			0		0
1		aaa			1			0		0
7 		ccc_cc_c	3					2	 6번글에((답변에) 답변이 달림)

4		ddd			4			0		0
3		ccc			3			0		0
6		ccc_cc		3			1		1	 3번글에 다른 글이 달림 
7 		ccc_cc_c	3			2		2	 6번글에((답변에) 답변이 달림)
5		ccc_c		3			3		1	 pos1증가
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

--3번글에 대한 답변글 입력
UPDATE replyTest2 SET pos=pos+1 WHERE pos >1;
INSERT INTO replyTest2 values(5, 'ccc_c', 1, 1, 1);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

--2번글에 대한 답변글 입력
UPDATE replyTest2 SET pos=pos+1 WHERE pos >1;
INSERT INTO replyTest2 values(6, 'bbb_b', 2, 1, 1);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

--2번글에 대한 답변의 답변글 입력
UPDATE replyTest2 SET pos=pos+1 WHERE pos >1;
INSERT INTO replyTest2 values(7, 'bbb_b_b', 2, 2, 2);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

--2번글에 다른 답변이 달림(새로운 답변이 위로)
UPDATE replyTest2 SET pos=pos+1 WHERE grouping=2 and pos >=1;
INSERT INTO replyTest2 values(8, 'bbb_b2', 2, 1, 1);

SELECT * FROM replyTest2 ORDER BY grouping, POS;

DROP TABLE replyTest;
DROP TABLE replyTest2;









-- 자료실
CREATE TABLE tblPds(
	num			number,				-- 글번호
	name		varchar2(20),		-- 작성자
	email		varchar2(50),		
	homepage	varchar2(50),
	subject		varchar2(50),		-- 글 제목
	content		varchar2(4000),		-- 글 내용
	pass		varchar2(10),		
	count		number,				-- 조회수
	ip			varchar2(50),		-- 작성자 ip주소
	regdate		date,				-- 등록일
	pos			number,				-- 답변의 위치
	depth		number,				-- 답변의 레벨
	constraint pk_num	primary key(num)
);


CREATE TABLE tblFile(
	fileId 		number,
	num			number,
	filePath	varchar2(50),
	constraint pk_fileId	primary key(fileId))
);