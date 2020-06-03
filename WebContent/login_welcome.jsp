<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//url 주소로 접근하는 것을 막는 코드
	if(session.getAttribute("id") == null){
		response.sendRedirect("login.jsp");
	}
	String id = (String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=id %>님 로그인에 성공하였습니다</h2>
	<a href="logout.jsp">로그아웃</a>
	<a href="update.jsp">정보수정</a>
	<a href="delete_ok.jsp">회원탈퇴</a>
</body>
</html>