<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int global_cnt = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05</title>
</head>
<body>
<%
	int local_cnt = 0;

	// local	
	out.print("<br> local_cnt : ");
	out.print(++local_cnt);	
	
	// global
	out.print("<br> global_cnt : ");
	out.print(++global_cnt);	
%>
	
</body>
</html>
