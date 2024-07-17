<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css?ver=1.1.1">
<title>쇼핑몰 회원관리</title>
<script type="text/javascript">
    function checkValue() {
        var cv = document.data;

        if(!cv.custno.value){
            alert("회원번호을 입력하세요.");
            cv.custno.focus();
            return false;
        }
		
        for (var i = 0; i < cv.custno.value.length; i++) {
            var c = cv.custno.value.charCodeAt(i);
            if (c < 48 || c > 57) {
                alert("숫자를 입력하세요.");
                cv.custno.focus();
                return false;
            }
        }
    }
</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
