<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>����� first.jsp �Դϴ�.</h1>
<%
	request.setAttribute("first","request��ü");
	session.setAttribute("first","session��ü");
	application.setAttribute("first","application��ü");
	pageContext.setAttribute("first","pageContext��ü");
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