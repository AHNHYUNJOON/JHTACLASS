<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
	//�ٿ�ε� ���� �� �ִ� ���������� �ٿ�ε带 ���� �� �ֵ��� �Ͽ�ȭ ��Ű�� ���� ������ 
	//���ε� ����� �ѷ��� ȭ�鿡�� ���� �̸��� Ŭ���ϸ� ����� �̵��Ͽ� �ٿ�
	 String path = request.getParameter("path");
	 String name = request.getParameter("name");
	 
	 String realPath = getServletContext().getRealPath(path);
	 
	 //response.setContentType("Application/x-msdownload");//mime type
	 response.setContentType("Application/octet-stream"); //�����͸� 1����Ʈ�� �ɰ��� �귯������ �ϴ�  Ÿ��
	 response.setHeader("Content-Disposition", "attachment;filename="+name); 
	 //Content-Disposition�� ����� �ִ� ������, �������ִ� ����� 

	 //File file = new File(realPath+"/"+name);
	 File file = new File(realPath+"/"+ new String(name.getBytes("8859_1"), "euc-kr"));//name�� �̾Ƴ��� ���ڵ� ��
	 byte[] data = new byte[1024];
	 
	 if(file.isFile()){ //������ ��쿡 ó���϶�� ������ ������ġ
		 try{
			 BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));//�о���� �غ�(����Ʈ������ �ɰ��� ó���ؾ� �ؼ� FileInputStream)
		 	 
			 BufferedOutputStream bos= new BufferedOutputStream(response.getOutputStream()); //����� �غ�
			
			 int read = bis.read(data);  //�ּҰ��� �о�鿩��read�� ����
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
