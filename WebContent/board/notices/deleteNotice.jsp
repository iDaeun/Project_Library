<%@page import="library.board.notice.service.DeleteNoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int resultCnt = 0;

	int not_num = Integer.parseInt(request.getParameter("not_num"));

	DeleteNoticeService service = DeleteNoticeService.getInstance();
	resultCnt = service.deleteNotice(not_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
    alert('삭제완료');
    location.href = "viewNotices.jsp";
</script>
<style>
</style>
</head>
<body>
</body>
</html>