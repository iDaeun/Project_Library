package users.service;

import java.sql.Connection;
import java.sql.SQLException;
import jdbc.ConnectionProvider;
import users.dao.UsersDao;
import users.model.MemberInfo;


public class MyPgService {
	private MyPgService() {
		
	}

	private static MyPgService service = new MyPgService();

	public static MyPgService getInstance() {
		return service;
	}
	
	public MemberInfo selectMyInfo(String user_id) {
		
		MemberInfo memberInfo = new MemberInfo();

		Connection conn = null;
		

		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();
			
			// 정보 저장된 객체 리턴
			memberInfo = dao.select(conn, user_id);
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberInfo;
	}
}