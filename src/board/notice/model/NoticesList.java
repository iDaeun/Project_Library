package library.board.notice.model;

import java.util.List;

public class NoticesList {
	private int noticesTotalCount;
	private int currentPageNumber;
	private List<Notice> noticesList;
	private int pageTotalCount;
	private int noticesCountPerPage;
	private int firstRow;
	private int endRow;

	public NoticesList(int noticesTotalCount, int currentPageNumber, List<Notice> noticesList, int noticesCountPerPage,
			int firstRow, int endRow) {
		super();
		this.noticesTotalCount = noticesTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.noticesList = noticesList;
		this.noticesCountPerPage = noticesCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;

		CalculatePageTotalCount();
	}

	private void CalculatePageTotalCount() {
		if (noticesTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = noticesTotalCount / noticesCountPerPage;

			if (noticesTotalCount % noticesCountPerPage > 0) {
				pageTotalCount++;
			}
		}

	}

	public int getNoticesTotalCount() {
		return noticesTotalCount;
	}

	public void setNoticesTotalCount(int noticesTotalCount) {
		this.noticesTotalCount = noticesTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Notice> getNoticesList() {
		return noticesList;
	}

	public void setNoticesList(List<Notice> noticesList) {
		this.noticesList = noticesList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getNoticesCountPerPage() {
		return noticesCountPerPage;
	}

	public void setNoticesCountPerPage(int noticesCountPerPage) {
		this.noticesCountPerPage = noticesCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public boolean isEmpty() {
		return noticesCountPerPage == 0;
	}

}