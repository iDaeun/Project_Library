<%@page import="library.board.suggestions.model.Suggestion"%>
<%@page import="library.board.suggestions.model.SuggestionsList"%>
<%@page import="library.board.suggestions.service.GetSuggestionListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	session.setAttribute("user_id", "Rex");

	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	// 리스트 뽑는 처리를 할 서비스 객체..!
	GetSuggestionListService service = GetSuggestionListService.getInstance();

	SuggestionsList listData = service.getSuggestionsList(pageNumber);
%>
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

<style>
table {
	width: 100%;
}

table tr td {
	border: 1px solid black;
	padding: 2px;
	font-size: 16px;
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

				<table>
					<tr>
						<td>글 번호</td>
						<td>글 제목</td>
						<td>작성자</td>
					</tr>
					<%
						if (listData.isEmpty()) {
					%>
					<!-- 데이터 없을 때.. -->
					<tr>
						<td>등록된 글이 없습니다.</td>
					</tr>

					<%
						} else {
							for (Suggestion sugg : listData.getSuggestionsList()) {
					%>
					<tr>
						<td><%=sugg.getSug_num()%></td>
						<td><a href="viewSuggestion.jsp?sug_num=<%=sugg.getSug_num()%>"><%=sugg.getSug_title()%></a></td>
						<td><%=sugg.getUser_id()%></td>
					</tr>
					<%
						if (sugg.getSug_comment() != null) {
					%>
					<tr>
						<td>답변</td>
						<td><a href="viewSuggestionComment.jsp?sug_num=<%=sugg.getSug_num()%>">re) <%=sugg.getSug_title()%></a></td>
						<td>admin</td>
					</tr>
					<%
						}
							}
					%>
				</table>
				<%
					for (int i = 1; i <= listData.getPageTotalCount(); i++) {
				%>
				<a href="viewSuggestions.jsp?page=<%=i%>">[<%=i%>]
				</a>
				<%
					}
					}
				%>
			</div>
			<a href="writeSuggestionForm.jsp">글 작성</a>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>