<%@page import="koreait.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	//서버구현 코드는 html 태그 없이 작성할 수 있습니다.
	MemberDao dao = MemberDao.getInstance();
	int next = dao.getNextSeq();
	
	request.setAttribute("next",next);
	
	pageContext.forward("2_insertForm.jsp");		
	//이동할 페이지
%>