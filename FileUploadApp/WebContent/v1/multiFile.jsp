<%@ page  contentType="text/html; charset=EUC-KR"%>
<%!
	public String getParam(HttpServletRequest req, String param){
		if(req.getParameter(param) != null)
			return req.getParameter(param);
		else
			return "";
	} //값을 유지하기 위한 하나의 방법(전송되고 다시 페이지를 소환해도)->전송한 인풋타입에 밸류값지정, 단, 텍스트에어리어는 value지정할 수 없음
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script type="text/javascript">
	function fnElementChk(f){
		//var cnt = document.forms[0].add.value;
		var cnt= f.elements.length; //elements 는 form안의 모든 객체
		//alert(cnt); //기본객체 4개 +추가하겠다고 한 갯수
		var paramIndex = 1;
		for(var i=0; i<cnt; i++){
			if(f.elements[i].type == "file"){ //form 태그 안의 요소들 중 type이 파인인 경우
				if(f.elements[i].value == ""){ //값이 비어있으면
					alert(paramIndex + "번째 칸이 비어있습니다. \n 제대로 입력하십시오");
					f.nextElements[i].focus();
					return;
				}
				paramIndex++;
				
			}
			
		}
		f.submit();
	}
</script>
</head>
<body>
<%
	int cnt=0;
	if(request.getParameter("add") != null){ //아래 테이블에서 전송받은 추가할 파일 수
		cnt = Integer.parseInt(request.getParameter("add"));
	}
%>
<h1>다중 파일 업로드</h1>
<form method="post" action="multiFile.jsp">
<!-- 두개의 테이블이 목적이 다르기에 form을 나누고 이 테이블에서 환인버튼을 눌렀을 때 다시 이페이지가 보이도록 함 -->
<table width="60%" border="1">
<tr>
	<td>사용자</td>
	<td><input type="text" name="user" value='<%=getParam(request,"user")%>'/></td>
	<td>제목</td>
	<td><input type="text" name="title" value='<%=getParam(request,"title")%>'/></td>
</tr>
<tr>
	<td>하고 싶은 말 :</td>
	<td colspan="3"><textarea rows="3" cols="70" name="note"><%=getParam(request,"note")%></textarea></td>
</tr>
<tr>
	<td colspan="4">
		추가할 파일 수 입력 : <input type="text" name="add"/>&nbsp;&nbsp;
		<input type="submit" value="확인" />
	</td>
</tr>
</table>
</form>
<form method="post" action="multiFile_proc.jsp" enctype="multipart/form-data">
<input type="hidden" name="user" value='<%=getParam(request,"user")%>'/>
<input type="hidden" name="title" value='<%=getParam(request,"title")%>'/>
<input type="hidden" name="note" value='<%=getParam(request,"note")%>'/>
<table border="1">
	<tr>
		
		<td>
			<%for(int i=0; i<cnt; i++){ //위의 테이블에서 입력한 추가할 파일수를 위의 스크립틀릿에서 cnt에 저장했음 %> 
			<input type="file" name="upFile<%=i%>" size="50"/> <!-- 이름을 다르게 해주기 위해 반복문의 변수 i를 이용-->
			<%} %>
		</td>	
		<td><input type="button" value="업로드" onclick="fnElementChk(this.form)"/></td>
		<!-- this는 이 버튼, 이것이 속해있는 form객체 전부를 의미. this만 하면 버튼에 대한 정보만 넘어감 -->
	</tr>
</table>
</form>
</body>
</html>