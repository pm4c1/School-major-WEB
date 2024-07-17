<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- import -->
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
<%     
        // java에서 Oracle DB에 있는 쿼리문을 불러옴
    	String sql="select custno, custname, phone, address, "
    	+" to_char(joindata,'yyyy-mm-dd') joindata, grade, city"
    	+" from member_tbl_02"
    	+" where custno = ?";

        // 사용하기 위한 변수 및 기능 생성
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, request.getParameter("custno"));
    	ResultSet rs = pstmt.executeQuery();
%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css?ver=1.1.1">
    <title>쇼핑몰 회원관리</title>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>

	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>

	<main id="section">
		<h3 class="title">홈쇼핑 회원 정보 조회</h3>
		<div class="scroll">
			<table class="table_line">
			<% if(rs.next()){ %>
					<tr>
						<th>회원번호</th>
						<td><%= rs.getString("custno") %></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><%=rs.getString("custname") %></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><%=rs.getString("phone") %></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><%=rs.getString("address") %></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><%=rs.getString("joindata") %></td>
					</tr>
					<tr>
						<th>고객등급 A-VIP B-일반 C-직원</th>
						<td><%=rs.getString("grade") %></td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td><%= rs.getString("city") %></td>
					</tr>
				<%}else{ %>
					<tr>
						<th>회원번호</th>
						<td><%= request.getParameter("custno") %> 등록된 자료가 없습니다</td>
					</tr>
				<% } %>
				<tr>
