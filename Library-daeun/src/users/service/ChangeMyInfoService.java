package users.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import users.dao.UsersDao;
import users.model.MemberInfo;

public class ChangeMyInfoService {
	
	private ChangeMyInfoService() {
	}
	
	private static ChangeMyInfoService service = new ChangeMyInfoService();
	public static ChangeMyInfoService getInstance() {
		return service;
	}
	
	// 해당 아이디로 회원 정보 검색
	public MemberInfo select(String user_id) {
		
		MemberInfo memberInfo = null;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();
			
			memberInfo = dao.select(conn, user_id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberInfo;
	}
	
	// 수정 정보 업데이트
	public int update(MemberInfo memberInfo, String user_id) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();
			
			rCnt = dao.update(conn, memberInfo, user_id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
