<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- import -->
<%@ page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
<% 
    	String sql="select custno, custname, phone, address, "
    	+" to_char(joindata,'yyyy-mm-dd') joindata, grade, city"
    	+" from member_tbl_02"
    	+" where custno = ?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, request.getParameter("custno"));
    	ResultSet rs = pstmt.executeQuery();
%> 
