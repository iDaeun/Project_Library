<%@page import="newbook.service.GetUserNewbookListService"%>
<%@page import="newbook.service.GetNewbookListService"%>
<%@page import="newbook.model.Newbook"%>
<%@page import="newbook.service.InsertNewbookService"%>
<%@page import="newbook.model.NewbookListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--------------------------------------받아올 변수들의 인코딩 처리---------------------------------------------------------->
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("text/html; charset=utf-8");
%>


<!--------------------session에 저장된 로그인 정보의 id 받아오기(id가 원하는 데이터베이스를 찾기위한 키)---------------------------------->
<%
	String userid = "";
	LoginInfo loginInfo = null;
	loginInfo = (LoginInfo) session.getAttribute("login");
	userid = loginInfo.getUser_id();
%>

<!--------------------------------------페이지 처리---------------------------------------------------------->
<%
	//------------현재 페이지 변수 받아오기----------------
	//하단에서 페이지 번호 받아오기
	String pageNumberstr = request.getParameter("page");

	//받아오는 페이지가 없을 때: 기본페이지 번호
	int pageNumber = 1;

	//받아오는 페이지가 있을 때: 받아온 페이지 번호 int 처리
	if (pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}

	//-----------------변수처리-----------------------
	//페이지 번호 처리 및 User가 신청한 newbook데이터를 list로 받아오는 service 객체 호출
	GetUserNewbookListService service = GetUserNewbookListService.getInstance();
	//받아온 현재페이지 변수를 서비스객체의 getNewbookListView 메서드를 통해 페이지 처리에 필요한 변수들을 소환
	NewbookListView viewData = service.getNewbookListView(pageNumber, userid);
%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="../cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>

<style>
#ct {
	font-family: 'Noto Serif KR', serif;
	text-align: center;
}

h2 {
	font-weight: bold;
}

table {
	margin: auto;
	width: 600px;
}

th, td {
	padding: 5px;
	text-align: center;
}

th {
	font-size: 20px;
}

#applyresult {
	margin: auto;
	width: 1000px;
}
</style>
</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="../frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->

		<div id="context">
			<div id="ct">
				<h2>${sessionScope.userid}님의신청도서목록</h2>
				<hr>
				<div id="applyresult">
					<table>
						<thead>
							<tr>
								<th>도서명</th>
								<th>작가명</th>
								<th>출판사</th>
								<th></th>
							</tr>
						</thead>

						<%
							for (Newbook nbook : viewData.getNewbookList()) {
						%>
						<tbody>
							<tr>
								<td><%=nbook.getNewName()%></td>
								<td><%=nbook.getNewAut()%></td>
								<td><%=nbook.getNewPub()%></td>
								<td><a href="updateForm.jsp?newbookNum=<%=nbook.getNewbookNum()%>">수정</a> | <a
									href="deletion.jsp?newbookNum=<%=nbook.getNewbookNum()%>"
								>삭제</a></td>
							</tr>

							<%
								}
							%>

						</tbody>
					</table>

					<hr>

					<%
						for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
					%>
					<a href="showUserList.jsp?page=<%=i%>">[<%=i%>]
					</a>

					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<!-- context 끝 -->

	<!-- footer 시작 -->
	<%@include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>