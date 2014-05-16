<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h2>저희 사이트를 방문해주셔서 대단히 감사합니다.</h2>
당신이 등록하신 데이터는 다음과 같습니다.<br/>
<hr/>
<ul>
	<li>이름 :<%=request.getParameter("name") %> </li>
	<li>주소:<%=request.getParameter("addr") %></li>
	<li>언어:<%=request.getParameter("lang") %></li>
</ul>
</body>
</html>