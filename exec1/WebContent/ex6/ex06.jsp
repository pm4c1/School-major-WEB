<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06</title>
</head>
<body>
	<form action="./ex06_result.jsp" method="post">
		국어 : <input type="text" name="kor" required><br>
		영어 : <input type="text" name="eng" required><br>
		수학 : <input type="text" name="mat" required><br>
		정보 : <input type="text" name="inf" required><br>
		입력 <input type="submit" value="제출">
			<input type="reset" value="재입력">
	</form>
</body>
</html>
