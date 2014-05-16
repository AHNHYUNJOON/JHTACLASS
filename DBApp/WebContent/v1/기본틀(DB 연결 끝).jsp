<%@ page  contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>직원 정보 리스트</h1>
<table border="1">
	<tr>
		<th>ID</th><th>이름</th><th>패스워드</th><th>나이</th>
		<th>근무지</th><th>부서명</th><th>내선번호</th>
	</tr>
<%
	Connection con = null;//db연결을 위한 connection객체
	Statement stmt = null;//db에 명령하기 위한 객체 Statement
	ResultSet rs = null;//db에서 불러온 결과를 임시로 저장하기 위한 객체
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "scott";
	String pw = "1111";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url,id, pw);
	}
	catch(Exception err){
		System.out.println("index.jsp:"+err);
	}
	finally{
		if(rs != null) try{rs.close();}catch(Exception err){}
		if(stmt != null) try{stmt.close();}catch(Exception err){}
		if(con != null) try{con.close();}catch(Exception err){}
	}
	
%>	
</table>
</body>
</html>