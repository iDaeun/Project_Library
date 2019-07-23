<%@page import="java.util.List"%>
<%@page import="book.model.RentalList"%>
<%@page import="book.service.BookRentListService"%>
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
LoginInfo loginInfo = (LoginInfo)session.getAttribute("login");
String user_id = loginInfo.getUser_id();

	BookRentListService service = BookRentListService.getInstance();
	
	List<RentalList> rentalList = service.rentalList(user_id);
	
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
	span{
		margin-right: 20px;
		font-size: 17px;
		font-weight: bold;
	}
	input[type=submit]{
			
            
            border-radius: 5px;
            font-size: 18px;
			font-weight: bold;
			background-color: black;
			color: white;
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
			<form action="BookTurn.jsp" method="post">
			<table>
			<%for(int i=0; i<rentalList.size();i++){%>
			
			<tr>
				<td><span>책이름 : <%= rentalList.get(i).getBook_name() %></span></td>
				<td><span>작가 : <%= rentalList.get(i).getBook_aut() %></span></td>
				<td><span>출판사 : <%= rentalList.get(i).getBook_pub() %></span></td>
				<td><span>장르 : <%= rentalList.get(i).getBook_ge() %></span></td>
				<td><span>대여일 : <%= rentalList.get(i).getRent_st() %></span></td>
				<td><span>반납일 : <%= rentalList.get(i).getRent_end() %></span></td>
				<td><input type="hidden" name="bookname" value="<%= rentalList.get(i).getBook_name() %>"></td>
				<td><input type="submit" value="반납">
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