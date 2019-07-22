<%@page import="java.sql.SQLException"%>
<%@page import="StudyRoomService.RDService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RDService rds = RDService.getInstance();
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("login");
	String user_id = loginInfo.getUser_id();
	

	boolean ck = false;
	int chk = 0;

	try{
		chk = rds.REVDelete(user_id);
		ck = true;
	}catch(SQLException e){
	 e.printStackTrace();
	}


%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<%
		if(ck){
		%>
		<h4><%= user_id %>님의 예약이 취소 되었습니다.</h4>
		<% }else {%>
		<h4>예약하신 정보가 없습니다.</h4>
		<% } %>
		
				
		</div>
		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
		
	</div>

</body>
</html>