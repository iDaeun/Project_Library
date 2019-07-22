<%@page import="library.board.notice.model.Notice"%>
<%@page import="library.board.notice.service.GetNoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 1. view Suggestion.jsp 에서 '삭제' 클릭하면 (데이터 가지고) 넘어온다.
	// 아이디, 글 번호가 필요하네..?

	// 2. 아이디 비교해서 들어온다.
%>
<%
	int not_num = Integer.parseInt(request.getParameter("not_num"));

	boolean idChk = false;

	String getId = (String) request.getParameter("user_id");

	String user_id = "";
	LoginInfo loginInfo = null;
	/* 	loginInfo = (LoginInfo) session.getAttribute("login");
	getId = loginInfo.getUser_id(); */

	if ((LoginInfo) session.getAttribute("login") != null) {
		loginInfo = (LoginInfo) session.getAttribute("login");
		user_id = loginInfo.getUser_id();
	} else {
		user_id = "";
	}

	if (user_id.equals("admin1")) {
		idChk = true;
	}

	/* 글 내용을 보여주는 서비스 작업을 처리할 객체 */
	GetNoticeService service = GetNoticeService.getInstance();

	Notice notData = service.getNotice(not_num);
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
				<form action="updateNotice.jsp" method="post">
					<table>
						<tr>
							<td>글 제목</td>
							<td><input type="text" name="not_title" value="<%=notData.getNot_title()%>"></td>
						</tr>

						<tr>
							<td colspan="3" style="text-align: center">글 내용</td>
						</tr>
						<tr>
							<td colspan="3"><textarea name="not_cont" style="width: 100%; resize: none;"><%=notData.getNot_cont()%></textarea></td>
						</tr>
					</table>
					<input type="hidden" name="not_num" value="<%=notData.getNot_num()%>"> <input type="hidden" name="user_id"
						value="<%=notData.getUser_id()%>"
					> <input type="submit" value="수정">
				</form>
			</div>
			<a href="viewNotices.jsp">글 목록</a>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../..//frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>