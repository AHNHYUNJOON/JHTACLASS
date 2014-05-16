<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>도서 주문 페이지</h1>
<!-- http://localhost:8080 -->
<form method="post" action="/MVCApp/cart"><!-- 절대경로로 해야 장바구니에 담기를 여러번 눌러도 에러 안남 -->
<input type="hidden" name="command" value="ADD" />
<!--각 JSP페이지의 모든 요청이 다 북컨트롤러.java로 가기 때문에 구분해주기 위해 -->

	<b> 도서 선택 : </b>
	<select name="book">
		<option>어린 왕자/ 생떽쥐페리 /15000/ </option> <!-- 밸류값을 지정안하면 텍스트값이 기본으로 밸류가 됨 -->
		<option>연금술사/ 파올로 코엘료 /21000/ </option><!-- 하나의 옵션선택에서 DTO객체가 하나 만들어지고 추가할 때마다 하나씩 생김, 이를 다시 묶어서 저장하기 위한 컬렉션 객체가 필요-->
		<option>홍길동전/ 허균 /25000/ </option><!-- 하나의 옵션은  제목, 작가, 가격, 수량 등 네개의 정보로 나눠질 것임 (이 4개의 묶음이 하나의 DTO객체)-->
		<!-- 제목, 작가, 가격 들을 하나하나 분리 가능하지만 하나로 묶어서 저장하기 위해 BookDto.java 생성 -->
		<option>50 Greate Short Stories/ Corane, Milton /9800/ </option>	
	</select>
	<b>수량 : </b>
	<input type="text" name="quantity" size="2" value="1" />
	<input type="submit" value="장바구니에 담기"/>
</form>
<hr/>
<jsp:include page="cart.jsp" />
</body>
</html>