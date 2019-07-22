package book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import book.dao.BookDao;
import book.model.AllModel;
import book.model.BookListView;
import book.model.BookModel;
import jdbc.ConnectionProvider;

public class GetBookListService {
	
	// BookListView 를 생성해서 결과로 반환
	
	private GetBookListService() {}
	
	private static GetBookListService service = new GetBookListService();
	
	public static GetBookListService getInstance() {
		return service;
	}
	
	// 1. 한페이지에 보여줄 게시글의 개수
	private static final int BOOK_COUNT_PER_PAGE = 5;
	
	
	public BookListView getBookListView(int pageNumber) {
		
		// 2. 현재 페이지 번호
		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		BookListView view = null;
		
		try {
			// Connection 
			conn = ConnectionProvider.getConnection();
			
			// DAO
			BookDao dao = BookDao.getInstance();
			
			// 전체 게시물의 개수
			int BookTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
			List<AllModel> allList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(BookTotalCount > 0) {
				
				firstRow = (pageNumber-1)*BOOK_COUNT_PER_PAGE + 1;
				endRow = firstRow + BOOK_COUNT_PER_PAGE -1;
				
				allList = dao.selectList(conn, firstRow, endRow);
				
			} else {
				currentPageNumber = 0;
									
			}
			
			view  = new BookListView(
					BookTotalCount, 
					currentPageNumber, 
					allList, 
					BOOK_COUNT_PER_PAGE, 
					firstRow, 
					endRow);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return view;
		
	}
	
	
	
	
	

}