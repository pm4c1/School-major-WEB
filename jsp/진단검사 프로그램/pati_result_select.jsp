<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="layout/db_connect.jsp"%>
<%
	String sql = " select p.p_no, p.p_name, l.t_name, "
					+ " to_char(r.t_sdate, 'yyyy-mm-dd') t_sdate, " 
					+ " case r.t_status when '1' then '검사중' else '검사완료' end t_status, "
					+ " to_char(r.t_ldate, 'yyyy-mm-dd') t_ldate, " 
					+ " case r.t_result when 'X' then '미입력' when 'P' then '양성' else '음성' end t_result "
			+ " from tbl_patient_202004 p, tbl_result_202004 r, tbl_lab_test_202004 l "
			+ " where p.p_no = r.p_no and r.t_code = l.t_code ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>진단검사 프로그램</title>
<style>
th {
	background-color: #F5BA4E;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">검사결과조회</h3>
		<div class="scroll">
			<table class="table_line">
					<tr class="show">
						<th>환자번호</th>
						<th>환자명</th>
						<th>검사명</th>
						<th>검사시작일</th>
						<th>검사상태</th>
						<th>검사종료일</th>
						<th>검사결과</th>
					</tr>
				<% while  (rs.next()) { %>
					<tr align="center">
						<td><%= rs.getString("p_no") %></td>
						<td><%= rs.getString("p_name") %></td>
						<td><%= rs.getString("t_name") %></td>
						<td><%= rs.getString("t_sdate") %></td>
						<td><%= rs.getString("t_status") %></td>
						<td><%= rs.getString("t_ldate") %></td>
						<td><%= rs.getString("t_result") %></td>
					</tr>
				<% } %>
				</table>
		</div>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
