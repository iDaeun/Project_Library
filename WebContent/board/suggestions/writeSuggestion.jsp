
<%@page import="users.model.LoginInfo"%>
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
%>
<jsp:useBean id="suggestion" class="library.board.suggestions.model.Suggestion" />
<jsp:setProperty name="suggestion" property="*" />
<%
	String user_id = "";
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo) session.getAttribute("login");
	user_id = loginInfo.getUser_id();

	WriteSuggestionService service = WriteSuggestionService.getInstance();
	int cnt = service.write(suggestion, user_id);
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

