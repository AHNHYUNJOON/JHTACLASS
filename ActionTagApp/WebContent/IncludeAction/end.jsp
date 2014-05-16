<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>여기는 end.jsp입니다.</h1>
start.jsp로부터 전달받은 인자는 다음과 같습니다.<br/>
name : <%=request.getParameter("name") %><br/>
addr : <%=request.getParameter("addr") %><br/>
</body>
</html>