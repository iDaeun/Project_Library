<%@page import="book.service.BookTurnService"%>
<%@page import="book.service.BookRentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
LoginInfo loginInfo = (LoginInfo)session.getAttribute("login");
String user_id = loginInfo.getUser_id();
		String book_name = request.getParameter("bookname");
		boolean chk = false;
		int rCnt = 0;
		
		BookTurnService service = BookTurnService.getInstance();
		
		
		if(user_id != null){
			
			try {
				rCnt = service.BookTurn(user_id, book_name);
				chk = true;
			} catch(Exception e){
				
			}
			}else{%>
			<script>alert('로그인을 해주세요.');
				location.href = "BookTurnForm.jsp";
			</script>
			
	<%}	%>
	
		
		




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
			<div id="ct">
			
			<% if(rCnt == 0){ %>
				<h2 style="text-align: center;center;font-weight: bold;">입력하신 책이 없습니다.</h2>
			<% }else{ %>
			<h2 style="text-align: center;center;font-weight: bold;"> <%= book_name %> 책을 반납하셨습니다.</h2>
			
				<%} %>
			</div>
		</div>
		
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>