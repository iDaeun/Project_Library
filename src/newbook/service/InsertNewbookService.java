package newbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import newbook.dao.LibraryDao;
import newbook.model.Newbook;

public class InsertNewbookService {

	//-------------------------싱글톤----------------------------------------------
	private static InsertNewbookService service = new InsertNewbookService();
	
	public static InsertNewbookService getInstance() {
		return service;
	}
	
	private InsertNewbookService() {}
	
	//-------------------------저장메서드---------------------------------------
	public int insert(Newbook newbook) {
		
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			LibraryDao dao = LibraryDao.getInstance();
			
			rCnt = dao.insert(conn, newbook);

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("Serivce rCnt는 "+ rCnt);
		return rCnt;	
		
	}
}

