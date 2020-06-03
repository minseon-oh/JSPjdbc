<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1.필요한 값을 (id)를 얻는다.
	2.executeUpdate()구문으로 실행을 시키고 탈퇴성공시 세션삭제, login페이지로 리다이렉트
		실패시에는 login_welcome페이지로
	*/
	if(session.getAttribute("id") == null){
		response.sendRedirect("login.jsp");
	}
	String id = (String)session.getAttribute("id");
	
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.delete(id);
	
	if(result == 1){
		session.invalidate();
		response.sendRedirect("login.jsp");
	}else{
		response.sendRedirect("login_welcome.jsp");			
	}
	
/* 
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "delete from members where id = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			session.invalidate();
			response.sendRedirect("login.jsp");
		}else{
			response.sendRedirect("login_welcome.jsp");			
		}

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e){
			
		}
	} 
*/

%>