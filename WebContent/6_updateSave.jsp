<%@page import="koreait.dao.MemberDao"%>
<%@page import="koreait.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 처리</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		//phone,address,city 입력값 가져오기와 update 조건값 custno도 가져오기
		String phone = request.getParameter("tel");
		String address = request.getParameter("addr");
		String grade = request.getParameter("grade");	
		String city = request.getParameter("city_code");
		int custno = Integer.parseInt(request.getParameter("num"));
		
		Member vo = new Member();
		vo.setAddress(address);
		vo.setPhone(phone);
		vo.setCity(city);
		vo.setCustNo(custno);
		vo.setGrade(grade);
		
		MemberDao dao = MemberDao.getInstance();
		dao.update(vo);
		out.print("<script>alert('회원 정보 수정 완료했습니다.!');location.href='1_home.jsp'");
		out.print("</script>");
	%>
	
</body>
</html>