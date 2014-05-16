<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>index.jsp</title>
</head>
<body>
<%
	int i =10;
%>
<%@include file="../inc/header.jsp" %>
헤더는 디렉티브인클루드로
<h1>여기는 메인 페이지 입니다.</h1>
&lt;jsp:include/>를 이용한 예제이다.<br/>
푸터는 jsp인클루드(액션태그 인클루드)로
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>