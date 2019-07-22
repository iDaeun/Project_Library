<%@page import="book.dao.BookDao"%>
<%@page import="book.model.JoinModel"%>
<%@page import="book.model.BookModel"%>
<%@page import="book.service.BookSelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String book_name = request.getParameter("bookname");

	BookSelectService service = BookSelectService.getInstance();

	JoinModel joinmodel = service.selectBook(book_name);
%>
<form action="BookRent.jsp" method="post">
	<table style="margin-top: 20px;">
		<%
			if (joinmodel != null) {
		%>

		<tr>
			<td><span>책이름 : <%=joinmodel.getBook_name()%></span></td>
			<td><span>저자 : <%=joinmodel.getBook_aut()%></span></td>
			<td><span>출판사 : <%=joinmodel.getBook_pub()%>
			</span></td>
			<td><span>장르 : <%=joinmodel.getBook_ge()%></span></td>
			<td><span>대여여부 : <%=joinmodel.getBook_ren()%></span></td>
			<td><input type="hidden" name="bookname" value="<%=joinmodel.getBook_name()%>"></td>
			<td><input type="submit" value="대여" style="color: white; margin-left: 10px; font-weight: bold;"></td>
		</tr>


		<%
			} else {
		%>
		<tr>
			<td>검색하신 책이 없습니다.</td>
		</tr>
		<%
			}
		%>
	</table>
</form>
