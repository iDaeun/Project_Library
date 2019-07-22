<%@page import="book.model.BookJung"%>
<%@page import="book.service.BookJungService"%>
<%@page import="book.service.BookNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="book.service.BookDeleteService"%>
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
	String book_aut = request.getParameter("bookaut");

	BookJungService jungservice = BookJungService.getInstance();
	BookDeleteService service = BookDeleteService.getInstance();
	int rCnt = 0;
	int rCnt2 = 0;
	boolean chk = false;
	String msg = "";
	BookJung bookjung = jungservice.jungbook(book_name, book_aut);
	
	if(bookjung != null){
	
	try{
		rCnt = service.deleteBook(book_name,book_aut);
		rCnt2 = service.deleteBook2(book_name,book_aut);
		chk = true;
	} catch (SQLException e){
		msg = e.getMessage();
	} catch (BookNotFoundException e ) {
		msg = e.getMessage();
	
	}
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
			<h2><% if(chk){ %>
				입력하신 <%= book_name %> 책이 삭제되었습니다.
			<%}else{ %>
				입력하신 정보가 일치하는 책이 없습니다.
			<%} %>
			</h2>
			
			
			
			
</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>