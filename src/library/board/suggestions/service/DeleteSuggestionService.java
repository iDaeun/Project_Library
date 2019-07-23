package library.board.suggestions.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.suggestions.dao.SuggestionsDao;
import library.board.suggestions.model.Suggestion;

public class DeleteSuggestionService {
	private DeleteSuggestionService() {
	}

	private static DeleteSuggestionService service = new DeleteSuggestionService();

	public static DeleteSuggestionService getInstance() {
		return service;
	}

	public int deleteSuggestion(int sug_num) {

		int resultCnt = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			// delete는 주의하자..!
			conn.setAutoCommit(false);

			SuggestionsDao dao = SuggestionsDao.getInstance();

			/* Suggestion sugg = dao.select(conn, sug_num); */

			dao.deleteSuggestion(conn, sug_num);

			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultCnt;
	}
}
