<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>여기는 second.jsp 입니다.</h1>
request : <%=request.getAttribute("first") %><br/>
session : <%=session.getAttribute("first") %><br/>
application : <%=application.getAttribute("first") %><br/>
pageContext : <%=pageContext.getAttribute("first") %><br/>
<%
	request.setAttribute("second","request객체");
	session.setAttribute("second","session객체");
	application.setAttribute("second","application객체");
	pageContext.setAttribute("second","pageContext객체");
%>
</body>
</html>