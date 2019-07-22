<%@page import="users.service.MyPgService"%>
<%@page import="users.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String user_id = "";
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo)session.getAttribute("login");
	user_id = loginInfo.getUser_id();
	
	MyPgService service = MyPgService.getInstance();
	MemberInfo memberInfo = service.selectMyInfo(user_id);
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
	#user_photo{
		width: 25%;
		height: 25%;
	}
	
	img{
		max-width: 100%;
		max-height: auto;
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
				<h1>내 정보</h1>
				<ul>
					<li>
					
					<div id="user_photo">
					<%if(memberInfo.getUser_photo().equals("none")){ %>
						<!-- 프로필 없을때 -->
						<img alt="사진" src="/lib/user_photo_upload/default.jpg"/>
						
					<% }else{ %>
						<!-- 프로필 있을때 -->
					<img alt="사진" src="/lib/user_photo_upload/<%=memberInfo.getUser_photo() %>"/>
					
					<%} %>
					</div>
					
					</li>
					<li>아이디: <%=memberInfo.getUser_id() %></li>
					<li>비밀번호: <%=memberInfo.getUser_pw() %></li>
					<li>이름: <%=memberInfo.getUser_name() %></li>
					<li>가입일자: <%=memberInfo.getUser_reg() %></li>
				</ul>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>


</body>
</html>
