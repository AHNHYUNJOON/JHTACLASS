<%@page import="java.util.ArrayList"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>당신이 선택한 학과에 대한 조언입니다.</h1>
<%
	ArrayList list = (ArrayList)request.getAttribute("advice"); //DepartServlet.java에서 던져준 결과를 꺼내옴
	for(int i=0; i<list.size(); i++){
%>
	<b><%=list.get(i)%></b><br/>
<% 		
	}
%>
</body>
</html>