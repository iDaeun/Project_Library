package book.service;

import java.sql.Connection;
import java.sql.SQLException;

import book.dao.BookDao;
import book.model.JoinModel;
import jdbc.ConnectionProvider;

public class BookSelectService {
	// 싱글톤
	private BookSelectService() {}
	
	private static BookSelectService service = new BookSelectService();
	
	public static BookSelectService getInstance() {
		return service;
	}
	
	public JoinModel selectBook(String book_name) {
		JoinModel joinmodel = null;
		
		Connection conn =null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BookDao dao = BookDao.getInstance();
			
			joinmodel = dao.select(conn, book_name);
			
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
		
		
		return joinmodel;
	}
	
	
}
