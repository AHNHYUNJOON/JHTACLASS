<%@page import="java.util.Vector"%>
<%@page import="mvc.exam2.BookDto"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>���� ����</th><th>�۰�</th><th>����</th><th>����</th>
	</tr>
	<!-- ���⿡ BookControl �� bookList�� ��� ������ ���� ���� -->
	<% 
		Vector bookList = (Vector)session.getAttribute("cart");
	    int sum=0;
		for(int i=0; i<bookList.size(); i++){
			BookDto dto = (BookDto)bookList.get(i);%>
		<tr>	
			<td><%=dto.getTitle()%></td>
			<td><%=dto.getAuthor()%></td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getQuantity()%></td>
			<%sum= sum + (dto.getPrice()*dto.getQuantity());%>
		</tr>
		
	<% }%><hr/>������ �ݾ��� �Ѱ�� <%=sum %>
	
</table>
</body>
</html>