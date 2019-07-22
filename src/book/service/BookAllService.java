package book.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import book.dao.BookDao;
import book.model.AllModel;
import jdbc.ConnectionProvider;

public class BookAllService {
	private BookAllService() {}
	private static BookAllService service = new BookAllService();
	public static BookAllService getInstance() {
		return service;
	}
	
	public List<AllModel> allselect(){
		List<AllModel> list = new ArrayList<AllModel>();
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			
			BookDao dao = BookDao.getInstance();
			
			list = dao.allselect(conn);
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return list;
	}
	
	
}
