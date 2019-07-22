<%@page import="library.board.suggestions.service.UpdateSuggestionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. form으로 부터 데이터를 받는다.
	// 2. Suggestion 객체에 저장 : useBean
	// 3. WriteSuggestionService 객체 생성
	// 4. write 메소드 실행 : 1/0
%>
<%
	request.setCharacterEncoding("UTF-8");

	int cnt = 0;

	int sug_num = Integer.parseInt(request.getParameter("sug_num"));

	String sug_comment = request.getParameter("sug_comment");

	UpdateSuggestionService service = UpdateSuggestionService.getInstance();

	cnt = service.updateComment(sug_num, sug_comment);
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
    location.href = "viewSuggestions.jsp";
<%} else {%>
    alert('작성 실패');
    location.href = "viewSuggestions.jsp";
<%}%>
    
</script>
</head>
<body>

</body>
</html>

