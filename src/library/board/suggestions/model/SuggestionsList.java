package library.board.suggestions.model;

import java.util.List;

public class SuggestionsList {
	private int suggestionsTotalCount;
	private int currentPageNumber;
	private List<Suggestion> suggestionsList;
	private int pageTotalCount;
	private int suggestionsCountPerPage;
	private int firstRow;
	private int endRow;

	public SuggestionsList(int suggestionsTotalCount, int currentPageNumber, List<Suggestion> suggestionsList, int suggestionsCountPerPage,
			int firstRow, int endRow) {
		super();
		this.suggestionsTotalCount = suggestionsTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.suggestionsList = suggestionsList;
		this.suggestionsCountPerPage = suggestionsCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;

		CalculatePageTotalCount();
	}

	private void CalculatePageTotalCount() {
		if (suggestionsTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = suggestionsTotalCount / suggestionsCountPerPage;

			if (suggestionsTotalCount % suggestionsCountPerPage > 0) {
				pageTotalCount++;
			}
		}

	}

	public int getSuggestionsTotalCount() {
		return suggestionsTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Suggestion> getSuggestionsList() {
		return suggestionsList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getSuggestionsCountPerPage() {
		return suggestionsCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return suggestionsCountPerPage == 0;
	}

}
