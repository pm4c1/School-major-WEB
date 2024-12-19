<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql = " select a.teacher_code, a.class_name, a.teacher_name, "
			   + " (select sum(tuition) from tbl_class_202201 "
			   + " where teacher_code = a.teacher_code) tuition"
			   + " from tbl_teacher_202201 a";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="./css/style.css?ver=2">
</head>
<body>
	<header>
		<jsp:include page="./layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="./layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">강사매출현황</h3>
		<div class="scroll">
			<table class="table_line">
				<tr>
					<th>강사코드</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>
				<% DecimalFormat df = new DecimalFormat("\u00A4 #, ###,###"); %>
				<% while(rs.next()){ %>
				<tr align="center">
					<td><%= rs.getString("teacher_code") %></td>
					<td><%= rs.getString("class_name") %></td>
					<td><%= rs.getString("teacher_name") %></td>
					<td><%= df.format(rs.getInt("tuition")) %></td>
				</tr>
				<% } %>
			</table>
		</div>
	</main>
	
	<footer>
		<jsp:include page="./layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
