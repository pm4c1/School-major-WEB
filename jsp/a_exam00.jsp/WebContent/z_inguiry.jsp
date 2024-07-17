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
