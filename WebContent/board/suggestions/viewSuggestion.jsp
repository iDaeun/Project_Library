<%@page import="library.board.suggestions.service.GetSuggestionService"%>
<%@page import="library.board.suggestions.model.Suggestion"%>
<%@page import="library.board.suggestions.model.SuggestionsList"%>
<%@page import="library.board.suggestions.service.GetSuggestionListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String sug_numStr = request.getParameter("sug_num");

	int sug_num = Integer.parseInt(sug_numStr);

	String getId = "";
	LoginInfo loginInfo = null;
/* 	loginInfo = (LoginInfo) session.getAttribute("login");
	getId = loginInfo.getUser_id(); */

	
	if((LoginInfo) session.getAttribute("login") != null) {
		loginInfo = (LoginInfo) session.getAttribute("login");
		getId = loginInfo.getUser_id();
	} else {
		getId = "";
	}
	
	/* 글 내용을 보여주는 서비스 작업을 처리할 객체 */
	GetSuggestionService service = GetSuggestionService.getInstance();

	Suggestion sugData = service.getSuggestion(sug_num);

	/* 	System.out.println(sugData.getSug_num());
		System.out.println(sugData.getSug_cont()); */

	boolean idChk = false;

	if (getId.equals(sugData.getUser_id()) || getId.equals("admin1")) {
		idChk = true;
	}

	boolean adminChk = false;

	if (getId.equals("admin1")) {
		adminChk = true;
	}
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
					<tr>
						<td><%=sugData.getSug_num()%></td>
						<td><%=sugData.getSug_title()%></td>
						<td><%=sugData.getUser_id()%></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center">글 내용</td>
					</tr>
					<tr>
						<td colspan="3"><textarea name="sug_cont" style="width: 100%; resize: none;" readonly="readonly"><%=sugData.getSug_cont()%></textarea></td>
					</tr>
				</table>
			</div>
			<a href="viewSuggestions.jsp">글 목록</a> | <a
				href="updateSuggestionForm.jsp?sug_num=<%=sugData.getSug_num()%>&user_id=<%=sugData.getUser_id()%>"
			>수정</a> | <a href="confirmDeleteSuggestion.jsp?sug_num=<%=sugData.getSug_num()%>&user_id=<%=sugData.getUser_id()%>">
				삭제</a>
			<br>
			<span id="commentSpan" style="display: none"><a
				href="writeSuggestionCommentForm.jsp?sug_num=<%=sugData.getSug_num()%>"
			>답글</a></span>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>