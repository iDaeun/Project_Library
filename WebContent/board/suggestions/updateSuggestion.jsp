
<%@page import="library.board.suggestions.service.UpdateSuggestionService"%>
<%@page import="library.board.suggestions.service.WriteSuggestionService"%>
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
	String sug_title = request.getParameter("sug_title");
	String sug_cont = request.getParameter("sug_cont");

	UpdateSuggestionService service = UpdateSuggestionService.getInstance();

	cnt = service.updateSuggestion(sug_num, sug_title, sug_cont);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
    
<%if (cnt > 0) {%>
    alert('수정 완료');
    location.href = "viewSuggestions.jsp";
<%} else {%>
    alert('수정 실패\n다시 시도해주세요.');
    location.href = "viewSuggestions.jsp";
<%}%>
    
</script>
</head>
<body>

</body>
</html>

