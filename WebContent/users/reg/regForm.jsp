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
		
		
		$('#id_check').click(function(){
			
			$('#idChkMsg').html("");
			
			$.ajax({
				
				url : 'regCheck.jsp',
				type : 'GET',
				data : {
					user_id : $('#user_id').val()
				},
				
				success : function(data){
					if (data == 'N'){
						alert('regForm1'+ data);
						$('#idChkMsg').html('이미 사용중인 아이디 입니다');
						$('#idChkMsg').css('color', 'red');
						$("#submit").attr("disabled", true);
						
					} else if (data == 'Y') {
						alert('regForm2'+data);
						$('#idChkMsg').html('사용 가능한 아이디 입니다');
						$('#idChkMsg').css('color', 'blue');
						$("#submit").attr("disabled", false);
						
					} else {
						alert('regForm3'+ data);
						$('#idChkMsg').html('뭔가 잘못됐다.!');
						
					}
					
				}
				
			});
		});
		
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

		var checkId = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 아이디: 4글자~12글자 미만, 영어대소문자,숫자 가능
		var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함
		var checkName = RegExp(/^[가-힣a-zA-Z]+$/); // 이름: 한글,영문만 가능
		
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
				<h1>회원가입</h1>

				<form onsubmit="return checkz()" action="regProcess.jsp" method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>아이디</td>
							<td> <input type="text" name="user_id" id="user_id"> 
								 <input type="button" value="중복아이디체크" id="id_check"><br>
								 <span id="idChkMsg"></span>
								 <span id="id_span"></span>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw" id="user_pw"> <span id="pw_span"></span></td>
						</tr>
						<tr>
							<td>비밀번호 재확인</td>
							<td><input type="password" id="user_pw1"> <span id="pw_span1"></span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input	type="text" name="user_name" id="user_name"> <span id="name_span"></span></td>
						</tr>
						<tr>
							<td>사진</td>
							<td><input type="file" name="user_photo" id="user_photo"> </td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="회원가입" id="submit"></td>
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
