<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="koreait.vo.Member"%>
<%@page import="koreait.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>
	td,th{
		border: 1px dotted gray;
	}
	td.col1_title {
		text-align: center;
		font-weight: bold;
		width: 40%;
		padding: 7px;
	}
	input[type=text]{
		padding: 5px;
		margin-left: 10px;
	}
	button {
		padding: 5px 15px;
		margin: 5px;
	}
</style>
<script src="0_member_valid.js"></script>

<body>
	<%	
		//jstl 라이브러리를 사용하면 이 코드는 작성하지 않습니다.
		Object temp = request.getAttribute("next");
		int next = (int)temp;		//형변환
	%>
	
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- viewport의 width를 디바이스에 맞추고 초기배율을 1.0으로 지정했으며, 다른설정은 지정하지않는다. -->
	<title>회원등록</title>
</head>
		<div class="wrap_container">
		<header>
			<h3 class="haeder-item">쇼핑몰 회원관리 ver1.0</h3>
		</header>
		<!-- top.jsp를 include -->
		<%@include file="top.jsp" %>
		
			<section>
				<h2 style="text-align:center;" class="section"><strong>홈쇼핑 회원 등록</strong></h2>
				<form action="3_insertSave.jsp" method="post">
					<input name="num" type="hidden" value="<%= next%>">
						<table style="width: 70%; margin:auto">
							<tr>
								<td class="col1_title">회원번호(자동발생)</td>
								<td><input type="text" name="num" value="<%= next%>" disabled="disabled"></td>
							</tr>
							<tr>
								<td class="col1_title">회원성명</td>
								<td><input type="text" name="name" required></td>
								<!-- required : 값이 입력되지 않았을 경우 브라우저에 있는 알림 화면이 나타남. -->
							</tr>
							<tr>
								<td class="col1_title">회원전화</td>
								<td><input type="text" name="tel" size="40"></td>
							</tr>
							<tr>
								<td class="col1_title">회원주소</td>
								<td><input type="text" name="addr" size="40"></td>
							</tr>
							<tr>
								<td class="col1_title">가입일자</td>
								<td><input type="text" name="reg_date" disabled="disabled"></td>
								<!-- disabled : 비활성화 시키는 속성  -->
							</tr>
							<tr>
								<td class="col1_title">고객등급[A:VIP,B:일반,C:직원]</td>
								<td><input type="text" name="grade"></td>
							</tr>
							<tr>
								<td class="col1_title">도시코드</td>
								<td><input type="text" name="city_code"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<button type="button" onclick="isSubmit()">등록</button>
									<button type="button" onclick="location.href='4_memberlist.jsp'">조회</button>
								</td>
							</tr>
						</table>
				</form>
			</section>
			<script type="text/javascript">
				function isSubmit() {
					const frm = document.forms[0];	
							if(valid_check()){		//유효성 검사 함수를 호출/실행.
								//유효성 검사 통과
								frm.submit();
							}
				function init() {
					const frm = document.forms[0];
					frm.name.value="";
					frm.tel.value="";
					frm.addr.value="";
					frm.grade.value="";
					frm.city_code.value="";
					
					}
				}
			</script>
			<script type="text/javascript">
					const reg = document.forms[0].reg_date;
					const today = new Date();
					const year = today.getFullYear();
					const month = (today.getMonth()+1).toString().padStart(2,0);
					const day = today.getDate().toString().padStart(2,0);
							reg.value=[year,month,day].join('');
			</script>
			<footer>
				<p>HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea</p>
			</footer>
		</div>
</body>
</html>