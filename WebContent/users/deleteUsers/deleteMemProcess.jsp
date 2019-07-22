<%@page import="users.exception.RentException"%>
<%@page import="users.service.LoginService"%>
<%@page import="users.service.DeleteMemService"%>
<%@page import="users.exception.InvalidUserPasswordException"%>
<%@page import="users.exception.InfoNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="users.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String msg = "";
	int rCnt = 0;
	boolean chk = false;
	
	LoginService service = LoginService.getInstance();
	
	try{
		//아이디&비밀번호 매칭
		chk = service.idPwCheck(user_id, user_pw);
		System.out.println("deleteMemProcess: "+chk);
		
	// 비밀번호 틀림 -> 예외에 따라 응답 메세지 다르게 처리
	} catch(SQLException e){
		msg = e.getMessage();
	} catch(InfoNotFoundException e){
		msg = e.getMessage();
	} catch(InvalidUserPasswordException e){
		msg = e.getMessage();
	}
	
	// 비밀번호 맞음 -> fk에 해당된 내용 삭제 후 => 회원 정보 삭제
	if(chk){
		
		// fk에 해당된 내용 삭제 후 => 회원 정보 삭제 
		DeleteMemService delService = DeleteMemService.getInstance();
		
		try{
			
		rCnt = delService.deleteMem(user_id);

		
		// 대출되어있으면 -> 예외처리로 응답 메세지 전달
		} catch(SQLException e){
			msg = e.getMessage();
		} catch(Exception e){
		msg = e.getMessage();}
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
				if(rCnt > 0){
				%>
					
					alert('<%=rCnt %>개 행이 삭제되었습니다!');
					
					<!-- 회원탈퇴 후, 자동 로그아웃 -->
					<% session.removeAttribute("login"); %>
					<script>alert('<%=session.getAttribute("login") %>');
					location.href="<%=request.getContextPath() %>"; </script>
				
				<%	
				}
				%>
				 
				<%
				if(msg.length()>0){
				%>
					<%=msg %>
					<script>
					//alert('비밀번호 재입력 바람');
					//history.go(-1);
					</script>
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
