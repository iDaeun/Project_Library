<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Library Homepage</title>

<!-- css연결 -->
<link href="css/default.css" rel="stylesheet" type="text/css">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">@@메인페이지@@</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>
