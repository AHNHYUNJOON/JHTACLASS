<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>메인 페이지</h1>
<h2>메뉴</h2>
<ul>
	<li><a href="member.app">회원 가입</a></li><!-- 이 각각의 메뉴를 조절하는 컨트롤러가 있어야 함.--> 
	<li><a href="admin.app">관리자</a></li><!--규모가 크기에 하나의 컨트롤러를 두고 그 밑에 자식컨트롤러를 둔다. -->
	<li><a href="shop.app">쇼핑몰</a></li>		
	<li><a href="board.app">게시판</a></li>
	<li><a href="comunity.app">커뮤니티</a></li>
</ul>
</body>
</html>