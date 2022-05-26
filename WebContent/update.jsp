<%@page import="koreait.vo.Member"%>
<%@page import="koreait.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String custno = request.getParameter("custno");
	int no = 0;
	
	try {
			no = Integer.parseInt(custno);
			MemberDao dao = MemberDao.getInstance();
			Member member = dao.selectOne(no);
			if(member != null) {
				request.setAttribute("member", member);
				pageContext.forward("5_updateForm.jsp");
			}else {
				out.print("<script>alert('검색결과가 없습니다.');location.href='memberList.jsp';");
				out.print("</script>");
			}
	}catch(NumberFormatException e) {
		out.print("<scrpt>alert('잘못된 검색값입니다.');location.href='memberList.jsp';");
		out.print("</script>");
	}
%>