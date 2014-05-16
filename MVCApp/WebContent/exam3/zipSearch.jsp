<%@page import="mvc.exam3.ZipDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script>
	function fnDongCheck(){
		if(document.f.dong.value == ""){
			alert("반드시 동이름을 입력해야 합니다.");
			document.f.dong.focus();
			return false;
		}


		document.f.submit();
	}


	function fnSendAddress(zipcode, sido, gugun, dong, bunji){
		var addr = sido + " " + gugun + " " + dong + " " + bunji;
		opener.document.f.zip1.value = zipcode.substring(0, 3);
		opener.document.f.zip2.value = zipcode.substring(4);
		opener.document.f.addr.value = addr;	


		self.close();
	}
</script>
</head>
<body>
<h2>우편번호 찾기</h2>
<form method="post" action="/MVCApp/reg" name="f">
	<input type="hidden" name="command" value="ZIPSEARCH" />
	<table>
		<tr>
			<td>동이름 입력 :<input type="text" name="dong"/>
				&nbsp;&nbsp;<input type="button" value="검색" onclick="fnDongCheck()"/></td>
		</tr>
	<%
	try{
		Vector v = (Vector)request.getAttribute("zip");
		if(v.size() == 0 || v == null){
	%>
		<tr>
			<td>검색된 결과가 없습니다.</td>
		</tr>
	<%
		}
		else{
			String bunji = "";
			for(int i=0; i<v.size(); i++){
				ZipDto dto = (ZipDto)v.get(i);
				if(dto.getBunji() == null){
					bunji = " ";
				}
				else{
					bunji = dto.getBunji();
				}
	%>
		<tr>
			<td>
			<a href="javascript:fnSendAddress('<%=dto.getZipcode()%>','<%=dto.getSido()%>','<%=dto.getGugun()%>','<%=dto.getDong()%>','<%=bunji%>')">
			<%=dto.getZipcode()%>&nbsp;&nbsp;<%=dto.getSido()%>&nbsp;&nbsp;
			<%=dto.getGugun()%>&nbsp;&nbsp;<%=dto.getDong()%>&nbsp;&nbsp;
			<%=bunji%></a>
			</td>
		</tr>
	<%
			}
		}
	}
	catch(Exception err){}
	%>
	</table>
</form>
</body>
</html>
