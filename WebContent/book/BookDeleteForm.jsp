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
	table{
		margin: 0 auto;
		width: 400px;
		height: 300px;
	}
	td{
		
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		
	}
	input[type=submit]{
            width: 70px;
            height: 42px;
            vertical-align: middle;
            border-radius: 5px;
            font-size : 20px;
            background-color: black;
			color: white;
        }
        input[type=text]{
		border-radius: 10px;
		border: 1px solid black;
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
			<div id="ct"><form action="BookDelete.jsp" method="post">
			<table>
				<tr>
					<td>책이름</td>
					<td><input type="text" name="bookname"></td>
					</tr>
					<tr>
					<td>작가</td>
					<td><input type="text" name="bookaut"></td>
					</tr>
					<tr>
					<td colspan="2"><input type="submit" value="삭제">
				</tr>
				<tr>
					<td colspan="2"><div>삭제하실 책이름 과 작가를 입력해주세요</div></td>
				</tr>
			</table>
			</form></div>
		</div>
		
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>