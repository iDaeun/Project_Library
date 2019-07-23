<%@page import="newbook.model.Newbook"%>
<%@page import="newbook.service.DeleteNewbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-----------------회원 아이디 받아오기----------------------------->
<% String userid = (String)session.getAttribute("userid"); %>

<!----------------------------데이터베이스 삭제하기-------------------------------------->
<%
//--------------------필요한 변수 및 서비스객체 생성--------------------------

int newbookNum = Integer.parseInt(request.getParameter("newbookNum"));
int rCnt = 0;
DeleteNewbookService service = DeleteNewbookService.getinstance();

//-----------------------------삭제------------------------------------

rCnt = service.deleteNewbook(newbookNum);

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
#ct {
	font-family: 'Noto Serif KR', serif;
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
			<%
			if(rCnt > 0) {
			%>
				<h2>정상적으로 삭제되었습니다!</h2>

				<% if(userid=="admin"){ %>
				<a href="/lib/newBook/showList.jsp" style="font-size: 15px;">리스트로 돌아가기</a>
				<% } else {
				%>
				<a href="/lib/newBook/showUserList.jsp" style="font-size: 15px;">리스트로 돌아가기</a>
				<%	
				}
				} else {
				%>
				<h2>
					신청도서 삭제에 실패하였습니다.<br> 데스크에 문의해주세요.
				</h2>
				<%
				}
				%>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>


</body>
</html>