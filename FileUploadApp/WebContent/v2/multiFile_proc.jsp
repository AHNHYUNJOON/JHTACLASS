<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="multi" class="mybean.upload.multi.MultiBean"/>
<%
	multi.setPath(request, "upload");//��� ����
	multi.setMax(5*1024*1024);
	multi.setEncType("euc-kr");
	multi.setMulti(request);
%>
���ε尡 �Ϸ�Ǿ����ϴ�.
�����: <jsp:getProperty property="user" name="multi"/><br/>
����: <jsp:getProperty property="title" name="multi"/><br/>
�ϰ������: <jsp:getProperty property="note" name="multi"/><br/>
<a href=multiFile.jsp>�ڷΰ���</a>