<%@ page  contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>���� ���� ����Ʈ</h1>
<table border="1">
	<tr>
		<th>ID</th><th>�̸�</th><th>�н�����</th><th>����</th>
		<th>�ٹ���</th><th>�μ���</th><th>������ȣ</th>
	</tr>
<%
	Connection con = null;//db������ ���� connection��ü
	Statement stmt = null;//db�� ����ϱ� ���� ��ü Statement
	ResultSet rs = null;//db���� �ҷ��� ����� �ӽ÷� �����ϱ� ���� ��ü
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