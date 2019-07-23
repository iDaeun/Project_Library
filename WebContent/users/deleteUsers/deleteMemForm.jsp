<%@page import="users.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
// session에 로그인 정보 있는지 확인
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo)session.getAttribute("login");
	String loginId = "";
	
// 있으면: 아이디 -> 로그인 폼에 나타내기
	if(loginInfo != null){
		loginId = loginInfo.getUser_id();
	} else {
// 없으면: 로그인 페이지로 이동
	response.sendRedirect("/lib/users/loginLogout/loginForm.jsp");
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

				var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함
			
				
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
	h2{
		text-align: center;
		color: red;
		font-weight: bold;
	}
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
				<h2>비밀번호 다시 입력</h2>

				<form onsubmit="return checkz()" action="deleteMemProcess.jsp" method="post">
					<table>
						<tr>
							<td></td>
							<td><input type="hidden" name="user_id" id="user_id" value="<%=loginId%>">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" id="user_pw"> <br>
								<span id="pw_span"></span></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="회원탈퇴" id="submit"></td>
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