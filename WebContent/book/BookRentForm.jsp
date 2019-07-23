<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="/lib/css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="/lib/cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/lib/js/bootstrap.js"></script>

</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="../frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		
		<div id="context">
			<div id="ct"><form action="BookRent.jsp" method="post">
			<table>
				<tr>
					<td><input type="text" name="bookname"></td>
					<td><input type="submit" value="대여">
				</tr>
				<tr>
					<td><div>대여하실 책이름을 입력해주세요</div></td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>