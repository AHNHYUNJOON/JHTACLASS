<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>���� �ֹ� ������</h1>
<!-- http://localhost:8080 -->
<form method="post" action="/MVCApp/cart"><!-- �����η� �ؾ� ��ٱ��Ͽ� ��⸦ ������ ������ ���� �ȳ� -->
<input type="hidden" name="command" value="ADD" />
<!--�� JSP�������� ��� ��û�� �� ����Ʈ�ѷ�.java�� ���� ������ �������ֱ� ���� -->

	<b> ���� ���� : </b>
	<select name="book">
		<option>� ����/ �������丮 /15000/ </option> <!-- ������� �������ϸ� �ؽ�Ʈ���� �⺻���� ����� �� -->
		<option>���ݼ���/ �Ŀ÷� �ڿ��� /21000/ </option><!-- �ϳ��� �ɼǼ��ÿ��� DTO��ü�� �ϳ� ��������� �߰��� ������ �ϳ��� ����, �̸� �ٽ� ��� �����ϱ� ���� �÷��� ��ü�� �ʿ�-->
		<option>ȫ�浿��/ ��� /25000/ </option><!-- �ϳ��� �ɼ���  ����, �۰�, ����, ���� �� �װ��� ������ ������ ���� (�� 4���� ������ �ϳ��� DTO��ü)-->
		<!-- ����, �۰�, ���� ���� �ϳ��ϳ� �и� ���������� �ϳ��� ��� �����ϱ� ���� BookDto.java ���� -->
		<option>50 Greate Short Stories/ Corane, Milton /9800/ </option>	
	</select>
	<b>���� : </b>
	<input type="text" name="quantity" size="2" value="1" />
	<input type="submit" value="��ٱ��Ͽ� ���"/>
</form>
<hr/>
<jsp:include page="cart.jsp" />
</body>
</html>