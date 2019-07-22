<%@page import="book.model.BookJung"%>
<%@page import="book.service.BookJungService"%>
<%@page import="book.model.BookModel"%>
<%@page import="book.service.WriteBookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bookmodel" class="book.model.BookModel"/>
<jsp:setProperty property="book_name" name="bookmodel"/>
<jsp:setProperty property="book_aut" name="bookmodel"/>
<jsp:setProperty property="book_pub" name="bookmodel"/>
<jsp:setProperty property="book_ge" name="bookmodel"/>
<%
	int cnt = 0;
	String book_name = bookmodel.getBook_name();	
	String book_aut = bookmodel.getBook_aut();
	String book_pub = bookmodel.getBook_pub();
	String book_ge = bookmodel.getBook_ge();

	BookJungService jungservice = BookJungService.getInstance();
	WriteBookService service = WriteBookService.getInstance();
	
	
	BookJung bookjung = jungservice.jungbook(book_name, book_aut);
	
	
	if(bookjung == null){
		cnt = service.write(bookmodel);
		
		service.write2();
	}else{
		cnt = 0;
	}  
	
	
	
	
%>

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
		
	}
	td{
		font-size: 30px;
		font-weight: bold;
		text-align: center;
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
			<table>
			<%if(cnt==1){ %>
				<tr>
					<td>정상적으로 책을 삽입 했습니다.</td>
				</tr>
				<%}else{%>
					<tr>
					<td>중복된 책입니다. 다시 확인해주세요.</td>
				</tr>
				<%} %>
				
				
				
				
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
