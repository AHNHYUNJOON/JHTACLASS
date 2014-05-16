<%@ page  contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script type="text/javascript" src="check.js"></script>
<script type="text/javascript">
	function fnCheckForm(obj){
		if(!isId(obj.id)){
			alert("ID가 올바르지 않습니다.");
			return false;
		}else if(!isPassword(obj.pw1)){
			alert("패스워드가 틀렸습니다.");
			return false;
		}

		else
			document.f.submit();
		/*과제
		1. 패스워드의 길이는 반드시 4글자 이상으로 한다. isShort().
		2. 패스워드는 반드시 문자와 숫자를 혼용하게 한다.
			isAlphaNum()
		*/

		return true;
	}
</script>
</head>
<body>
<h3>로그인 해주세요</h3>

<form name="f" method="post" action="../index.jsp" 
		onsubmit="return fnCheckForm(this);">
	아이디 : <input type="text" name="id" id="id"/><br/><br/>
	패스워드 : <input type="password" name="pw1" id="pw1"/><br/><br/>
	<input type="submit" value="로그인"/>

</form>
<form name="d" method="post" action="index.jsp" >
	<input type="submit" value="메인화면 돌아가기"/>
</form>
</body>
</html>

