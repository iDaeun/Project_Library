package book.service;

import java.sql.Connection;

import book.dao.BookDao;
import jdbc.ConnectionProvider;

// 대출
public class BookTurnService {
	
	// 싱글톤
	private BookTurnService() {}
	
	private static BookTurnService service = new BookTurnService();
	
	public static BookTurnService getInstance() {
		return service;
	}
	
	
	public int BookTurn(String user_id, String book_name) {
		int rCnt = 0;
		
		Connection conn =null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BookDao dao = BookDao.getInstance();
			
			rCnt = dao.turn(conn, user_id,book_name);
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return rCnt;
	}
	
	
}
