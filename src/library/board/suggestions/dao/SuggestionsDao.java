package library.board.suggestions.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import library.board.suggestions.model.Suggestion;

public class SuggestionsDao {

	static SuggestionsDao sugDao = new SuggestionsDao();

	public static SuggestionsDao getInstance() {
		return sugDao;
	}

	private SuggestionsDao() {
	}

	public int insert(Connection conn, Suggestion sugg, String user_id) {

		int rCnt = 0;

		PreparedStatement pstmt = null;
		// 글 번호, 글 비밀번호, 글 제목, 글 내용, 회원 번호
		String sql = "INSERT INTO SUGGESTIONS(SUG_NUM, SUG_TITLE, SUG_CONT, USER_ID) VALUES(SUG_NUM_SEQ.nextval, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sugg.getSug_title());
			pstmt.setString(2, sugg.getSug_cont());
			pstmt.setString(3, user_id);

			rCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rCnt;
	}

	public Suggestion select(Connection conn, int sug_num) {
		Suggestion sugg = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = "SELECT * FROM SUGGESTIONS WHERE SUG_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sug_num);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				sugg = new Suggestion();
				sugg.setSug_num(rs.getInt(1));
				sugg.setSug_title(rs.getString(2));
				sugg.setSug_cont(rs.getString(3));
				sugg.setUser_id(rs.getString(4));
				sugg.setSug_comment(rs.getString(5));
				/* System.out.println(sugg.getSug_num()); */
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sugg;
	}

	// 글의 전채 개수를 카운트..!
	public int selectCount(Connection conn) {

		Statement stmt = null;
		ResultSet rs = null;

		int totalCnt = 0;

		String sql = "SELECT COUNT(*) FROM SUGGESTIONS";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCnt;
	}

	// 글 리스트를 뽑아내볼까?
	public List<Suggestion> selectList(Connection conn, int firstRow, int endRow) {

		List<Suggestion> list = new ArrayList<Suggestion>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select sug_num, sug_title, user_id, sug_comment from ("
				+ "select rownum rnum, sug_num, sug_title, user_id, sug_comment from ("
				+ "select * from suggestions s order by s.sug_num desc) " + "where rownum <= ?) where rnum >= ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Suggestion sugg = new Suggestion();
				sugg.setSug_num(rs.getInt(1));
				sugg.setSug_title(rs.getString(2));
				sugg.setUser_id(rs.getString(3));
				sugg.setSug_comment(rs.getString(4));

				list.add(sugg);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 글 삭제를 해볼까?
	public int deleteSuggestion(Connection conn, int sug_num) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM SUGGESTIONS WHERE SUG_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sug_num);

			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultCnt;
	}

	public int update(Connection conn, int sug_num, String sug_title, String user_cont) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "UPDATE SUGGESTIONS SET SUG_TITLE = ?, SUG_CONT = ? WHERE SUG_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sug_title);
			pstmt.setString(2, user_cont);
			pstmt.setInt(3, sug_num);

			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultCnt;
	}

	public int updateComment(Connection conn, int sug_num, String sug_comment) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "UPDATE SUGGESTIONS SET SUG_COMMENT = ? WHERE SUG_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sug_comment);
			pstmt.setInt(2, sug_num);

			resultCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultCnt;
	}
}
