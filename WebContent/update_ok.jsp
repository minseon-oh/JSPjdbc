<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	/*
	1.DAO에 update()메서드를 생성한다
	2.폼값을 update()메서드에 전달하고 sql문을 실행
	3.executeUpdate()가 1을 반환하면 update_success로 리다이렉트
		0반환하면 update_fail로 
	*/
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = new MemberVO(id, null, name, phone1, phone2, phone3, gender);
	int result = dao.update(vo);
	
	if(result == 1){
		response.sendRedirect("update_success.jsp");
	}else{
		response.sendRedirect("update_fail.jsp");
	}
	
	/* 
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "update members set name = ?,phone1 = ?, phone2 = ?, phone3 = ?, gender = ? where id = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone1);
		pstmt.setString(3, phone2);
		pstmt.setString(4, phone3);
		pstmt.setString(5, gender);
		pstmt.setString(6, id);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			response.sendRedirect("update_success.jsp");
		}else{
			response.sendRedirect("update_fail.jsp");
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