<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	$(document).ready(function(){
				
		$('#user_name').focus(function(){
			// 비밀번호 재확인 일치하는지 검사
			if($('#user_pw1').val() != $('#user_pw').val()) {
				$('#pw_span1').html('[비밀번호 불일치]');
				$('#pw_span1').css('color','red');
				$('#pw_span1').focus();
				return false;
			} else {
				$('#pw_span1').html('[비밀번호 일치]');
				$('#pw_span1').css('color','blue');
			}
		});
	});
	
	function checkz() {

		var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함
		var checkName = RegExp(/^[가-힣a-zA-Z]+$/); // 이름: 한글,영문만 가능
		
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
		
		// 이름 공백확인
		if($('#user_name').val() == ""){
			$('#name_span').html('이름을 입력해주세요');
			$('#name_span').css('color','red');
			$('#name_span').focus();
			return false;
		}
		
		// 이름 유효성 검사
		if(!checkName.test($('#user_name').val())){
			$('#name_span').html('[이름] 한글,영문만 가능');
			$('#name_span').css('color','red');
			$('#name_span').focus();
			return false;
		}
		
		
}
</script>

<style>
	
	img{
		max-width: 100%;
		max-height: auto;
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
	
	input[type=file]{
		border: none;
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
				<form onsubmit="return checkz()" action="changeMyInfoProcess.jsp" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>아이디</td>
							<td> ${param.user_id} <input type="hidden" name="user_id" value="${param.user_id}"></td>
						</tr>
						<tr>
							<td>[수정] 비밀번호</td>
							<td><input type="password" name="user_pw" id="user_pw"> <br>
							<span id="pw_span"></span></td>
						</tr>
						<tr>
							<td>[수정] 비밀번호 재확인</td>
							<td><input type="password" id="user_pw1"> <br>
							<span id="pw_span1"></span></td>
						</tr>
						<tr>
							<td>[수정] 이름</td>
							<td><input	type="text" name="user_name" id="user_name" value="${param.user_name}"> <span id="name_span"></span></td>
						</tr>
						<tr>
							<td>[수정] 사진</td>
							<td style="width:150px">
							<img alt="사진" src="${param.user_photo}"/>
							<input type="file" name="user_photo" id="user_photo">
							 </td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><input type="submit" value="회원정보 수정" id="submit"></td>
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
