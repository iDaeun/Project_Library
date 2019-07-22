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
<style>

	#context{
		padding: 30px;
	}
	
	#ct{
		height: 300px;
	}
	
	table{
		margin: 0 auto;
		font-size: 20px;
		height: 100%;
		width: 400px;
	}
	form{
		height: 100%
	}
	 td{
		text-align: center;
		font-weight: bold;
		
	}
	
	
	
	input[type=text]{
		border-radius: 10px;
		border: 1px solid black;
	}
	input[type=submit]{
			
            
            border-radius: 5px;
            font-size: 18px;
			font-weight: bold;
			background-color: black;
			color: white;
        }
</style>
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
			<div id="ct">
			<form action="BookWrite.jsp" method="post">
			<table id="tb">
				<tr>
					<td>책제목</td><td><input type="text" name="book_name"></td>
				</tr>
				<tr>
					<td>작가</td><td><input type="text" name="book_aut"></td>
				</tr>
				<tr>
					<td>출판사</td><td><input type="text" name="book_pub"></td>
				</tr>
				<tr>
					<td>장르</td><td><input type="text" name="book_ge"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="책 추가하기"></td>
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
