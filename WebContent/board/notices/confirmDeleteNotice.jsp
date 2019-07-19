
<%@page import="library.board.notice.service.DeleteNoticeService"%>
<%@page import="library.board.suggestions.service.DeleteSuggestionService"%>
<%@page import="library.board.suggestions.service.WriteSuggestionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. view Suggestion.jsp 에서 '삭제' 클릭하면 (데이터 가지고) 넘어온다.
	// 아이디, 글 번호가 필요하네..?

	// 2. 아이디 비교해서 들어온다.
%>
<%
	request.setCharacterEncoding("UTF-8");
	int not_num = Integer.parseInt(request.getParameter("not_num"));

	boolean idChk = false;

	int resultCnt = 0;
	/* 	System.out.println(getId); */
	if (session.getAttribute("user_id").equals("admin")) {
		idChk = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
    if (
<%=idChk%> == false
    ) {
	alert('관리자만 삭제 가능합니다.');
	history.go(-1);
    } else {

	var deleteChk = confirm('삭제하시겠습니까?\n삭제한 글은 다시 복구되지 않습니다.');
	if (deleteChk) {
	    location.href = "deleteNotice.jsp?not_num=<%=not_num%>";
	} else {
	    location.href = "viewNotices.jsp";
	}
    }
</script>
</head>
<body>

</body>
</html>

