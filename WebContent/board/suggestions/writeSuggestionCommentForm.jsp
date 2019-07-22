<%@page import="library.board.suggestions.service.GetSuggestionService"%>
<%@page import="library.board.suggestions.model.Suggestion"%>
<%@page import="library.board.suggestions.service.WriteSuggestionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int sug_num = Integer.parseInt(request.getParameter("sug_num"));

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

<style>
table {
	width: 100%;
}

table tr td {
	border: 1px solid #ddd;
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
						<td>글 제목</td>
						<td><input type="text" value="<%=sugData.getSug_title()%>" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea style="width: 100%; resize: none;" readonly="readonly"><%=sugData.getSug_cont()%></textarea></td>
					</tr>
					<tr>
					</tr>
				</table>
				<hr>
				<form action="writeSuggestionComment.jsp" method="post">
					<table>
						<tr>
							<td style="text-align: center;">답글</td>
						</tr>
						<tr>
							<td><textarea style="width: 100%; resize: none;" name="sug_comment"></textarea></td>
						</tr>
					</table>
					<input type="hidden" name="sug_num" value="<%=sugData.getSug_num()%>"> <input type="submit" value="답글 등록">
				</form>
				<table>

				</table>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>
