<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h2>���� ����Ʈ�� �湮���ּż� ����� �����մϴ�.</h2>
����� ����Ͻ� �����ʹ� ������ �����ϴ�.<br/>
<hr/>
<ul>
	<li>�̸� :<%=request.getParameter("name") %> </li>
	<li>�ּ�:<%=request.getParameter("addr") %></li>
	<li>���:<%=request.getParameter("lang") %></li>
</ul>
</body>
</html>