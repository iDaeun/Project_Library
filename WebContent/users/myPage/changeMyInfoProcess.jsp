<%@page import="users.service.ChangeMyInfoService"%>
<%@page import="users.model.MemberInfo"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="users.service.RegService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	boolean photo = false;
	//사진파일 저장
	String user_id = "";
	String user_pw = "";
	String user_name = "";
	String user_photo = "";
	long fileSize = 0;
	String user_photo_name = "";
	boolean memory = false;
	String type = "";
	String dir = "";
	
	ChangeMyInfoService service = ChangeMyInfoService.getInstance();
	MemberInfo memberInfo = null;
	
		// upload할 경로
		String uploadPath = "/user_photo_upload";
		dir = request.getSession().getServletContext().getRealPath(uploadPath);
		
		System.out.println("내가 지정한경로:"+dir);

			// 1. multipart/form-data 여부 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipart){
			
			// 2. 메모리나 파일로 업로드 데이터를 보관하는 factory설정
		DiskFileItemFactory factory = new DiskFileItemFactory();
			
			// 3. 업로드 요청 처리하는 ServletFileUpload생성
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 업로드 기준값
		//factory.setSizeThreshold(sizeThreshold);
		// upload.setSizaMax(-1); : 업로드 바이트는 무제한 
			
			// 4. 업로드 요청 파싱 -> FileItem목록 구함
		List<FileItem> items = upload.parseRequest(request);
		Iterator<FileItem> itr = items.iterator();

		while (itr.hasNext()) {
			
			FileItem item = itr.next();

			// type 구별해주기
			if (item.isFormField()) {
				// type != file	
				
				// 1. 해당 아이디의 정보가 담긴 memberInfo객체 가져옴
				if (item.getFieldName().equals("user_id")) {
					user_id = item.getString("utf-8");
					memberInfo = service.select(user_id);
				}
				
				// 2. 수정된 정보 반영 : 비밀번호 / 이름
				if (item.getFieldName().equals("user_pw")) {
					user_pw = item.getString("utf-8");
					memberInfo.setUser_pw(user_pw); // pw 수정
				}

				if (item.getFieldName().equals("user_name")) {
					user_name = item.getString("utf-8");
					memberInfo.setUser_name(user_name); // name 수정
				}
				
				// * 아이디는 수정 못함
				// * 사용자가 사진 수정 안함 -> 기존 사진 저장

			} else {
				// type == file
				// 2. 수정된 정보 반영 : 사진
				// * 사용자가 사진 수정함 -> 새로운 사진 저장
				if (item.getFieldName().equals("user_photo")) {
					user_photo = item.getName(); // 파일이름
					fileSize = item.getSize(); // 파일 사이즈
					memory = item.isInMemory(); // 메모리 여부
					type = item.getContentType(); // 파일타입
					
					// 파일 골랐을때만 파일 업로드 진행
					if(fileSize>0){
						
						// 중복되지 않도록 이름 처리
						user_photo_name = System.nanoTime() + "_" + user_photo;

						// 파일 업로드
						item.write(new File(dir, user_photo_name));

						memberInfo.setUser_photo(user_photo_name); // 사진 수정

						photo = true;

					}					
				}
			}
		}
	}
%>

<%
	// 2. 해당 아이디의 정보 업데이트
	int rCnt = 0;
	rCnt = service.update(memberInfo, user_id);
%> 


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->

<link rel="stylesheet" href="/lib/css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="/lib/cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/lib/js/bootstrap.js"></script>

<style>
	#user_photo{
		width: 25%;
		height: 25%;
		border: 3px solid black;
		margin: 3px;
		padding: 3px;
	}
	
	img{
		max-width: 100%;
		max-height: auto;
	}
	h2{
		text-align: center;
		color: red;
		font-weight: bold;
	}
	#img_info{
		padding: 5px;
	}
	#move{
		text-align: center;
		color: white;
		background-color: black;
		font-weight: bold;
		padding: 5px;
		margin: 8px;
	}
</style>


</head>
<body>
	

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../../frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="../../frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">
				<%
					if (rCnt > 0) {
				%> 
				<h2>
					회원정보 수정 완료! <%=rCnt%>개 데이터 수정함
				</h2>

				<%
					if (photo) {
				%>
				
				<div id="img_info">
					<span style="font-weight: bold">저장한 이미지 출력</span> <br> 
					<div id="user_photo">
					<img alt="사진"	src="/lib/user_photo_upload/<%=user_photo_name%>" />
					</div>
				파일 이름 : <%=user_photo%>(<%=fileSize%>)<br> 
				파일 타입 : <%=type%><br> 
				저장 파일 이름 : <%=user_photo_name%><br> 
				저장 폴더 : <%=dir%><br> 
				저장 위치 : <%= memory ? "메모리저장" : "임시파일저장" %><br>
				<hr>
				<a id="move" href="myPage.jsp">수정된 정보 확인하기</a>
				</div>
				
				<%
					}
				
				} else {
				%>
						
				<%=rCnt %>
				<h2>회원정보 수정 실패</h2>
				<a id="move" href="<%=request.getContextPath()%>">메인페이지로 돌아가기</a>

				<%
					}
				%>

			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>

</body>
</html>