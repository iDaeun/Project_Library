
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="library.board.notice.model.Notice"%>
<%@page import="library.board.notice.model.NoticesList"%>
<%@page import="library.board.notice.service.GetNoticesListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	// 리스트 뽑는 처리를 할 서비스 객체..!
	GetNoticesListService service = GetNoticesListService.getInstance();

	NoticesList listData = service.getNoticesList(pageNumber);

	boolean adminChk = false;

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
    $(document).ready(function() {

	if (
<%=adminChk%>
    ) {
	    $('#write').css('display', 'inline');
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

table tr:first-child {
	font-weight: bold;
	text-align: center;
}

table tr td:nth-child(2) {
	padding: 5px 15px;
}

table tr td:first-child {
	width: 10%;
	text-align: center;
}

table tr td:last-child {
	width: 15%;
	text-align: center;
}

table tr td {
	border: 1px solid black;
	font-size: 14px;
}

a {
	color: black;
	text-decoration: none;
}

#pageNumber {
	width: 100%;
	text-align: center;
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
						<td>작성일</td>
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
							for (Notice notic : listData.getNoticesList()) {
					%>
					<tr>
						<td><%=notic.getNot_num()%></td>
						<td><a href="viewNotice.jsp?not_num=<%=notic.getNot_num()%>"><%=notic.getNot_title()%></a></td>
						<td><%=notic.getNot_reg().substring(0, 10)%></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					for (int i = 1; i <= listData.getPageTotalCount(); i++) {
				%>
				<div id="pageNumber">
					<a href="viewNotices.jsp?page=<%=i%>">[<%=i%>]
					</a>
				</div>
				<%
					}
					}
				%>
			</div>
			<a href="writeNoticeForm.jsp" id="write" style="float: right; display: none;">글 작성</a>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>