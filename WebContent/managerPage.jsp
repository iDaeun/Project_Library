<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Manager Page</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<style>
	#nav {
	            width: 70%
	        }
</style>

</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="frame/header1.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="frame/nav1.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">@@메인페이지@@</div>
		</div>
		<!-- context 끝 -->

	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
