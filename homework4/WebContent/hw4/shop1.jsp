<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>������� ���ƾ��</h1>
<h1><%=(String)session.getAttribute("id") %>�� �α����ϼ̽��ϴ�.</h1>
<form name="login" method="post" action="hw4/shop.jsp">
<input type="submit" value="�α׾ƿ�"/>
	
</form>

</body>
</html>