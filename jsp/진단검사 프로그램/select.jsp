<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@ include file="layout/db_connect.jsp" %>
   
<%
    String sql = "SELECT P_NO, P_NAME, " +
        "SUBSTR(P_BIRTH, 1, 4) || '년' || SUBSTR(P_BIRTH, 5, 2) || '월' || SUBSTR(P_BIRTH, 7, 2) || '일' AS P_BIRTH, " +
        "CASE WHEN P_GENDER = 'M' THEN '여' " +
        "     WHEN P_GENDER = 'F' THEN '남' " +
        "     ELSE '중성' END AS P_GENDER, " +
        " P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3 AS P_TEL, " +
        " CASE P_CITY " +
        "     WHEN '10' THEN '서울' " +
        "     WHEN '20' THEN '대전' " +
        "     WHEN '30' THEN '대구' " +
        "     WHEN '40' THEN '광주' " +
        "     WHEN '50' THEN '성남' " +
        "     WHEN '60' THEN '수원' " +
        "     WHEN '70' THEN '분당' " +
        "     WHEN '80' THEN '용인' " +
        "     WHEN '90' THEN '과천' " +
        "     ELSE '사는곳이 한국일까요?' END AS P_CITY " +
        " FROM TBL_PATIENT_202004";

    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>진단검사 프로그램</title>
</head>
<body>
<header>
    <jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
    <jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<main id="section">
    <h3 class="title">환자조회</h3>
    <div class="scroll">
        <table class="table_line">
            <tr>
                <th>환자번호</th>
                <th>환자성명</th>
                <th>생년월일</th>
                <th>성별</th>
                <th>전화번호</th>
                <th>지역</th>
            </tr>
            <% while(rs.next()) { %>
            <tr align="center">
                <td class="link"><%= rs.getString("P_NO") %></td>
                <td> <%= rs.getString("P_NAME") %></td>
                <td> <%= rs.getString("P_BIRTH") %></td>
                <td> <%= rs.getString("P_GENDER") %></td>
                <td> <%= rs.getString("P_TEL") %></td>
                <td> <%= rs.getString("P_CITY") %></td>
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


<h2 class="title">강사조회(teacher_list.jsp)</h2>
        <table class="table_line" border="">
            <tr> <th>강사코드</th> <th>강사명</th> <th>강의명</th> <th>수강료</th> <th>강사자격취득일</th> </tr>
        
            <!-- 변동이 없는 부분 -->
            <% while(rs.next()){ %>
                <tr align="center">
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                </tr>
            <% } %>
            <!-- 변동이 있는 부분 -->
        </table>
