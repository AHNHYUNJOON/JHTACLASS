<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="mybean.dao.EmpDao" />
<%
	int no = Integer.parseInt(request.getParameter("no"));
	dao.delSawon(no);
%>
	<script type="text/javascript">
		alert("»èÁ¦ µÇ¾ú½À´Ï´Ù.");
		location.href="index.jsp";
	</script>
%>

