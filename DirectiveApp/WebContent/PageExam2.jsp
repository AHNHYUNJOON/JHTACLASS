<%@ page  contentType="text/html; charset=EUC-KR"%>
<%@ page buffer="1kb" autoFlush="true" %><!-- 페이지 내용을 1kb차면 사용자에게 자동으로 보내주고 계속 진행하여 또 보내주겠다.  -->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<%
	for(int i=0; i<1500; i++){
		out.println(i);
	}
%>
</body>
</html>