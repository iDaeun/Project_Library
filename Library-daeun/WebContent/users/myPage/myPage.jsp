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
	
	img{
		max-width: 100%;
		max-height: auto;
	}
	
	h2{
		text-align: center;
		font-weight: bold;
	}
	table{
		margin: 0 auto;
	}
	
	table td{
		font-weight: bold;
		font-size: 20px;
		padding-left: 15px;
	}
	input[type=submit] {
		background-color: black;
		color: white;
		padding: 5px;
		margin: 3px;
		width: 100%;
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
				<h2>내 정보</h2>
				<hr>
				
				<form action="changeMyInfoForm.jsp" method="post">
				<table>
					<tr>
						<td rowspan="5" style="width:300px">
						<%if(memberInfo.getUser_photo().equals("none")){ %>
							<!-- 프로필 없을때 -->
							<img alt="사진" src="/lib/user_photo_upload/default.jpg"/>
							<input type="hidden" name="user_photo" value="/lib/user_photo_upload/default.jpg"/>
						<% }else{ %>
							<!-- 프로필 있을때 -->
						<img alt="사진" src="/lib/user_photo_upload/<%=memberInfo.getUser_photo() %>"/>
						<input type="hidden" name="user_photo" value="/lib/user_photo_upload/<%=memberInfo.getUser_photo() %>"/>
						<%} %>
						</td>
					</tr>
					<tr>
						<td style="width:150px">아이디: </td>
						<td><%=memberInfo.getUser_id() %>
						<input type="hidden" name="user_id" value="<%=memberInfo.getUser_id() %>"/></td>
					</tr>
					<tr>
						<td style="width:150px">비밀번호: </td>
						<td><%=memberInfo.getUser_pw() %></td>
					</tr>
					<tr>
						<td style="width:150px">이름: </td>
						<td><%=memberInfo.getUser_name() %>
						<input type="hidden" name="user_name" value="<%=memberInfo.getUser_name() %>"/>
						</td>
					</tr>
					<tr>
						<td style="width:150px">가입일자: </td>
						<td><%=memberInfo.getUser_reg() %>
						<input type="hidden" name="user_reg" value="<%=memberInfo.getUser_reg() %>"/></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" value="회원정보 수정"/></td>
					</tr>
				</table>
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
