<%@page import="newbook.service.InsertNewbookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--------------------------------------받아올 변수들의 인코딩 처리---------------------------------------------------------->
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("text/html; charset=utf-8");
%>

<!---------------------------------------session에 저장된 userid 받아오기------------------------------------------------>
<%
	String userid = "";
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo) session.getAttribute("login");
	userid = loginInfo.getUser_id();
%>

<!----------------------------------usebean을 통해 받아온 변수를 객체에 저장----------------------------------------------------->
<!----------------사용자로부터 전달받은 값들을 newbook객체에 저장--------------------------------->
<jsp:useBean id="newbook" class="newbook.model.Newbook" />
<jsp:setProperty property="*" name="newbook" />
<!-----------------session에서 받아온 userid를 newbook 객체에 저장-------------------------->
<jsp:setProperty property="userid" name="newbook" value="<%=userid%>" />


<!------------------------Newbook객체를 데이터베이스에 저장 할 수 있는 서비스 및 메서드 소환----------------------------------------->
<%
	InsertNewbookService insertService = InsertNewbookService.getInstance();
	int cnt = insertService.insert(newbook);
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
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
#ct {
	font-family: 'Noto Serif KR', serif;
	text-align: center;
}

h2 {
	font-weight: bold;
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
		<%
			if (cnt > 0) {
				if (userid == "admin") {
					pageContext.forward("/newBook/showList.jsp");
				} else {
					pageContext.forward("/newBook/showUserList.jsp");
				}
			} else {
		%>
		<div id="context">
			<div id="ct">
				<h2>
					도서 신청에 실패하였습니다.
					<br>
					데스크에 문의해주세요.
				</h2>
			</div>
		</div>
		<%
			}
		%>

		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
</body>
</html>