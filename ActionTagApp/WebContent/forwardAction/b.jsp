<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>b.jsp</h1>
이 페이지는 조건을 만족할 경우 c.jsp로 제어권을 넘기도록 합니다.<br/>
만약 조건을만족하지 않으면 포워딩하지 않습니다. <br/>
<%
	String name = request.getParameter("name");
	if(name.equals("hong")){
%>
	<jsp:forward page="c.jsp" />
<% 
	}
%>
</body>
</html>