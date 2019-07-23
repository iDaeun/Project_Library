<%@page import="java.util.List"%>
<%@page import="StudyRoom.model.UserListview"%>
<%@page import="StudyRoom.model.user"%>
<%@page import="StudyRoomService.RVservice"%>
<%@page import="StudyRoom.model.Study_room"%>
<%@page import="org.apache.tomcat.jni.Stdlib"%>
<%@page import="StudyRoomService.SeatNum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
    <% 
    /* LoginInfo loginInfo = (LoginInfo)session.getAttribute("login"); */
	
    /* int user_num = 0;
    int user_time = 0; */
    /* String user_id = loginInfo.getUser_id(); */
    
    RVservice service = RVservice.getInstance();
    List<Study_room> list = service.allseatRV();	
   
    
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
	#a{
		background-color: black;	
		color: white;
		display: inline-block;
		width: 50px;
		margin-left: 3px;
		text-align: center;
		border-radius: 3px;
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
		<h3>열람실 예약 리스트</h3>
		<%
		if(!(list.isEmpty())){
		
		for(int i =0; i<list.size();i++){
			%>
		회원 아이디 : <%= list.get(i).getUser_id() %><br>
		좌석번호 : <%= list.get(i).getSeat_num() %><br>
		선택한 시간 : <%	if(list.get(i).getStudy_time() == 1){ %>
			09:00~12:00
			<% }else if(list.get(i).getStudy_time() == 2){ %>	
			12:00~15:00
			<% }else if(list.get(i).getStudy_time() == 3){ %>
			15:00~18:00
			<% }else if(list.get(i).getStudy_time() == 4){ %>
			18:00~21:00
			<% } %>
		<br>
		<a href="/lib/StudyRoom/RC.jsp" id="a">수정</a>
		<a href="/lib/StudyRoom/RD.jsp" id="a">삭제</a>
		<br><br>
		
		<%
			}
		}else{
		%>
			<h3>예약된 좌석이 없습니다.</h3>
		<%	
		}
		%>
		</div>
		
	
		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>

</body>
</html>