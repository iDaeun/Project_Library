<%@page import="library.board.suggestions.model.Suggestion"%>
<%@page import="library.board.suggestions.service.GetSuggestionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 1. view Suggestion.jsp 에서 '삭제' 클릭하면 (데이터 가지고) 넘어온다.
	// 아이디, 글 번호가 필요하네..?

	// 2. 아이디 비교해서 들어온다.
%>
<%
	int sug_num = Integer.parseInt(request.getParameter("sug_num"));

	boolean idChk = false;

	String user_id = "";
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo) session.getAttribute("login");
	user_id = loginInfo.getUser_id();

	String getId = (String) request.getParameter("user_id");

	if (getId.equals(user_id)) {
		idChk = true;
	}

	/* 글 내용을 보여주는 서비스 작업을 처리할 객체 */
	GetSuggestionService service = GetSuggestionService.getInstance();

	Suggestion sugData = service.getSuggestion(sug_num);
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
    if (
<%=idChk%>
    == false) {
	alert('작성자만 수정 가능합니다.');
	history.go(-1);
    }
</script>
<style>
table {
	width: 100%;
}

table tr td {
	border: 1px solid black;
	padding: 2px;
	font-size: 16px;
}

table tr td:first-child {
	width: 10%;
}

table tr td input {
	width: 100%;
}

textarea {
	height: 360px;
}

#submit {
	
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
				<form action="updateSuggestion.jsp" method="post">
					<table>
						<tr>
							<td>글 제목</td>
							<td><input type="text" name="sug_title" value="<%=sugData.getSug_title()%>"></td>
						</tr>

						<tr>
							<td colspan="3" style="text-align: center">글 내용</td>
						</tr>
						<tr>
							<td colspan="3"><textarea name="sug_cont" style="width: 100%; resize: none;"><%=sugData.getSug_cont()%></textarea></td>
						</tr>
					</table>
					<input type="hidden" name="sug_num" value="<%=sugData.getSug_num()%>"> <input type="hidden" name="user_id"
						value="<%=sugData.getUser_id()%>"
					>
					<br>
					<input type="submit" value="수정" id="submit" style="float: right;">
				</form>
			</div>
			<a href="viewSuggestions.jsp">글 목록</a>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../..//frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>