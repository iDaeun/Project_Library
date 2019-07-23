package library.board.suggestions.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import library.board.suggestions.dao.SuggestionsDao;
import library.board.suggestions.model.Suggestion;
import library.board.suggestions.model.SuggestionsList;

public class GetSuggestionListService {

	// 건의사항 리스트를 출력할 수 있도록 처리해보자...!
	// 글 번호, 글 제목, 작성자 만 뽑아볼까?

	private GetSuggestionListService() {

	}

	private static GetSuggestionListService service = new GetSuggestionListService();

	public static GetSuggestionListService getInstance() {
		return service;
	}

	// 페이지에 보여즐 게시글의 개수
	private static final int SUGGESTIONS_COUNT_PER_PAGE = 5;

	public SuggestionsList getSuggestionsList(int pageNumber) {

		int currentPageNumber = pageNumber;

		Connection conn = null;

		SuggestionsList list = null;

		try {
			conn = ConnectionProvider.getConnection();

			SuggestionsDao dao = SuggestionsDao.getInstance();

			int suggestionsTotalCount = dao.selectCount(conn);

			// 게시물 리스트..!
			List<Suggestion> suggestionsList = null;
			int firstRow = 0;
			int endRow = 0;

			if (suggestionsTotalCount > 0) {

				firstRow = (pageNumber - 1) * SUGGESTIONS_COUNT_PER_PAGE + 1;
				endRow = firstRow + SUGGESTIONS_COUNT_PER_PAGE - 1;

				suggestionsList = dao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				suggestionsList = Collections.emptyList();
			}

			list = new SuggestionsList(suggestionsTotalCount, currentPageNumber, suggestionsList,
					SUGGESTIONS_COUNT_PER_PAGE, firstRow, endRow);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
