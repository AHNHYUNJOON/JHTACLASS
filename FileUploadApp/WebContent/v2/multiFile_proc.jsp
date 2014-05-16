<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="multi" class="mybean.upload.multi.MultiBean"/>
<%
	multi.setPath(request, "upload");//경로 전달
	multi.setMax(5*1024*1024);
	multi.setEncType("euc-kr");
	multi.setMulti(request);
%>
업로드가 완료되었습니다.
사용자: <jsp:getProperty property="user" name="multi"/><br/>
제목: <jsp:getProperty property="title" name="multi"/><br/>
하고싶은말: <jsp:getProperty property="note" name="multi"/><br/>
<a href=multiFile.jsp>뒤로가기</a>