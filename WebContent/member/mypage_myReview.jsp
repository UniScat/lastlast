<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#big {
	min-height: 100%;
	position: relative;
}

#small {
	padding-bottom: 200px; /* footer�� ���� */
}

#product_Info {
	padding-top: 50px;
	margin-left: 600px;
	width:900px;
}

#mypage_span {
	font-size: 30px;
	font-weight: bold;
}
#mypage_div{
position:absolute;
left:600px;
border:1px solid black;
width:900px;
height:80px;
text-align:left;
}
#mypage_table{
position:absolute;
top:72px;
border-collapse:collapse;
border:1px solid gray;
color:gray;
margin-top:10px;
}
#mypage_table th:hover {
	background: black;
	color: white;
}
#mypage_table th{
border:1px solid gray;
}
#product_info_table{
width:900px;
height:130px;
left:600px;
}
#product_info_table td{
height:200px;
text-align:center;
}
</style>
</head>
<body>
	<div id="big">
		<div id="small">
			<div id="header">
				<jsp:include page="../include/header_notlogin.jsp"></jsp:include>
			</div>
			<!-- header -->
			<hr size="2" style="color: lightgray">
			<div id="mypage_div">
				<br>
				<span id="mypage_span">���������� </span>&nbsp;&nbsp;&nbsp; ȫ�浿 ȸ������ ����
				���������� �Դϴ�.
				<table id="mypage_table">
					<tr>
						<th>���ų���</th>
						<th>ȸ������</th>
						<th>�� �����ı�</th>
						<th>�� ���ǳ���</th>
				</table>
			</div>
			<br><br><br><br><br><br>
			<div id="product_Info">
			<hr>
		<table id="product_info_table">
			<tr style="background:skyblue">
				<th colspan="2">��ǰ��</th>
				<th>��ǰ��</th>
				<th>�ۼ���</th>
			</tr>
			<tr>
				<td><img src="#"></td>
				<td>��ǰ��</td>
				<td>��ǰ��</td>
				<td>�ۼ���</td>
			</tr>
			<tr>
				<td><img src="#"></td>
				<td>��ǰ��</td>
				<td>��ǰ��</td>
				<td>�ۼ���</td>
			</tr>
			<tr>
				<td><img src="#"></td>
				<td>��ǰ��</td>
				<td>��ǰ��</td>
				<td>�ۼ���</td>
			</tr>
		</table>
			</div>
			
				
		</div>
		<!-- small -->
		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include></div>
	</div>
	<!-- big -->






</body>
</html>