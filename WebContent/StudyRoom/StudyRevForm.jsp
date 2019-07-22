<%@page import="StudyRoomService.StudyChkService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date" />
<%
	
	StudyChkService chk = StudyChkService.getInstance();
	int timeOne = chk.StudyChk(1);
	int timeTwo = chk.StudyChk(2);
	int timeThree = chk.StudyChk(3);
	int timeFour = chk.StudyChk(4);
	int timeFive = chk.StudyChk(5);
	
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
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>

<style>
	#seatwrap {
	margin: 0 auto;
	}
	.button {
	display: inline-block;
	width: 30px;
	height: 30px;
	background-color: #EE5A24;
	color: beige;
	text-align: center;
	 line-height: 30px;
	border: 1px solid #DDD;
	border-radius: 5px;
	font-size: 20px;
	}
	#h4,#h3{
	font-size : 13px;
	font-weight : bold;
	}
	#table{
	padding: 10px;
	width: 100%;
	height : 200px;
	font-weight : bold;
	text-align: center;
	}
	#table td{
	border : 2px solid black; 
	}
	#sub{
	width: 80px;
	height : 30px;
	border-radius : 5px;
	background-color: black;
	color: beige;
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
			<div id="seatwrap">
			<div id="seat">
			<h4 id="h4">좌석배치도</h4>
			<h4 id="h4" style="color: #EE5A24; font-weight: bold">이용 가능 좌석</h4>
			<h4 id="h4" style="color: #34495e; font-weight: bold">이용 불가 좌석</h4>
			<input type="button" class="button" id="1" value="1">
			<input type="button" class="button" id="2" value="2">
			<input type="button" class="button" id="3" value="3">
			<input type="button" class="button" id="4" value="4">
			<input type="button" class="button" id="5" value="5">
			</div>


			
				<h3 id="h3">예약시간을 선택해주세요</h3>
				<form action="StudyRev.jsp" method="POST">
					<table id="table">
						<tr>
							<td>날짜</td>
							<td><fmt:formatDate value="${date}" pattern="MM월dd일" /></td>
						</tr>
						<tr>
							<td>시간</td>
							<td><input type="radio" name="time" value="1">09:00~12:00<br>
								<input type="radio" name="time" value="2">12:00~15:00<br>
								<input type="radio" name="time" value="3">15:00~18:00<br>
								<input type="radio" name="time" value="4">18:00~21:00<br>
							</td>
						</tr>
						<tr>
							<td>좌석번호</td>
							<td><select name="seat">
									<option id="s">자리선택</option>
									<option value="1" id="1s">1번 자리</option>
									<option value="2" id="2s">2번 자리</option>
									<option value="3" id="3s">3번 자리</option>
									<option value="4" id="4s">4번 자리</option>
									<option value="5" id="5s">5번 자리</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" id="sub" value="예약"></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>

</body>
</html>
<!-- 1번 시간에 자리가 있을 시  -->
	<%
	if(timeOne == 1){
	%>	
		<script>
		$('#1s').css('display','none');
	    $('#1').css('background-color','#34495e');				
		</script>
	<%		
	}else if(timeOne == 2){
	%>	
		<script>
		$('#2s').css('display','none');
	    $('#2').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeOne == 3){
	%>
		<script>
		$('#3s').css('display','none');
	    $('#3').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeOne == 4){
	%>
		<script>
		$('#4s').css('display','none');
	    $('#4').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeOne == 5){
	%>
		<script>
		$('#5s').css('display','none');
	    $('#5').css('background-color','#34495e');	
		</script>
	<%
	}
	%>
	
	<!-- 2번 시간에 자리가 있을 시  -->
	<%
	if(timeTwo == 1){
	%>	
		<script>
		$('#1s').css('display','none');
	    $('#1').css('background-color','#34495e');				
		</script>
	<%		
	}else if(timeTwo == 2){
	%>	
		<script>
		$('#2s').css('display','none');
	    $('#2').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeTwo == 3){
	%>
		<script>
		$('#3s').css('display','none');
	    $('#3').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeTwo == 4){
	%>
		<script>
		$('#4s').css('display','none');
	    $('#4').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeTwo == 5){
	%>
		<script>
		$('#5s').css('display','none');
	    $('#5').css('background-color','#34495e');	
		</script>
	<%
	}
	%>
	
	<!-- 3번 시간에 자리가 있을 시  -->
	<%
	if(timeThree == 1){
	%>	
		<script>
		$('#1s').css('display','none');
	    $('#1').css('background-color','#34495e');				
		</script>
	<%		
	}else if(timeThree == 2){
	%>	
		<script>
		$('#2s').css('display','none');
	    $('#2').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeThree == 3){
	%>
		<script>
		$('#3s').css('display','none');
	    $('#3').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeThree == 4){
	%>
		<script>
		$('#4s').css('display','none');
	    $('#4').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeThree == 5){
	%>
		<script>
		$('#5s').css('display','none');
	    $('#5').css('background-color','#34495e');	
		</script>
	<%
	}
	%>
	
	<!-- 4번 시간에 자리가 있을 시  -->
	<%
	if(timeFour == 1){
	%>	
		<script>
		$('#1s').css('display','none');
	    $('#1').css('background-color','#34495e');				
		</script>
	<%		
	}else if(timeFour == 2){
	%>	
		<script>
		$('#2s').css('display','none');
	    $('#2').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeFour == 3){
	%>
		<script>
		$('#3s').css('display','none');
	    $('#3').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeFour == 4){
	%>
		<script>
		$('#4s').css('display','none');
	    $('#4').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeThree == 5){
	%>
		<script>
		$('#5s').css('display','none');
	    $('#5').css('background-color','#34495e');	
		</script>
	<%
	}
	%>
	
	<!-- 5번 시간에 자리가 있을 시  -->
	<%
	if(timeFive == 1){
	%>	
		<script>
		$('#1s').css('display','none');
	    $('#1').css('background-color','#34495e');				
		</script>
	<%		
	}else if(timeFive == 2){
	%>	
		<script>
		$('#2s').css('display','none');
	    $('#2').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeFive == 3){
	%>
		<script>
		$('#3s').css('display','none');
	    $('#3').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeFive == 4){
	%>
		<script>
		$('#4s').css('display','none');
	    $('#4').css('background-color','#34495e');	
		</script>
	<%
	}else if(timeFive == 5){
	%>
		<script>
		$('#5s').css('display','none');
	    $('#5').css('background-color','#34495e');	
		</script>
	<%
	}
	%>
	
