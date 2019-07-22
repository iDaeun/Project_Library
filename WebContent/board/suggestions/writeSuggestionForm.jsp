<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String getId = "";
	LoginInfo loginInfo = null;
	/* 	loginInfo = (LoginInfo) session.getAttribute("login");
	getId = loginInfo.getUser_id(); */

	if ((LoginInfo) session.getAttribute("login") != null) {
		loginInfo = (LoginInfo) session.getAttribute("login");
		getId = loginInfo.getUser_id();
	} else {
		getId = "";
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Suggest Page</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="/lib/css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="/lib/cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/lib/js/bootstrap.js"></script>
<script>
    
<%if (getId.equals("")) {%>
    alert('먼저 로그인을 해주세요.');
    location.href = "viewSuggestions.jsp";
<%}%>
    
</script>

<style>
table {
	width: 100%;
}

table tr td {
	border: 1px solid #ddd;
}

textarea {
	height: 360px;
}

</style>

</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../../frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="../../frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">
				<form action="writeSuggestion.jsp" method="post">
					<table>
						<tr>
							<td>글 제목</td>
							<td><input type="text" name="sug_title"></td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="sug_cont" style="width: 100%; resize: none;"></textarea></td>
						</tr>
					</table>
					<input type="submit" value="작성">
				</form>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>
