package newbook.model;

import java.util.List;

public class NewbookListView {
	
	
	private int newbookTotalCount; //newbook 객체의 수 
	private int currentPageNumber; //현재 페이지 
	private List<Newbook> newbookList; //Newbook객체를 List에 저장
	
	private int pageTotalCount; //총 페이지 수
	private int newbookCountPerPage; //한 페이지 당 메시지 수
	
	private int firstRow; 
	private int endRow;
	
	
	public NewbookListView(int newbookTotalCount, int currentPageNumber, List<Newbook> newbookList,
			int newbookCountPerPage, int firstRow, int endRow) {
		
		this.newbookTotalCount = newbookTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.newbookList = newbookList;
		this.newbookCountPerPage = newbookCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calcuratePageTotalCount();
	}

	private void calcuratePageTotalCount() {
		
		if(newbookTotalCount == 0) {
			pageTotalCount = 0;
		
		} else {	
			pageTotalCount = newbookTotalCount / newbookCountPerPage; //총페이지 수 = 총 메세지 수 / 한 페이지 당 메세지 수 
			
			if(newbookTotalCount % newbookCountPerPage > 0) {
				pageTotalCount++; //총 페이지수 + 1
			}
			
		}
		
	}

	public int getNewbookTotalCount() {
		return newbookTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Newbook> getNewbookList() {
		return newbookList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getNewbookCountPerPage() {
		return newbookCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return newbookCountPerPage == 0;
	}


}