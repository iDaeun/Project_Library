<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 저장한 아이디 있으면 브라우저 재접속시 표시함 -->
<%
	String savedId = "";
	Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("savedId")) {
			savedId = cookies[i].getValue();
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
<script>
			
			function checkz() {

				var checkId = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 아이디: 4글자~12글자 미만, 영어대소문자,숫자 가능
				var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함
				
				// 아이디 공백확인
				if($('#user_id').val() == ""){
					$('#id_span').html('아이디를 입력해주세요');
					$('#id_span').css('color','red');
					$('#id_span').focus();
					return false;
				}
				
				// 아이디 유효성 검사
				if(!checkId.test($('#user_id').val())){
					$('#id_span').html('[아이디] 4글자~12글자 미만, 영어대소문자,숫자 가능');
					$('#id_span').css('color','red');
					$('#id_span').focus();
					return false;
				}
				
				// 비밀번호 공백확인
				if($('#user_pw').val() == ""){
					$('#pw_span').html('비밀번호를 입력해주세요');
					$('#pw_span').css('color','red');
					$('#pw_span').focus();
					return false;
				}
				
				// 비밀번호 유효성 검사
				if(!checkPw.test($('#user_pw').val())){
					$('#pw_span').html('[비밀번호] 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함');
					$('#pw_span').css('color','red');
					$('#pw_span').focus();
					return false;
				}
		}

</script>

<style>
	table{
		margin: 0 auto;	
	}
	
	table td{
		font-weight: bold;
		padding: 5px;
	}
	
	input{
		border: 1px solid black;
	}
	
	input[type=button], [type=submit] {
		background-color: black;
		color: white;
		padding: 5px;
		margin: 3px;
	}
	
	input[type=submit]{
		width: 100%;
	}
	
	input[type=checkbox]{
		margin-left: 5px;
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
				<form onsubmit="return checkz()" action="loginProcess.jsp" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_id" id="user_id" value="<%=savedId%>"> <br>
								<span id="id_span"></span>
							</td>
							<td>
							아이디저장<input type="checkbox" value="saved" name="saved">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" id="user_pw"> <br>
								<span id="pw_span"></span>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center"><input type="submit" value="로그인" id="submit"></td>
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
