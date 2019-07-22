<%@page import="org.apache.catalina.filters.AddDefaultCharsetFilter"%>
<%@page import="book.model.BookListView"%>
<%@page import="book.service.GetBookListService"%>
<%@page import="sun.security.util.Length"%>
<%@page import="book.service.BookAllService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="book.model.AllModel"%>
<%@page import="java.util.List"%>
<%@page import="book.dao.BookDao"%>
<%@page import="book.model.JoinModel"%>
<%@page import="book.model.BookModel"%>
<%@page import="book.service.BookSelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
		String pageNumberstr = request.getParameter("page");
		int pageNumber = 1 ;
		if(pageNumberstr != null){
			pageNumber = Integer.parseInt(pageNumberstr);
		}
		GetBookListService listservice = GetBookListService.getInstance();
		BookListView booklist = listservice.getBookListView(pageNumber);	
		
		
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
	.book{
		margin-right: 18px;
		font-size: 13.5px;
		font-weight: bold;
	}
	.book1{
		
		margin-left: 600px;
	}	
	#ct{
		
		margin-bottom: 50px;
	}
	table{
		height: 300px;
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
			<table id="booklist">
			<%	for(AllModel allmodel : booklist.getallList()){%>
				<tr>
					<td><span class="book">책이름 : <%= allmodel.getBook_name() %></span></td>
					<td><span class="book">작가 : <%=  allmodel.getBook_aut() %></span></td>
					<td><span class="book">출판사 : <%=  allmodel.getBook_pub() %></span></td>
					<td><span class="book">장르 : <%=  allmodel.getBook_ge() %></span></td>
					<td><span class="book">회원아이디 : <%=  allmodel.getUser_id() %></span></td>
					<td><span class="book">대여여부 : <%=  allmodel.getBook_ren() %></span></td>
					<td><span class="book">대여일 : <%=  allmodel.getRent_st()%></span></td>
					<td><span class="book">반납일 : <%=  allmodel.getRent_end()%></span></td>
				</tr>
			<%}	%>
			
			</table>
			
			
			
			
			
</div>
			<span class="book1"></span>
			<%for(int i=1; i <= booklist.getPageTotalCount(); i++){	%>
				<a href="BookAll.jsp?page=<%= i%>" style="color: black; font-weight: bold;">[<%= i %>]</a> 
			<%}%>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	
</body>
</html>