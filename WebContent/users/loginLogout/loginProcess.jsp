<%@page import="users.exception.InvalidUserPasswordException"%>
<%@page import="users.exception.InfoNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="users.model.LoginInfo"%>
<%@page import="users.service.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String saved = request.getParameter("saved");
	String msg = "";
	boolean chk = false;
	
	LoginService service = LoginService.getInstance();
	
	try{
		chk = service.idPwCheck(user_id, user_pw);
		System.out.println("loginProcess: "+chk);
		
	// 예외에 따라 응답 메세지 다르게 처리
	} catch(SQLException e){
		msg = e.getMessage();
	} catch(InfoNotFoundException e){
		msg = e.getMessage();
	} catch(InvalidUserPasswordException e){
		msg = e.getMessage();
	}
	
	// 아이디&비밀번호 매칭검사 통과하면: loginInfo객체에 입력 => session에 저장
	if(chk){
		session.setAttribute("login", new LoginInfo(user_id));
		// "아이디 저장" 체크표시 -> cookie에 아이디 저장
		if(saved != null && saved.equals("saved")){
			Cookie cookie = new Cookie("savedId",user_id);
			// 유효기간 : 1일
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			System.out.println("cookie저장함");
		}
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
				<h1>
				<%
				if(chk){
				%>
					로그인되었습니다, session: <%=session.getAttribute("login") %>
				<%
				} else {
				%>
					<%=msg %>
					<a href="loginForm.jsp">다시 로그인하기</a>
				<%
				}
				%>
				</h1>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>


</body>
</html>
