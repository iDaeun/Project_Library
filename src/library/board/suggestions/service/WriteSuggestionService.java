package library.board.suggestions.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.suggestions.dao.SuggestionsDao;
import library.board.suggestions.model.Suggestion;

public class WriteSuggestionService {

	private static WriteSuggestionService service = new WriteSuggestionService();

	public static WriteSuggestionService getInstance() {
		return service;
	}

	private WriteSuggestionService() {

	}

	public int write(Suggestion sugg, String user_id) {

		int rCnt = 0;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			SuggestionsDao sugDao = SuggestionsDao.getInstance();
			/* System.out.println(user_id); */
			rCnt = sugDao.insert(conn, sugg, user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;

	}
}
