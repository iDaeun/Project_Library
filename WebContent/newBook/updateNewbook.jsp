<%@page import="newbook.service.UpdateNewbookService"%>
<%@page import="newbook.model.Newbook"%>
<%@page import="newbook.service.GetNewbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-----------------회원 아이디 받아오기----------------------------->
<%
	String userid = (String) session.getAttribute("userid");
%>

<!--------------------------------------받아올 변수들의 인코딩 처리---------------------------------------------------------->
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("text/html; charset=utf-8");
%>

<!------------------------Newbook객체를 데이터베이스에 저장 할 수 있는 서비스 및 메서드, 변수 소환----------------------------------------->
<%
	int newbookNum = Integer.parseInt(request.getParameter("newbookNum"));

	GetNewbookService getService = GetNewbookService.getInstance();
	UpdateNewbookService updateService = UpdateNewbookService.getinstance();

	Newbook newbook = getService.getNewbook(newbookNum);
%>

<!----------------사용자로부터 전달받은 값들로 Newbook객체 값 변경--------------------------------->
<%
	String newName = null;
	String newAut = null;
	String newPub = null;

	if (request.getParameter("newName") == null) {
		newName = newbook.getNewName();
	} else {
		newName = request.getParameter("newName");
	}

	if (request.getParameter("newAut") == null) {
		newAut = newbook.getNewAut();
	} else {
		newAut = request.getParameter("newAut");
	}

	if (request.getParameter("newPub") == null) {
		newPub = newbook.getNewPub();
	} else {
		newPub = request.getParameter("newPub");
	}

	out.print(newName);
	
	newbook.setNewName(newName);
	newbook.setNewAut(newAut);
	newbook.setNewPub(newPub);

	
	
	int rCnt = updateService.updateNewbook(newbookNum, newbook);
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
					if (rCnt > 0) {
				%>
				<h2>정상적으로 수정되었습니다!</h2>

				<%
					if (userid == "admin") {
				%>
				<a href="showList.jsp" style="font-size: 15px;">리스트로 돌아가기</a>
				<%
					} else {
				%>
				<a href="showUserList.jsp" style="font-size: 15px;">리스트로 돌아가기</a>
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