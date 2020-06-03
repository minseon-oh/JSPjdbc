<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.login(id, pw);
	
	if(result == 1){
		session.setAttribute("id", id);
		response.sendRedirect("login_welcome.jsp");
	}else{
		response.sendRedirect("login_fail.jsp");
	}
	
	/*
	1. DAO에 login메서드를 만들고 필요한 값 전달
	2. login메서드 안에서는 DB연결작업을 처리하고 결과를 반환
	3. 결과에 따라 성공, 실패페이지로 리다이렉트
	*/
	
/* 	//DB연결정보선언
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";

	String sql = "select * from members where id = ? and pw = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		//1.데이터베이스에서 쿼리문을 전송하고 rs.next()가 있다면, 
		//세션에 아이디정보를 저장하고 login_welcome페이지로 리다이렉트
		//2.rs.next()가 없다면, login_fail페이지로 리다이렉트
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
	
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("id", id);
			response.sendRedirect("login_welcome.jsp");
		}else{
			response.sendRedirect("login_fail.jsp");
		}

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(Exception e){
			
		}
	}
 */
%>