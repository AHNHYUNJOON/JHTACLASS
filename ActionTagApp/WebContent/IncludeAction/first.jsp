<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>여기는 first.jsp 입니다.</h1>
<%
	request.setAttribute("first","request객체");
	session.setAttribute("first","session객체");
	application.setAttribute("first","application객체");
	pageContext.setAttribute("first","pageContext객체");
%>

request : <%=request.getAttribute("first") %><br/>
session : <%=session.getAttribute("first") %><br/>
application : <%=application.getAttribute("first") %><br/>
pageContext : <%=pageContext.getAttribute("first") %><br/>
<hr/>
<jsp:include page="second.jsp" />
<hr/>
request : <%=request.getAttribute("second") %><br/>
session : <%=session.getAttribute("second") %><br/>
application : <%=application.getAttribute("second") %><br/>
pageContext : <%=pageContext.getAttribute("second") %><br/>
</body>
</html>