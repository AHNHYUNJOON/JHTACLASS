<%@page import="mvc.exam2.BookDto"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%! 
	BookDto dto= null; 
	int sumPrice=0;
%>
<%
	Vector bookList = (Vector)session.getAttribute("cart");
%>
<%
	try{
		if(bookList != null || bookList.size() >0 ){ //��ٱ��Ͽ� ��� ������ ���� ������ �Ʒ� �׸��� �����ְ���
%>
<b>���� �ֹ��� ����</b><br/>
<table border="1">
	<tr>
		<th>���� ����</th><th>�۰�</th><th>����</th><th>����</th>
	</tr>
	<!-- ���⿡ BookControl �� bookList�� ��� ������ ���� ���� -->
	<%  
		for(int i=0; i<bookList.size(); i++){
			dto = (BookDto)bookList.get(i);
	%>
		<tr>	
			<td><%=dto.getTitle()%></td>
			<td><%=dto.getAuthor()%></td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getQuantity()%></td>
			<td>
				<form method="post" action="/MVCApp/cart">
					<input type="hidden" name="command" value="DEL" />
					<input type="hidden" name="idx" value="<%=i%>" />
					<input type="submit" value="����"/>
				</form>
			</td>		
		</tr>
		
	<% }%>
		
</table>
<br/>
<form method="post" action="/MVCApp/cart">
	<input type="hidden" name="command" value="CHK" />
	<!--�� JSP�������� ��� ��û�� �� ����Ʈ�ѷ�.java�� ���� ������ �������ֱ� ���� -->
	<input type="submit" value="üũ �ƿ�"/>
</form>
<%
		}
	}catch(NullPointerException err){}
%>