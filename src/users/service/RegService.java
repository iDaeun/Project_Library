package users.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import users.dao.UsersDao;
import users.model.MemberInfo;

public class RegService {
	
	private RegService() {
	}
	
	private static RegService service = new RegService();
	public static RegService getInstance() {
		return service;
	}
	
	public int regInsert(MemberInfo memberInfo) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();
			
			rCnt = dao.regInsert(conn, memberInfo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
