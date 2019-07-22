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
	//페이지 번호 처리 및 모든 User가 신청한 newbook데이터를 전부 list로 받아오는 service 객체 호출(admin)
	GetNewbookListService service = GetNewbookListService.getInstance();
	//받아온 현재페이지 변수를 서비스객체의 getNewbookListView 메서드를 통해 페이지 처리에 필요한 변수들을 소환
	NewbookListView viewData = service.getNewbookListView(pageNumber);
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

h2 {
	font-weight: bold;
}

#applyresult {
	margin: auto;
	width: 1000px;
}

#button {
	margin: 20px;
	padding: 3px;
	width: 100px;
	height: 50px;
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
				<h2>도서신청목록</h2>
				<hr>
				<div id="applyresult">
					<form action="addbookList.jsp">
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
								<tr>
									<td colspan="4" align="center"><input type="submit" value="신청도서추가" id="button"></td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr>

					<%
						for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
					%>
					<a href="showList.jsp?page=<%=i%>">[<%=i%>]
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