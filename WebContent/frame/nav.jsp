<%@page import="users.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	LoginInfo loginInfo1 = null;
	loginInfo1 = (LoginInfo) session.getAttribute("login");
%>

<div id="nn">
	<ul class="nav navbar-nav" id="nav">

		<%
			if (loginInfo1 != null && loginInfo1.getUser_id().equals("admin1")) {
		%>
		<!-- ADMIN1일때 -->
		<li><a href="/lib/users/managerCheckUsers/usersList.jsp">회원목록</a></li>
		<li><a href="/lib/StudyRoom/UserList.jsp">열람실 예약 현황</a></li>

		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>도서<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/book/BookSearchForm.jsp">도서검색</a></li>
				<li><a href="/lib/book/BookAll.jsp">전체 도서 리스트</a></li>
				<li><a href="/lib/book/BookWriteForm.jsp">도서추가</a></li>
				<li><a href="/lib/book/BookDeleteForm.jsp">도서삭제</a></li>
				<li><a href="/lib/newBook/showList.jsp">신청 도서 리스트</a></li>
			</ul></li>


		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>게시판<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/board/notices/viewNotices.jsp">공지사항</a></li>
				<li><a href="/lib/board/suggestions/viewSuggestions.jsp">건의사항</a></li>
			</ul></li>

		<%
			} else if (loginInfo1 != null) {
		%>
		<!-- 사용자일때 -->
		<li><a href="/lib/StudyRoom/StudyRevForm.jsp" class="nav">열람실신청</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>마이페이지<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/book/BookRentalList.jsp">대출 목록</a></li>
				<li><a href="/lib/StudyRoom/RS_Mypage.jsp">열람실 예약현황</a></li>
				<li><a href="/lib/newBook/showUserList.jsp">신청 도서</a></li>
				<li><a href="/lib/users/myPage/myPage.jsp">내 정보</a></li>
			</ul></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>게시판<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/board/notices/viewNotices.jsp">공지사항</a></li>
				<li><a href="/lib/board/suggestions/viewSuggestions.jsp">건의사항</a></li>
			</ul></li>

		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>도서<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/book/BookSearchForm.jsp">도서검색</a></li>
				<li><a href="/lib/newBook/Newbook.jsp">도서신청</a></li>
			</ul></li>

		<%
			} else {
		%>
		<!-- 로그인이 되어있지 않을때 -->
		<li><a href="/lib/users/loginLogout/loginForm.jsp" class="nav">로그인</a></li>
		<li><a href="/lib/users/reg/regForm.jsp" class="nav">회원가입</a></li>
		<li><a href="/lib/book/BookSearchForm.jsp">도서검색</a></li>

		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>게시판<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/board/notices/viewNotices.jsp">공지사항</a></li>
				<li><a href="/lib/board/suggestions/viewSuggestions.jsp">건의사항</a></li>
			</ul></li>
		<%
			}
		%>

	</ul>
</div>