<%@page import="users.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%	
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo) session.getAttribute("login");
	boolean chk = false;

	if (loginInfo != null) {
		session.removeAttribute("login");
		
		//현재 세션객체를 소멸시킨다.
		//request.getSession(false).invalidate();
		chk = true;
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
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/lib/js/bootstrap.js"></script>

<style>
	h2{
		text-align: center;
		color: red;
		font-weight: bold;
	}
	
	#move{
		text-align: center;
		color: white;
		background-color: black;
		font-weight: bold;
		padding: 5px;
		margin: 8px;
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
				<%
					if (chk) {
				%>
				<h2>
					로그아웃 되었습니다!
					session: <%=session.getAttribute("login")%></h2>
				<%
					} else {
				%>
				<h2>로그인해주세요!<br><br>
				<a id="move" href="loginForm.jsp">로그인 페이지로 이동</a></h2>
				
				<%
					}
				%>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>


</body>
</html>