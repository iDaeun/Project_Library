<%@page import="library.board.notice.model.Notice"%>
<%@page import="library.board.notice.service.GetNoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String not_numStr = request.getParameter("not_num");

	int not_num = 1;

	if (not_numStr != null) {
		not_num = Integer.parseInt(not_numStr);
	}

	/* 글 내용을 보여주는 서비스 작업을 처리할 객체 */
	GetNoticeService service = GetNoticeService.getInstance();

	Notice notData = service.getNotice(not_num);

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
	    $('#noticeSpan').css('display', 'inline');
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
	font-size: 14px;
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
					<tr>
						<td><%=notData.getNot_num()%></td>
						<td><%=notData.getNot_title()%></td>
						<td><%=notData.getNot_reg().substring(0, 10)%></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: left; padding: 10px 10px;"><%=notData.getNot_cont().replace("\r\n", "<br>")%></td>
					</tr>
				</table>
			</div>
			<a href="viewNotices.jsp">글 목록</a> <span id="noticeSpan" style="display: none;">| <a
				href="updateNoticeForm.jsp?not_num=<%=notData.getNot_num()%>&user_id=<%=notData.getUser_id()%>"
			>수정</a> | <a href="confirmDeleteNotice.jsp?not_num=<%=notData.getNot_num()%>&user_id=<%=notData.getUser_id()%>"> 삭제</a></span>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>