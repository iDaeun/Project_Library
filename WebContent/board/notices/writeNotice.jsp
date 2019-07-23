<%@page import="library.board.notice.service.WriteNoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="notice" class="library.board.notice.model.Notice" />
<jsp:setProperty name="notice" property="*" />
<%
	WriteNoticeService service = WriteNoticeService.getInstance();
	int cnt = service.write(notice);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
    
<%if (cnt > 0) {%>
    alert('작성 완료');
    location.href = "viewNotices.jsp";
<%} else {%>
    alert('작성 실패');
    location.href = "viewNotices.jsp";
<%}%>
    
</script>
<style>
</style>
</head>
<body>

</body>
</html>