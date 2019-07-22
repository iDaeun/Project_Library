<%@page import="library.board.suggestions.service.GetSuggestionService"%>
<%@page import="library.board.suggestions.model.Suggestion"%>
<%@page import="library.board.suggestions.service.WriteSuggestionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int sug_num = Integer.parseInt(request.getParameter("sug_num"));

	String getId = "";
	LoginInfo loginInfo = null;
	/* 	loginInfo = (LoginInfo) session.getAttribute("login");
	getId = loginInfo.getUser_id(); */

	if ((LoginInfo) session.getAttribute("login") != null) {
		loginInfo = (LoginInfo) session.getAttribute("login");
		getId = loginInfo.getUser_id();
	} else {
		getId = "";
	}

	/* 글 내용을 보여주는 서비스 작업을 처리할 객체 */
	GetSuggestionService service = GetSuggestionService.getInstance();

	Suggestion sugData = service.getSuggestion(sug_num);

	boolean idChk = false;

	if (getId.equals(sugData.getUser_id()) || getId.equals("admin1")) {
		idChk = true;
	}

	boolean adminChk = false;

	if (getId.equals("admin1")) {
		adminChk = true;
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Suggest Page</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="/lib/css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="/lib/cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/lib/js/bootstrap.js"></script>
<script>
    if (!
<%=idChk%>
    ) {
	alert('작성자만 볼 수 있습니다.');
	location.href = "viewSuggestions.jsp"
    }

    $(document).ready(function() {

	if (
<%=adminChk%>
    ) {
	    $('#commentSpan').css('display', 'block');
	}

    })
</script>
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

table {
	width: 100%;
}

table tr td {
	border: 1px solid black;
	font-size: 16px;
}

#sugg tr:first-child {
	font-weight: bold;
	text-align: center;
}

#sugg tr td:nth-child(2) {
	padding: 5px 15px;
}

#sugg tr td:first-child {
	width: 10%;
	text-align: center;
}

#sugg tr td:last-child {
	width: 15%;
	text-align: center;
}

#comm tr:first-child {
	font-weight: bold;
	text-align: center;
}

#comm tr td:first-child {
	padding: 5px 15px;
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
				<table id="sugg">
					<tr>
						<td>글 번호</td>
						<td>글 제목</td>
						<td>작성자</td>
					</tr>
					<tr>
						<td><%=sugData.getSug_num()%></td>
						<td><%=sugData.getSug_title()%></td>
						<td><%=sugData.getUser_id()%></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: left; padding: 10px 10px;"><%=sugData.getSug_cont().replace("\r\n", "<br>")%></td>

					</tr>
				</table>
				<hr>

				<table id="comm">
					<tr>
						<td style="text-align: center;">답글</td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: left; padding: 10px 10px;"><%=sugData.getSug_comment().replace("\r\n", "<br>")%></td>
					</tr>
				</table>
				<a href="viewSuggestions.jsp">글 목록</a>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>
