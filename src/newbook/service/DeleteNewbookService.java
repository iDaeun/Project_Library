package newbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import newbook.dao.LibraryDao;
import newbook.model.Newbook;

public class DeleteNewbookService {

	//--------------------------싱글톤----------------------------------------
	private DeleteNewbookService() {}
	
	private static DeleteNewbookService service = new DeleteNewbookService();
	
	public static DeleteNewbookService getinstance() {
		return service;
	}
	
	//-------------------------메세지 삭제-----------------------------------------------------
	public int deleteNewbook(int newbookNum) throws SQLException{
		
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			conn.setAutoCommit(false);
			 
			LibraryDao dao = LibraryDao.getInstance();
			
			resultCnt = dao.deleteNewbook(conn, newbookNum);
			
			// 정상 처리
			conn.commit();
			
		} catch (SQLException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} 
		
		return resultCnt; 
	}
}
