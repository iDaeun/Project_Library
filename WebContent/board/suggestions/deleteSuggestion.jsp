<%@page import="library.board.suggestions.service.DeleteSuggestionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int resultCnt = 0;

	int sug_num = Integer.parseInt(request.getParameter("sug_num"));

	DeleteSuggestionService service = DeleteSuggestionService.getInstance();
	resultCnt = service.deleteSuggestion(sug_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
    alert('삭제완료');
    location.href = "viewSuggestions.jsp";
</script>
<style>
</style>
</head>
<body>
</body>
</html>