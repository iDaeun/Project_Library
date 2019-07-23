package library.board.suggestions.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.suggestions.dao.SuggestionsDao;
import library.board.suggestions.model.Suggestion;

public class GetSuggestionService {

	// 글 내용까지 보이게 해보자..
	private GetSuggestionService() {

	}

	private static GetSuggestionService service = new GetSuggestionService();

	public static GetSuggestionService getInstance() {
		return service;
	}

	public Suggestion getSuggestion(int sug_num) {

		Connection conn = null;
		Suggestion sugg = null;

		try {
			conn = ConnectionProvider.getConnection();

			SuggestionsDao dao = SuggestionsDao.getInstance();

			sugg = dao.select(conn, sug_num);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sugg;
	}

}
