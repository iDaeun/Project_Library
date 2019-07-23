package book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import book.dao.BookDao;
import book.model.RentalList;
import jdbc.ConnectionProvider;

public class BookRentListService {

private BookRentListService() {}
	
	private static BookRentListService service = new BookRentListService();
	
	public static BookRentListService getInstance() {
		return service;
	}
	
	public List<RentalList> rentalList(String user_id) {
		List<RentalList> rentallist = null;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			BookDao dao = BookDao.getInstance();
			
			rentallist = dao.rentallist(conn, user_id);
			
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
		
		
		
		return rentallist;
	}
	
}
