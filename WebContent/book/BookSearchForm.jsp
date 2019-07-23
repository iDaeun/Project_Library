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
<script>
	$(document).ready(function () {
    $('#search').submit(function (event) {
        // Ajax 요청을 수행합니다.
        $('#search2').load('BookSearch.jsp', $(this).serializeArray());
       	$('#search2').css('Backgound-color','red');
       	$('#search2').css('font-size', '25px');
       	
        // 기본 이벤트를 제거합니다.
        event.preventDefault();
    });
});
	
</script>
<style>
	table{
            margin: 0 auto;
        }
       
       
        input[type=text]{
            width: 450px;
            height: 40px;
            font-size: 30px;
            border-radius: 15px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid black;
        }
        
        .bookname{
            font-weight: 600;
            font-size: 40px;
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
        span{
        	margin-right: 25px;
        	
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
			<div id="ct"><form id="search">
			<table class="bookname">
				<tr>
					<td><div class="bookname">책이름으로 검색해주세요</div></td>
				</tr>
				<tr>
					<td><input type="text" name="bookname"></td>
					<td><input type="submit" value="검색">
				</tr>
				
			</table>
			</form>
			<div id="search2">
		
			</div>
			</div>
		</div>
		
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>