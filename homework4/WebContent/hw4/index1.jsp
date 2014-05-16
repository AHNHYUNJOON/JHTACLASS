<%@ page  contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>

</head>
<body>

<MARQUEE behavior="slide" scrolldelay="1"><h1>Welcome... </h1></MARQUEE>
<hr/>
<form name="login" method="post" action="hw4/index.jsp">

<h1><%=(String)session.getAttribute("id") %>이 로그인하셨습니다.</h1>

<input type="submit" value="로그아웃"/>
</form>
<hr/>
<h3>쇼핑몰로 이동하시겠습니까?</h3>
<a href="hw4/shop.jsp">shop.jsp</a>



</body>
</html>