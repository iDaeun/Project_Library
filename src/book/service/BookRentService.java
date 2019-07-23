package book.service;

import java.sql.Connection;

import book.dao.BookDao;
import jdbc.ConnectionProvider;

// 대출
public class BookRentService {
	
	// 싱글톤
	private BookRentService() {}
	
	private static BookRentService service = new BookRentService();
	
	public static BookRentService getInstance() {
		return service;
	}
	
	
	public int BookRent(String user_id,String book_name) {
		int rCnt = 0;
		
		Connection conn =null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BookDao dao = BookDao.getInstance();
			
			rCnt = dao.rent(conn,user_id,book_name);
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return rCnt;
	}
	
	
}
