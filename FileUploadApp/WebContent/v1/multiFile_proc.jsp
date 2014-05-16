<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
	ServletContext ctx = getServletContext();//현재 만들어져있는 프로젝트에 대한 기본적인 정보를 담음
	//out.println(ctx.getRealPath("upload")); //파일 업로드가 실제 동작을 하는 경로확인
	//D:\\jsp\\EclipseWepApps\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\wtpwebapps\\FileUploadApp\\upload 
	String path = ctx.getRealPath("upload"); //실제 경로를 String변수에 담음
	int max = 5*1024*1024;// 5MB로 저장하기위한 int값 지정
	MultipartRequest multi = new MultipartRequest(request, path, max, "euc-kr", new DefaultFileRenamePolicy()); 
	// request+upload기능을 묶은 객체, 여기서는 도큐먼트의 5번째 생성자를 이용(요청,경로,최대사이즈,인코딩타입,파일리네임 팔러시객체 생성)
	//out.println(request.getParameter("user")); =>null값 나옴
	String user = multi.getParameter("user");
	String title = multi.getParameter("title");
	String note = multi.getParameter("note").replace("\n","<br/>");
	
	ArrayList saveFiles = new ArrayList();
	ArrayList originFiles = new ArrayList(); //같은 이름일 경우 이름이 변경되기 전의 파일
	
	Enumeration enumer = multi.getFileNames();
	while(enumer.hasMoreElements()){
		String name = (String)enumer.nextElement();
		saveFiles.add(multi.getFilesystemName(name));
		originFiles.add(multi.getOriginalFileName(name));
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
	 사용자: <%= user%> <br/>
	 제목: <%= title%> <br/>
	 하고 싶은 말:<br/>
  <%= note%> 
  <hr/>
  <%  for(int i=0; i<saveFiles.size(); i++){ %>
  		<!-- <a href="<%=path%>/<%=saveFiles.get(i)%>"><%=originFiles.get(i) %></a><br/> 경로가 노출됨-->
  		<a href="download.jsp?path=upload&name=<%=saveFiles.get(i)%>"><%=originFiles.get(i) %></a><br/>
  		
  <%  } %>
</body>
</html>