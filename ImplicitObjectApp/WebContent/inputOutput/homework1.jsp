<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>

<h1>���� ����� �����̴�. �ݼ��ض�.</h1>
<hr/>

<%
	request.setCharacterEncoding("euc-kr");
	String korpoint = request.getParameter("kor");
	String matpoint = request.getParameter("mat");
	String engpoint = request.getParameter("eng");
	
	
	int kor=Integer.parseInt(korpoint);
	int mat=Integer.parseInt(matpoint);
	int eng=Integer.parseInt(engpoint);
	
	int tot=kor+mat+eng;
	int avg=tot/3;
	String hak=null;
	if(avg>=90){
		hak="A";
	}else if(avg>=80){
		hak="B";
	}else if(avg>=70){
		hak="C �����";
	}else if(avg>=60){
		hak="D �����";
	}else {
		hak="F ��𰡼� ��������ٰ� ���� ����";
	}

%>
����:<%= kor %>
����:<%= mat %>
����:<%= eng %>
<hr/>
<MARQUEE behavior="slide" scrolldelay="1">����:<%= tot %><br/><br/></MARQUEE>
<MARQUEE behavior="slide" scrolldelay="50">���:<%= avg %><br/><br/></MARQUEE>
<hr/>
<MARQUEE behavior="slide" scrolldelay="100">����:<%= hak %><br/><br/></MARQUEE>
<hr/>

</body>
</html>