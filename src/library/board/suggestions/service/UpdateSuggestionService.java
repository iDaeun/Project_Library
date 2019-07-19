package library.board.suggestions.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.suggestions.dao.SuggestionsDao;

public class UpdateSuggestionService {

	private static UpdateSuggestionService service = new UpdateSuggestionService();

	public static UpdateSuggestionService getInstance() {
		return service;
	}

	private UpdateSuggestionService() {

	}

	public int updateSuggestion(int sug_num, String sug_title, String sug_cont) {
		int rCnt = 0;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			SuggestionsDao dao = SuggestionsDao.getInstance();

			rCnt = dao.update(conn, sug_num, sug_title, sug_cont);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
	}

	public int updateComment(int sug_num, String sug_comment) {
		int rCnt = 0;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			SuggestionsDao dao = SuggestionsDao.getInstance();
			rCnt = dao.updateComment(conn, sug_num, sug_comment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
	}
}
