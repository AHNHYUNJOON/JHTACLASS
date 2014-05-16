<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
	//다운로드 받을 수 있는 페이지에서 다운로드를 받을 수 있도록 일원화 시키기 위한 페이지 
	//업로드 결과를 뿌려준 화면에서 파일 이름을 클릭하면 여기로 이동하여 다운
	 String path = request.getParameter("path");
	 String name = request.getParameter("name");
	 
	 String realPath = getServletContext().getRealPath(path);
	 
	 //response.setContentType("Application/x-msdownload");//mime type
	 response.setContentType("Application/octet-stream"); //데이터를 1바이트씩 쪼개서 흘러가도록 하는  타입
	 response.setHeader("Content-Disposition", "attachment;filename="+name); 
	 //Content-Disposition은 헤더에 있는 정보임, 정해져있는 양식임 

	 //File file = new File(realPath+"/"+name);
	 File file = new File(realPath+"/"+ new String(name.getBytes("8859_1"), "euc-kr"));//name을 뽑아내서 인코딩 함
	 byte[] data = new byte[1024];
	 
	 if(file.isFile()){ //파일일 경우에 처리하라는 일종의 안전장치
		 try{
			 BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));//읽어들일 준비(바이트단위로 쪼개서 처리해야 해서 FileInputStream)
		 	 
			 BufferedOutputStream bos= new BufferedOutputStream(response.getOutputStream()); //출력할 준비
			
			 int read = bis.read(data);  //주소값을 읽어들여서read에 저장
			 while(read != -1){
				 bos.write(data, 0, read);
				 read = bis.read(data);
			 }
			 bos.flush();
			 bos.close();
			 bis.close();
		 	 
		 }
		 catch(Exception err){
			 err.printStackTrace();
		 }
	 }
%>
