<%@page import="koreait.dao.MemberDao"%>
<%@page import="koreait.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int custNo = Integer.parseInt(request.getParameter("num"));
		String custName = request.getParameter("name");
		String phone = request.getParameter("tel");
		String address = request.getParameter("addr");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city_code");
		
		Member vo = new Member(custNo,custName,phone,address,null,grade,city);
		MemberDao dao = MemberDao.getInstance();
		dao.insert(vo);
		out.print(dao.selectOne(vo.getCustNo()));
		if(dao.selectOne(vo.getCustNo()) != null) {
			out.print("<script>alert('회원등록 완료했습니다.!');location.href='home.jsp'");
			out.print("</script>");
		}
	%>
</body>
</html>