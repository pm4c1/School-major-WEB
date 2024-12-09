<%@ page import="java.sql.*"%>
<%@ include file="layout/db_connect.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진단검사 프로그램</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		var cv = document.data;
		
		if (!cv.p_no.value) {
			alert("환자번호가 입력되지 않았습니다!");
			cv.p_no.focus();
			return false;
		}
		
		else if (cv.t_code.value == "null") {
			alert("검사코드가 선택되지 않았습니다!");
			cv.t_code.focus();
			return false;
		}
		
		else if (!cv.t_sdate.value) {
			alert("검사일자가 입력되지 않았습니다!");
			cv.t_sdate.focus();
			return false;
		}
		
		else if (!cv.t_status.value) {
			alert("검사상태가 선택되지 않았습니다!");
			cv.t_status.focus();
			return false;
		}
		
		else if (!cv.t_ldate.value) {
			alert("검사완료일자가 입력되지 않았습니다!");
			cv.t_ldate.focus();
			return false;
		}
		
		else if (!cv.t_result.value) {
			alert("검사결과가 선택되지 않았습니다!");
			cv.t_result.focus();
			return false;
		}
		
		alert("검사결과가 정상적으로 등록 되었습니다!");
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">검사결과입력</h3>
		<form name="data" action="pati_result_input_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>환자번호</th>
					<td><input type="text" name="p_no" size="10" autofocus> 예)1001</td>
				</tr>
				<tr>
					<th>검사코드</th>
					<td>
						<select name="t_code" id="t_code">
							<option value="null" disabled selected>검사명</option>
							<option value="T001">T001</option>
							<option value="T002">T002</option>
							<option value="T003">T003</option>
							<option value="T004">T004</option>
							<option value="T005">T005</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>검사시작일자</th>
					<td><input type="text" name="t_sdate" size="10"> 예>20200101</td>
				</tr>
				<tr>
					<th>검사상태</th>
					<td class="radiogroup">
						<input type="radio" name="t_status" value="1"> 검사중
						<input type="radio" name="t_status" value="2"> 검사완료
					</td>
				</tr>
				<tr>
					<th>검사완료일자</th>
					<td><input type="text" name="t_ldate" size="10"> 예)20200101</td>
				</tr>
				<tr>
					<th>검사결과</th>
					<td class="radiogroup">
						<input type="radio" name="t_result" value="X"> 미입력
						<input type="radio" name="t_result" value="P"> 양성
						<input type="radio" name="t_result" value="N"> 음성
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="검사결과등록">
						<input type="button" value="다시쓰기" onclick="location.href='pati_result.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
