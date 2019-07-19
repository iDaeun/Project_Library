<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="nn">
	<ul class="nav navbar-nav" id="nav">
		<li><a class="nav">로그인</a></li>
		<li><a class="nav">회원가입</a></li>
		<li><a class="nav">열람실신청</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>게시판<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/lib/board/notices/viewNotices.jsp ">공지사항</a></li>
				<li><a href="/lib/board/suggestions/viewSuggestions.jsp ">건의사항</a></li>
			</ul>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>마이페이지<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">도서 대출/반납</a></li>
				<li><a href="#">열람실 예약현황</a></li>
				<li><a href="#">신청 도서</a></li>
				<li><a href="#">내 작성글</a></li>
			</ul></li>
		<!--<li><a class="nav">(관리자페이지)</a></li>-->
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-haspopup="true" aria-expanded="false"
		>도서<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">도서검색</a></li>
				<li><a href="#">도서신청</a></li>
			</ul></li>
	</ul>
</div>