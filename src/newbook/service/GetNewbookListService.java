package newbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import newbook.dao.LibraryDao;
import newbook.model.Newbook;
import newbook.model.NewbookListView;


public class GetNewbookListService {
	
	// MessageListView 를 생성해서 결과로 반환
	
	private GetNewbookListService() {}
	
	private static GetNewbookListService service = new GetNewbookListService();
	
	public static GetNewbookListService getInstance() {
		return service;
	}
	
	// 한페이지에 보여줄 게시글의 개수
	private static final int MESSAGE_COUNT_PER_PAGE = 5;
	
	
	public NewbookListView getNewbookListView(int pageNumber) {
		
		int currentPageNumber = pageNumber; //현재 페이지 번호
		
		Connection conn;
		
		NewbookListView view = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			LibraryDao dao = LibraryDao.getInstance();
			
			// 전체 게시물의 개수
			int newbookTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
			List<Newbook> newbookList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(newbookTotalCount > 0) {
				
				//한 페이지 당 반영할 Member의 번호를 반영(예: 한 페이지 당 5개씩 반영하면 메세지 rownum이 1~5/6~10... 
				firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE + 1; 
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
				
				//newbook 객체 생성 및 newbookList Map에 newbook 객체 저장
				newbookList = dao.selectList(conn, firstRow, endRow);
				
			} else {
				currentPageNumber = 0;
				newbookList = Collections.emptyList();						
			}
			
			view  = new NewbookListView(
					newbookTotalCount, 
					currentPageNumber, 
					newbookList, 
					MESSAGE_COUNT_PER_PAGE, 
					firstRow, 
					endRow);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return view;
		
	}

}