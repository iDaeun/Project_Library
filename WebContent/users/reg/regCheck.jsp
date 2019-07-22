<%@page import="users.dao.UsersDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %> 

<%
	String user_id = request.getParameter("user_id");

	boolean chk = false;
	Connection conn = null;

	try {
		conn = ConnectionProvider.getConnection();

		// DAO -> DB에 해당 아이디가 존재하는지 확인
		UsersDao dao = UsersDao.getInstance();
		chk = dao.regCheck(conn, user_id);
		System.out.println("regChek1"+chk);
		if (chk) {
			out.print("N");
			System.out.println("regChek2"+chk);
		} else {
			out.print("Y");
			System.out.println("regChek3"+chk);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	}
%>