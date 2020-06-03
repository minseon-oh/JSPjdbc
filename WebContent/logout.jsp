<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세선정보를 지운다
	session.invalidate();
	//페이지이동
	response.sendRedirect("login.jsp");
%>