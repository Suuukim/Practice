<%@page import="koreait.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="koreait.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = MemberDao.getInstance();
	List<Member> list = dao.selectAll();
	
	request.setAttribute("list", list);
	pageContext.forward("4_memberlist.jsp");
%>