package newbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import newbook.dao.LibraryDao;
import newbook.model.Newbook;

public class GetAdminBookListService {

	private GetAdminBookListService() {}
	private static GetAdminBookListService service = new GetAdminBookListService();
	public static GetAdminBookListService getInstance() {
		return service;
	}

public int updateNewbook(int newbookNum) throws SQLException {
	
	int rCnt = 0;
	
	Connection conn = null;
	
	try {
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		LibraryDao dao = LibraryDao.getInstance();
		rCnt = dao.updateNewbookBuy(conn, newbookNum);
		conn.commit();
		
	} catch (Exception e) {
		JdbcUtil.rollback(conn);
		e.printStackTrace();
		throw e;
	}
	return rCnt;
}

}

