<%@page import="com.jdbc.model.MemberVO"%>
<%@page import="com.jdbc.model.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "";
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	String gender = "";
	
	//url접근 제한
	if(session.getAttribute("id") == null){
		response.sendRedirect("login.jsp");
	}
	//회원정보를 조회해서 가지고오는 코드
	//id는 세션에서 얻는다
	String id = (String)session.getAttribute("id");
	
	//1.DAO객체 생성
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = dao.getInfo(id);
	
	name = vo.getName();
	phone1 = vo.getPhone1();
	phone2 = vo.getPhone2();
	phone3 = vo.getPhone3();
	gender = vo.getGender();

	//DB연결에 필요한 변수선언
	/*
	1. id기반으로 데이터베이스에서 select구문으로 값을 조회해서 가지고온다
	2. 조회한 결과를 태그안에 미리 갖도록 하는 코드를 작성하세요
	*/
/* 
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String uid = "JSP";
	String upw = "JSP";
	
	String sql = "select * from members where id = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			name = rs.getString("name");
			phone1 = rs.getString("phone1");
			phone2 = rs.getString("phone2");
			phone3 = rs.getString("phone3");
			gender = rs.getString("gender");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	input 태그에 미리값을 갖게하려면 value속성을 이용한다
	input 태그의 값을 읽기만 하용하는 것 readonly
	select태그의 미리선택은 selected
	radio, checkbox태그의 미리선택은 checked
	태그의 사용을 막는 옵션은 disabled :절대막는것
	 -->
	<h2>회원정보수정</h2>
	
	<form action="update_ok.jsp" method="post">
		아이디:<input type="text" name="id" size="10" value="<%=id%>" readonly><br>
		이름:<input type="text" name="name" size="10" value="<%=name%>"><br>
		전화번호:
		<select name="phone1">
			<option <%=phone1.equals("010")? "selected" : "" %>>010</option>
			<option <%=phone1.equals("031")? "selected" : "" %>>031</option>
			<option <%=phone1.equals("02")? "selected" : "" %>>02</option>
		</select>
		-<input type="text" name="phone2" size="10" value="<%=phone2%>">
		-<input type="text" name="phone3" size="10" value="<%=phone3%>"><br>
		성별:
		<% if(gender == null || gender.equals("m")) {%>
		<input type="radio" name="gender" value="m" checked>남자
		<input type="radio" name="gender" value="w">여자
		<%}else{ %>
		<input type="radio" name="gender" value="m">남자
		<input type="radio" name="gender" value="w" checked>여자
		<%} %>
		<br>
		<input type="submit" value="수정">
	
	</form>

</body>
</html>