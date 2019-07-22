<%@page import="book.dao.BookDao"%>
<%@page import="book.model.JoinModel"%>
<%@page import="book.model.BookModel"%>
<%@page import="book.service.BookSelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String book_name = request.getParameter("bookname");
	
	BookSelectService service = BookSelectService.getInstance();
	
	JoinModel joinmodel = service.selectBook(book_name);
	
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
			<form action="BookRent.jsp" method="post">
			<table>
			<% 
			if(joinmodel != null){
			%>
			
				<tr>
					<td>
				책이름 : <%= joinmodel.getBook_name() %>	
					</td>
					<td>
				작가 : <%= joinmodel.getBook_aut() %>	
					</td>
					<td>
				출판사 : <%= joinmodel.getBook_pub() %>	
					</td>
					<td>
				장르 : <%= joinmodel.getBook_ge() %>	
					</td>
					<td>
				대여여부 : <%= joinmodel.getBook_ren() %>	
				
					</td>
				</tr>
				<tr>
				<td><input type="hidden" name="bookname" value="<%= book_name %>"></td>
				<td><input type="submit" value="대여"></td>
				</tr>
			
				<%
			}else{
			%>
			<tr>
				<td>검색하신 책이 없습니다.</td>
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