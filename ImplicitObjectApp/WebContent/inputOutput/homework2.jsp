<%@ page  contentType="text/html; charset=EUC-KR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h2>니가 구입하고자 선택한 품목과 합계다. 계산은 카운터에서 </h2>
<hr/>
<%
	request.setCharacterEncoding("euc-kr");
	String str[] = request.getParameterValues("food");
	int sum=0;
	if(str != null){
		for(String h : str){		
		int food=Integer.parseInt(h);
		
		sum += food;
%>
	
	선택한 품목의 가격: <%=h %><br/>
	
<% 		
    	}
	}
		
%>
	<hr/>	
	<MARQUEE behavior="slide" scrolldelay="1">합계 :       <%=sum %><br/> </MARQUEE>
</body>
</html>