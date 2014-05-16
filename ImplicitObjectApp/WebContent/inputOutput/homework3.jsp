<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>

<%
   request.setCharacterEncoding("euc-kr");
   String val[]  = request.getParameterValues("gender");
   System.out.println(val[0]);
   for(int i=0; i<val.length; i++)
   {
      if(val[i].equals("남자"))
      {
         
         response.sendRedirect("http://www.dongabiz.com/");
         
      }
      

      else 
      {
         
         response.sendRedirect("http://www.miznaeil.com/");
         
      }
      
   }
   
   
   

%>
</body>
</html>