<% 
	request.setCharacterEncoding("euc-kr");
	String toWhere = "kr.jsp";
	String from = request.getRemoteAddr();
	String lang = "Korean";
	
	if(from.endsWith("127.0.0.1")){
		toWhere = "en.jsp";
		lang="English";
	}
%>
<jsp:forward page="<%=toWhere %>">
	<jsp:param value="<%=lang %>" name="lang" />
</jsp:forward>>
