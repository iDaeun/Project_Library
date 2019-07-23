package newbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import newbook.dao.LibraryDao;
import newbook.model.Newbook;

public class UpdateNewbookService {
	//--------------------------싱글톤----------------------------------------
	
		private UpdateNewbookService() {}
		
		private static UpdateNewbookService service = new UpdateNewbookService();
		
		public static UpdateNewbookService getinstance() {
			return service;
		}
		
		//-------------------------메세지 삭제-----------------------------------------------------
		public int updateNewbook(int newbookNum, Newbook aNewbook) throws SQLException{
			
			int resultCnt = 0;
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				
				conn.setAutoCommit(false);
				 
				LibraryDao dao = LibraryDao.getInstance();
				
				resultCnt = dao.updateNewbook(conn, aNewbook, newbookNum);
				
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
