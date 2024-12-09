<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="layout/db_connect.jsp"%>
<%
	String sql = " select c.city, c.city_name, count(r. p_no) count"
			+ " from city_code_tbl_02 c, tbl_result_202004 r, tbl_patient_202004 p "
			+ " where p.p_city = c.city and p.p_no = r.p_no "
			+ " group by c.city, c.city_name " 
			+ " order by c.city asc";
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
		<h3 class="title">(지역별)검사건수통계</h3>
		<div class="scroll">
			<table class="table_line">
					<tr class="show">
						<th>지역코드</th>
						<th>지역명</th>
						<th>검사건수</th>
					</tr>
				<% while  (rs.next()) { %>
					<tr align="center">
						<td><%= rs.getString("city") %></td>
						<td><%= rs.getString("city_name") %></td>
						<td><%= rs.getString("count") %></td>
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
