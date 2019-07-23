package book.service;

import java.sql.Connection;

import book.dao.BookDao;
import book.model.BookModel;
import jdbc.ConnectionProvider;
import newbook.model.Newbook;

public class WriteBookService {
	// 싱글톤
	private WriteBookService() {}
	
	private static WriteBookService service = new WriteBookService();
	
	public static WriteBookService getInstance() {
		return service;
	}
	// 신청 도서 추가
		public int writeNewbook(Newbook newbook) {
			int rCnt = 0;
			
			Connection conn =null;
			
			try {
				// 커넥션 생성
				conn = ConnectionProvider.getConnection();
				
				// 2. dao 생성
				BookDao dao = BookDao.getInstance();
				
				// 3. insert 메서드 실행
				
				rCnt = dao.insertNewbook(conn, newbook);
				
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			System.out.println("Serivce rCnt는 "+ rCnt);
			return rCnt;
		}
		
		// insert2 (신청도서 대출시스템에 추가)
			public int writeNewbook2() {
				int rs =0;
				Connection conn =null;
				
				try {
					// 커넥션 생성
					conn = ConnectionProvider.getConnection();
					
					// 2. dao 생성
					BookDao dao = BookDao.getInstance();
					
					// 3. insert 메서드 실행
					
					rs = dao.insert2(conn);
					
				}catch (Exception e) {
					// TODO: handle exception
				}
				return rs;
			}
			
	// 도서 추가
	public int write(BookModel bookmodel) {
		int rCnt = 0;
		
		Connection conn =null;
		
		try {
			// 커넥션 생성
			conn = ConnectionProvider.getConnection();
			
			// 2. dao 생성
			BookDao dao = BookDao.getInstance();
			
			// 3. insert 메서드 실행
			
			rCnt = dao.insert(conn, bookmodel);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return rCnt;
	}
	
	// insert2 (대출시스템에 추가)
	public int write2() {
		int rs =0;
		Connection conn =null;
		
		try {
			// 커넥션 생성
			conn = ConnectionProvider.getConnection();
			
			// 2. dao 생성
			BookDao dao = BookDao.getInstance();
			
			// 3. insert 메서드 실행
			
			rs = dao.insert2(conn);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
}
