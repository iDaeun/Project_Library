package book.service;

import java.sql.Connection;
import java.sql.SQLException;

import book.dao.BookDao;
import book.model.BookModel;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class BookDeleteService {
	// 싱글톤
	private BookDeleteService() {}
	
	private static BookDeleteService service = new BookDeleteService();
	
	public static BookDeleteService getInstance() {
		return service;
	}
	
	public int deleteBook(String book_name,String book_aut) throws BookNotFoundException, SQLException {
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// 트렌잭션 처리
			conn.setAutoCommit(false);
			
			//BookDao 필요
			BookDao dao = BookDao.getInstance();
			//삭제하려고하는 책이름이랑 같은지 확인
			BookModel bookname = dao.selectChk(conn, book_name);
			
			// 책이존재하는지 확인
			if(bookname == null) {
				throw new BookNotFoundException("해당 책이 존재하지 않습니다 1 : " + book_name);
			}
			
			// 책 존재하면 삭제 정상 처리
			
			resultCnt = dao.delete(conn, book_name,book_aut);
			
			// 정상 처리
			conn.commit();
			
			
			
		} catch (SQLException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e; 
			
		} catch (BookNotFoundException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
			
		}
		
		
		
		return resultCnt;
	}
	public int deleteBook2(String book_name,String book_aut) throws BookNotFoundException, SQLException {
		int resultCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// 트렌잭션 처리
			conn.setAutoCommit(false);
			
			//BookDao 필요
			BookDao dao = BookDao.getInstance();
			//삭제하려고하는 책이름이랑 같은지 확인
			BookModel bookname = dao.selectChk(conn, book_name);
			
			// 책이존재하는지 확인
			if(bookname == null) {
				throw new BookNotFoundException("해당 책이 존재하지 않습니다 : 2" + book_name);
			}
			
			// 책 존재하면 삭제 정상 처리
			
			resultCnt = dao.delete2(conn, book_name,book_aut);
			
			// 정상 처리
			conn.commit();
			
			
			
		} catch (SQLException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e; 
			
		} catch (BookNotFoundException e) {
			// 트렌젝션의 롤백
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
			
		}
		
		
		
		return resultCnt;
	}
	
	
}
