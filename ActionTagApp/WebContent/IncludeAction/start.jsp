<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>여기는  start.jsp입니다</h1>
end.jsp에게 파라미터 전달<br/>
<jsp:include page="end.jsp">
	<jsp:param value="hong gil dong" name="name"/>
	<jsp:param value="seoul jongro" name="addr"/>
</jsp:include>
</body>
</html>