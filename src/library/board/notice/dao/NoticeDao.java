package library.board.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import library.board.notice.model.Notice;

public class NoticeDao {
	static NoticeDao notDao = new NoticeDao();

	public static NoticeDao getInstance() {
		return notDao;
	}

	private NoticeDao() {
	}

	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;

		int totalCnt = 0;

		String sql = "SELECT COUNT(*) FROM NOTICES";

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

	public List<Notice> selectList(Connection conn, int firstRow, int endRow) {

		List<Notice> list = new ArrayList<Notice>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select NOT_NUM, NOT_TITLE, NOT_CONT, USER_ID, NOT_REG from (\r\n"
				+ "select rownum rnum, NOT_NUM, NOT_TITLE, NOT_CONT, USER_ID, NOT_REG from (\r\n"
				+ "select * from NOTICES n order by n.NOT_NUM desc) where rownum <= ?) where rnum >= ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Notice not = new Notice();
				not.setNot_num(rs.getInt(1));
				not.setNot_title(rs.getString(2));
				not.setNot_cont(rs.getString(3));
				not.setUser_id(rs.getString(4));
				not.setNot_reg(rs.getString(5));

				list.add(not);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public Notice select(Connection conn, int not_num) {

		Notice notic = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = "SELECT * FROM NOTICES WHERE NOT_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, not_num);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				notic = new Notice();
				notic.setNot_num(rs.getInt(1));
				notic.setNot_title(rs.getString(2));
				notic.setNot_cont(rs.getString(3));
				notic.setUser_id(rs.getString(4));
				notic.setNot_reg(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return notic;
	}

	public int delete(Connection conn, int not_num) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM NOTICES WHERE NOT_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, not_num);

			resultCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultCnt;
	}

	public int insert(Connection conn, Notice notic) {
		int rCnt = 0;

		PreparedStatement pstmt = null;

		String sql = "INSERT INTO NOTICES(NOT_NUM, NOT_TITLE, NOT_CONT, NOT_REG) VALUES (NOT_NUM_SEQ.nextval, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notic.getNot_title());
			pstmt.setString(2, notic.getNot_cont());

			SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
			String regDate = format.format(new Date());
			pstmt.setString(3, regDate);

			rCnt = pstmt.executeUpdate();
			System.out.println(rCnt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rCnt;
	}

	public int update(Connection conn, int not_num, String not_title, String not_cont) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "UPDATE NOTICES SET NOT_TITLE = ?, NOT_CONT = ? WHERE NOT_NUM = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, not_title);
			pstmt.setString(2, not_cont);
			pstmt.setInt(3, not_num);

			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultCnt;
	}

}
