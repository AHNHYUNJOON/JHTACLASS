<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script type="text/javascript">
	function fnAddInput(){
		var cnt = document.forms[0].add.value;
		var div = document.getElementById("inputDiv");
		
		div.innerHTML = ""; //한번 더  fnAddInput() 메서드가 호출되면 공백이 되게....
		
		for(var i=0; i<cnt; i++){
			var str = "<input type='file' name=upFile" + i + "'/><br/>";
			div.innerHTML += str;
		}
	}
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
<h1>다중 파일 업로드</h1>
<form method="post" action="multiFile_proc.jsp" enctype="multipart/form-data">
<table width="60%" border="1">
<tr>
	<td>사용자</td>
	<td><input type="text" name="user"/></td>
	<td>제목</td>
	<td><input type="text" name="title"/></td>
</tr>
<tr>
	<td>하고 싶은 말 :</td>
	<td colspan="3"><textarea rows="3" cols="70" name="note"></textarea></td>
</tr>
<tr>
	<td colspan="4">
		추가할 파일 수 입력 : <input type="text" name="add"/>&nbsp;&nbsp;
		<input type="button" value="확인" onclick="fnAddInput()"/>
	</td>
</tr>
</table>
<table border="1">
	<tr>	
		<td>
			<div id="inputDiv"></div>
		</td>	
		<td><input type="button" value="업로드" onclick="fnElementChk(this.form)"/></td>
		<!-- this는 이 버튼, 이것이 속해있는 form객체 전부를 의미. this만 하면 버튼에 대한 정보만 넘어감 -->
	</tr>
</table>
</form>
</body>
</html>