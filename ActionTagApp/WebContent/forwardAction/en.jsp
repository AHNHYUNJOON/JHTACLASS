<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h2> Thank you very much for visiting my site.</h2>
The data that you registered is under this sentence.
<br/>
<hr/>
<ul>
	<li>name : <%=request.getParameter("name") %> </li>
	<li>address: <%=request.getParameter("addr") %></li>
	<li>language: <%=request.getParameter("lang") %></li>
</ul>
</body>
</html>