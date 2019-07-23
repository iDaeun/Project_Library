package book.service;

import java.sql.Connection;
import java.sql.SQLException;

import book.dao.BookDao;
import book.model.BookJung;
import jdbc.ConnectionProvider;

public class BookJungService {
	
	// 싱글톤
		private BookJungService() {}
		
		private static BookJungService service = new BookJungService();
		
		public static BookJungService getInstance() {
			return service;
		}
	
		public BookJung jungbook(String book_name,String book_aut) {
			BookJung book = null;
			
			Connection conn =null;
			
			try {
				conn = ConnectionProvider.getConnection();
				
				BookDao dao = BookDao.getInstance();
				
				book = dao.bookjung(conn, book_name,book_aut);
				
			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			return book;
		}
		
	
}
