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
			alert("ID�� �ùٸ��� �ʽ��ϴ�.");
			return false;
		}else if(!isPassword(obj.pw1)){
			alert("�н����尡 Ʋ�Ƚ��ϴ�.");
			return false;
		}

		else
			document.f.submit();
		/*����
		1. �н������� ���̴� �ݵ�� 4���� �̻����� �Ѵ�. isShort().
		2. �н������ �ݵ�� ���ڿ� ���ڸ� ȥ���ϰ� �Ѵ�.
			isAlphaNum()
		*/

		return true;
	}
</script>
</head>
<body>
<h3>�α��� ���ּ���</h3>

<form name="f" method="post" action="../index.jsp" 
		onsubmit="return fnCheckForm(this);">
	���̵� : <input type="text" name="id" id="id"/><br/><br/>
	�н����� : <input type="password" name="pw1" id="pw1"/><br/><br/>
	<input type="submit" value="�α���"/>

</form>
<form name="d" method="post" action="index.jsp" >
	<input type="submit" value="����ȭ�� ���ư���"/>
</form>
</body>
</html>

