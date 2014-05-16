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
		if(bookList != null || bookList.size() >0 ){ //장바구니에 담긴 정보가 있을 때에만 아래 항목을 보여주겠음
%>
<b>현재 주문한 도서</b><br/>
<table border="1">
	<tr>
		<th>도서 제목</th><th>작가</th><th>가격</th><th>수량</th>
	</tr>
	<!-- 여기에 BookControl 의 bookList에 담긴 정보가 들어올 것임 -->
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
					<input type="submit" value="삭제"/>
				</form>
			</td>		
		</tr>
		
	<% }%>
		
</table>
<br/>
<form method="post" action="/MVCApp/cart">
	<input type="hidden" name="command" value="CHK" />
	<!--각 JSP페이지의 모든 요청이 다 북컨트롤러.java로 가기 때문에 구분해주기 위해 -->
	<input type="submit" value="체크 아웃"/>
</form>
<%
		}
	}catch(NullPointerException err){}
%>