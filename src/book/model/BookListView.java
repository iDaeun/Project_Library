package book.model;

import java.util.List;

public class BookListView {
	
	
	private int BookTotalCount;  // 도서 전체
	private int currentPageNumber;
	private List<AllModel> allList;
	private int pageTotalCount;
	private int BookCountPerPage;
	private int firstRow;
	private int endRow;
	
	public BookListView(int BookTotalCount, int currentPageNumber, List<AllModel> allList,
			int BookCountPerPage, int firstRow, int endRow) {
		
		this.BookTotalCount = BookTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.allList = allList;
		this.BookCountPerPage = BookCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calcuratePageTotalCount();
	}

	private void calcuratePageTotalCount() {
		
		if(BookTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			
			pageTotalCount = BookTotalCount / BookCountPerPage;
			
			if( BookTotalCount % BookCountPerPage > 0) {
				pageTotalCount++;
			}
			
		}
		
		
		
	}

	public int getBookTotalCount() {
		return BookTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<AllModel> getallList() {
		return allList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getBookCountPerPage() {
		return BookCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	
	public boolean isEmpty() {
		return BookCountPerPage == 0;
	}
	
	
	
	
	
	

}