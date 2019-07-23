<%@page import="newbook.service.GetNewbookService"%>
<%@page import="newbook.model.Newbook"%>
<%@page import="newbook.model.NewbookListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	GetNewbookService service = GetNewbookService.getInstance();
	int newbookNum = Integer.parseInt(request.getParameter("newbookNum"));
	Newbook newbook = service.getNewbook(newbookNum);
	
	String newbookName = newbook.getNewName(); 
	String newbookAut = newbook.getNewAut();
	String newbookPub = newbook.getNewPub();
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="../cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>

<style>

#ct{
	font-family: 'Noto Serif KR', serif;
}

h2{
	font-weight: bold;
}

#apply {
	margin: auto;
	width: 1000px;
}

#applybox {
	width: 200px;
	height: 30px;
}

table {
	margin: auto;
	border-spacing: 10px;
}

th, td {
	padding: 5px;
}

#button {
	margin: 20px;
	padding: 3px;
	width: 80px;
	height: 50px;
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
				<h1>도서수정</h1>
				<hr>
				<div id="apply">
					<form action="updateNewbook.jsp?newbookNum=<%=newbookNum%>" method="post">
						<table>
							<tr>
								<td><h4>도서명</h4></td>
								<td><h4>작가명</h4></td>
								<td><h4>출판사</h4></td>
							</tr>

							<tr>
								<td><input type="text" name="newName" placeholder="<%=newbookName%>"></td>
								<td><input type="text" name="newAut" placeholder="<%=newbookAut%>"></td>
								<td><input type="text" name="newPub" placeholder="<%=newbookPub%>"></td>
							</tr>

							<tr>
								<td colspan="3" align="center"><input type="submit"
									value="수정" id="button"></td>
							</tr>
						</table>
					</form>
				</div>
				
				<hr>

			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>