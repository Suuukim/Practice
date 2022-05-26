<%@page import="koreait.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<title>회원등록</title>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=deivce-width, inital-scale=1.0">
	<title>회원 정보 수정 화면</title>
	<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<style>
	td,th{
		border:1px dotted gray;
	}
	td.col1_title{
		text-align: center;
		font-weigtht: bold;
		width: 40%;
		padding: 7px;
	}
	input[type=text]{
		padding: 5px;
		margin-left: 10px;
	}
	button{
		padding: 5px 15px;
		margin: 5px;
	}
</style>
<script src="0_member_valid.js"></script>
<script type="text/javascript">
	function isSubmit(){
		const frm = document.forms[0];
			if(valid_check()){	//유효성 검사 함수를 호출/실행.
				//유효성 검사 통과
				frm.submit();
				out.print("<script>alert('회원정보 수정 완료했습니다. !');location.href='1_home.jsp'");
			}
	}
	function init() {
		const frm = document.forms[0];
		frm.name.value="";
		frm.tel.value="";
		frm.addr.value="";
		frm.grade.value="";
		frm.city_code.value="";
	}
	function list(){
		
	}
</script>	
<body>
<%
		Member member = (Member)request.getAttribute("member");
		if(member==null){
			out.print("<script>alert('검색결과가 없습니다.');location.href='memberList.jsp';");
			out.print("</script>");
		}
%>
<div class="wrap_container">
	<header>
		<h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
	</header>
		<!-- top.jsp를 include -->
	<%@include file="top.jsp" %>
		<section>
			<h2 style="text-align: center;" class="section"><strong>홈쇼핑 회원 정보 수정</strong></h2>
			<form action="6_updateSave.jsp" method="post">
				<input type="hidden" name="num" value="<%= member.getCustNo() %>">
			
				<table style="width: 70%; margin:auto">
					<tr>
						<td class="col1_title">회원번호(자동발생)</td>
						<td><input type="text" name="num" value="<%= member.getCustNo() %>" disabled="disabled"></td>
					</tr>
					
				</table>
			
			
			</form>
		</section>
		
</div>
</body>
</html>