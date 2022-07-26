<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function go_payment(pNum, pPrice){
	var n = pNum;
	var p = pPrice;
	document.frm.submit();
	document.frm.action="ShopServlet?command=payment&pNum="+n+"&pPrice="+p;
	
}
function go_cart(pNum){
	var n = pNum
	document.frm.submit();
	document.frm.action="ShopServlet?command=cart_insert&pNum="+n;
}
</script>
<style>
html,body{
margin:0;
padding:0;
height:100%;
}
#big{
position:relative;
min-height:100%;
}
#small{
margin-left:180px;
padding-bottom:200px;
}
.product_img{

width:300px;
height:270px;
}
.div_img{

display:inline-block;
margin-left:400px;
margin-right:50px;
padding-top:20px;
}
#product_detail{
position:absolute;
width:400px;
height:300px;
right:550px;
top:220px;
}
#product_name{
font-weight:bold;
font-size:20px;
}
#purchase_button{
background-color:black;
color:white;
width:100px;
height:30px;
}
#option_tab{
border-collapse:collapse;
}
#product_price{
top:85px;
position:absolute;
width:200px;
height:20px;
left:190px;
font-weight:bold;
color:red;
size:20px;
}
p{
font-size:13px;
}
ul li{
font-size:13px;
}
#details{
margin-left:400px;
border:2px solid gray;
width:900px;
height:440px;
text-align:center;
}
#price_font{
color:red;
font-weight:bold;
}
.go_review{
font-size:14px;
border:1px solid black;
}
</style>
</head>
<body>

<div id="big">
<jsp:include page="../include/header_notlogin.jsp"></jsp:include>
<div id="small">
<form name="frm" method="post">
	
	<div class="product_img div_img">
		<img class="product_img" src="${product.pImg}"><br>
		<div id="product_option">
			[옵션선택]<br>
	수량 	<input type="number" name="cnt" value="1" style="text-align:center; width:50px;"/>
	<hr>
	<table>
		<tr>
			<td width="150">상품 가격</td>
			<td width="230" align="right"><span id="price_font"><fmt:formatNumber value="${product.pPrice}" type="currency"/></span></td>
		</tr>
	</table>
	</div>
	</form>
	<br>
		<div align="right">
	<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<input id="purchase_button" type="button" value="구매하기" onclick="location='ShopServlet?command=login_form'">
				<input id="purchase_button" type="button" value="장바구니 담기" onclick="location='ShopServlet?command=login_form'">
			</c:when>
	<c:otherwise>
			<input id="purchase_button" type="submit" value="구매하기"
			onclick="go_payment(${product.pNum},${product.pPrice})">
			<input id="purchase_button" type="submit" value="장바구니 담기"
			onclick="go_cart(${product.pNum})">
	</c:otherwise>
	</c:choose>
		</div>
	</div>
	<div id="product_detail">
	<span id="product_name">${product.pName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="go_review"><a href="ShopServlet?command=review&pNum=${product.pNum}" class="a_tag">구매후기 보러가기</a></span>
	<hr size="2" color="gray">
	가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight:bold"><fmt:formatNumber value="${product.pPrice}" type="number"/></span>
	<hr style="border:1px dotted lightgray">
	<p>
	<b>배송 안내</b><br>
	배송비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight:bold">3,000원</span><br>
	배송기간  &nbsp;&nbsp; 평균 입금완료일 기준 2~4영업일이 소요됩니다<br>
	배송지역  &nbsp;&nbsp; 전국 (일부지역 제외)
	</p>
	<p>
	<b>교환, 반품 안내</b><br>
	교환/반품 기간  &nbsp;&nbsp; 상품 수령후, 2주 이내)<br>
	(단, 상품 오배송 및 상품하자의 경우 수령일로부터 3개월 이내<br>혹은 그 사실을 안 날로부터 30일 이내)
	교환/반품 절차  &nbsp;&nbsp; 배송완료 후 2주 이내 마이페이지에서 신청할 수 있습니다.<br>
	반품 배송비  &nbsp;&nbsp; 단순변심에 의한 교환/반품시 배송료가 부과됩니다.<br>
	교환/반품 반송지  &nbsp;&nbsp; 서울시 송파구 가락시장역<br>
	<ul>
		<li>교환/반품 가능 기간 초과하였을 경우
		<li>고객님의 요청에 의해 제품 사양이 변경된 경우
		<li>제품을 이미 사용하였거나, 제품을 일부 소비한 경우
		<li>고객님의 귀책사유 등으로 회수가 지연된 경우
		<li>제품을 세탁하거나 수선하는 등 타업체에서 선 처리한경우
	</ul>
	</p>
	</div>
	<br><br><br><br><br>
	
	<article id="details">
		상세정보<br>
		${product.pDetailInfo}
	</article>
</div><!-- small -->

<div id="footer">
<jsp:include page = "../include/footer.jsp"></jsp:include>
</div>
</div><!-- big -->

</body>
</html>