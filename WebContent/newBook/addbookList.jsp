<%@page import="newbook.service.DeleteNewbookService"%>
<%@page import="newbook.model.Newbook"%>
<%@page import="newbook.service.GetNewbookService"%>
<%@page import="newbook.service.GetNewbookListService"%>
<%@page import="book.service.WriteBookService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="newbook.service.GetAdminBookListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
GetAdminBookListService updateService = GetAdminBookListService.getInstance();
GetNewbookService getbook = GetNewbookService.getInstance();
WriteBookService addService = WriteBookService.getInstance();
DeleteNewbookService delService = DeleteNewbookService.getinstance();


String[] str = request.getParameterValues("checkList");
Newbook nbook = null;
int rCnt = 0;
int rCnt1 = 0;
int rCnt2 = 0;
int count = 0;

for(String newbook : str){
	int newbookNum = Integer.parseInt(newbook);
	rCnt = updateService.updateNewbook(newbookNum); //업데이트
	nbook = new Newbook();
	nbook = getbook.getNewbook(newbookNum);
	rCnt1 = addService.writeNewbook(nbook);
	rCnt2 = addService.write2();
	delService.deleteNewbook(newbookNum);
	count++;
}

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
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>

<style>

#ct{
	font-family: 'Noto Serif KR', serif;
	text-align: center;
}

h2{
	font-weight: bold;
}

#apply {
	margin: auto;
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
			<h2><%=count%>개의 도서가 추가되었습니다!</h2>
				<div id="apply">
					<a href="../index.jsp">홈으로 돌아가기</a>
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