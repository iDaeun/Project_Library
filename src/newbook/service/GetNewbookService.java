package newbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import newbook.dao.LibraryDao;
import newbook.model.Newbook;

public class GetNewbookService {

	//--------------------------싱글톤----------------------------------------
	private GetNewbookService() {};
	
	private static GetNewbookService service = new GetNewbookService();
	
	public static GetNewbookService getInstance() {
		return service;
	}
	
	//Newbook객체를 불러오는 dao호출
	public Newbook getNewbook(int newbookNum){
		
		Newbook newbook = null;
		Connection conn = null;
		
		try {
		conn = ConnectionProvider.getConnection();
		
		LibraryDao dao = LibraryDao.getInstance();
		
		newbook = dao.select(conn, newbookNum);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newbook;
	}
}
