<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go_save() {
		if (document.frm.password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.frm.pwd.focus();
		} else if ((document.frm.password.value != document.frm.passwordCheck.value)) {
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.pwd.focus();
		} else if (document.frm.email.value == "") {
			alert("이메일을 입력해 주세요.");
			document.frm.email.focus();
		} else if (document.frm.phone.value == "") {
			alert("연락처를 입력해 주세요.");
			document.frm.email.focus();
		} else if (document.frm.address.value == "") {
			alert("주소를 입력해 주세요.");
			document.frm.email.focus();
		} else {
			document.frm.action = "ShopServlet?command=mypage4_1_updateAction&id=${sessionScope.loginUser.id}";
			document.frm.submit();
		}
	}
</script>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#mypage_div {
	position: absolute;
	left: 600px;
	border: 1px solid black;
	width: 900px;
	height: 80px;
	text-align: left;
}

#mypage_span {
	font-size: 30px;
	font-weight: bold;
}

#big {
	min-height: 100%;
	position: relative;
}

#small {
	padding-bottom: 200px; /* footer의 높이 */
}

#mypage_table_div {
	margin-top: 83px;
	margin-left: 597px;
	border-collapse: collapse;
	color: gray;
	width: 330px;
}
#mypage_table{
position:absolute;
left:600px;
top:275px;
border-collapse:collapse;
border:1px solid gray;
color:gray;
margin-top:10px;
}

#mypage_table th:hover {
	background: black;
	color: white;
}

#mypage_table th {
	border: 1px solid gray;
}

#wrapper {
	display: table;
	margin-left: 30%;
	margin-top: 20px;
}

#main {
	margin-left: 200px;
}

#checkbut {
	width: 100px;
	margin: auto;
	display: block;
}
.a_tag2{
text-decoration:none;
color:black;
}
.a_tag2:hover{
background:black;
color:white;
}
</style>
</head>
<body>
	<form name="frm" method="post" action="ShopServlet?command=mypage4_1_updateAction">
		<div id="big">
			<div id="small">
				<div id="header">
					<jsp:include page="../include/header_notlogin.jsp"></jsp:include>
				</div>
				<div id="mypage_div">
					<br>
					<span id="mypage_span">마이페이지 </span>&nbsp;&nbsp;&nbsp; 홍길동 회원님을 위한
					마이페이지 입니다.
				</div>
				<!-- mypage div -->
				<div id="mypage_table_div">
					<table id="mypage_table">
						<tr>
				<th><a href="ShopServlet?command=mypage_1&id=${sessionScope.loginUser.id}" class="a_tag2">구매내역</a></th>
				<th><a href="ShopServlet?command=mypage3_1_moveAction&id=${sessionScope.loginUser.id}" class="a_tag2">회원정보</a></th>
				<th><a href="ShopServlet?command=mypage_5&id=${sessionScope.loginUser.id}" class="a_tag2">내 구매후기</a></th>
				<th><a href="ShopServlet?command=mypage_6&id=${sessionScope.loginUser.id}" class="a_tag2">내 문의내역</a></th>
					</table>
				</div>
				<br>
				<div id="wrapper">

					<div id="main">

						<div id="name">

							이름 <input type="text" style="margin-left: 73px"
								value="${client.name}" readonly>
						</div>
						<br>
						<div id="id">
							아이디 <input type="text" style="margin-left: 58px"
								value="${client.id}" readonly>

						</div>
						<br>

						<div>

							<div id="pw">

								비밀번호 <input type="password" name="password"
									style="margin-left: 43px" value="${client.pw}">
							</div>
						</div>
						<br>
						<div>
							<div id="pwcheck">
								비밀번호 확인 <input type="password" name="passwordCheck"
									style="margin-left: 5px" value="${client.pw}">
							</div>
						</div>
						<br>
						<div id="phone">
							휴대전화 <input type="text" value="${client.phone}"
								style="margin-left: 43px" name="phone">

						</div>
						<br>
						<div id="email">
							이메일 <input type="text" name="email" style="margin-left: 57px"
								value="${client.email}">
						</div>
						<br>
						<div id="address">
							주소 <input type="text" id="address_kakao" name="address"
								style="margin-left: 73px; width: 300px;"
								value="${client.address}" />
						</div>
						<br>
						<div id="address_detail">
							상세주소 <input type="text" name="address_detail"
								style="margin-left: 41px" />
						</div>
					</div>
				</div>
				<br> <br>
				<div id="checkbut">
					<input type="button" id="loginbut" value="회원정보수정" onclick="go_save()">
	</form>
	</div>
	</div>

	<div id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include></div>
	</div>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document
				.getElementById("address_kakao")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("address_kakao").value = data.address; // 주소 넣기
											document
													.querySelector(
															"input[name=address_detail]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
</script>
</html>