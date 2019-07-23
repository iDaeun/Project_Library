package StudyRoom.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import StudyRoom.model.Study_room;
import StudyRoom.model.user;
import jdbc.JdbcUtil;

public class StudyRoomDAO {

	private StudyRoomDAO() {
	};

	private static StudyRoomDAO dao = new StudyRoomDAO();

	public static StudyRoomDAO getInstance() {
		return dao;
	};

	// 데이터 추가 메소드
	public int insert(Connection conn, Study_room sr) {

		int insertCnt = 0;
		PreparedStatement psmt = null;

		String sql = "insert into STUDY_ROOM (STUDY_TIME,USER_ID,SEAT_NUM) values(?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, sr.getStudy_time());
			psmt.setString(2, sr.getUser_id());
			psmt.setInt(3, sr.getSeat_num());

			insertCnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return insertCnt;
	};

	// 아이디에 따른 데이터 검색 메소드
	public user select(Connection conn, String user_id) {

		user room = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select STUDY_TIME, SEAT_NUM from STUDY_ROOM where user_id = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user_id);

			rs = stmt.executeQuery();

			if (rs.next()) {
				room = new user();
				room.setStudy_time(rs.getInt(1));
				room.setSeat_num(rs.getInt(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
		}

		return room;
	};

	// 데이터 수정 메소드
	public int update(Connection conn, String uId, int seat_num, int seat_time) {

		Study_room sr = null;

		int updateCnt = 0;
		PreparedStatement psmt = null;

		String sql = "update study_room set STUDY_TIME = ? , SEAT_NUM = ? where USER_ID = ?";

		try {
			psmt = conn.prepareStatement(sql);
			sr = new Study_room();
			psmt.setInt(1, seat_time);
			psmt.setInt(2, seat_num);
			psmt.setString(3, uId);

			updateCnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return updateCnt;
	};

	// 좌석 중복체크
	public int chk(Connection conn, int time) {

		int room = 0;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select SEAT_NUM from STUDY_ROOM where STUDY_TIME = ?";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, time);

			rs = stmt.executeQuery();
			if (rs.next()) {
				room = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
		}

		return room;
	};

	// 데이터 삭제 메소드
	public int delete(Connection conn, String user_id) {

		int room = 0;
		PreparedStatement stmt = null;

		String sql = "delete STUDY_ROOM where USER_ID = ? ";

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user_id);

			room = stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
		}

		return room;
	};

	// 관리자 아이디로 검색하면 나오는 전체리스트 메소드
	public List<Study_room> allselect(Connection conn) {

		List<Study_room> list = new ArrayList<Study_room>();

		Statement stmt = null;
		ResultSet rs = null;

		String sql = "select USER_ID, STUDY_TIME, SEAT_NUM from STUDY_ROOM";

		try {
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Study_room room = new Study_room();
				room.setUser_id(rs.getString(1));
				room.setStudy_time(rs.getInt(2));
				room.setSeat_num(rs.getInt(3));

				list.add(room);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} /*
			 * finally { JdbcUtil.close(stmt); }
			 */

		return list;
	};

	// 관리자 아이디로 검색하면 나오는 전체리스트 메소드
	public List<Study_room> selectId(Connection conn, String user_id) {

		List<Study_room> list = new ArrayList<Study_room>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select USER_ID, STUDY_TIME, SEAT_NUM from STUDY_ROOM WHERE USER_ID = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Study_room room = new Study_room();
				room.setUser_id(rs.getString(1));
				room.setStudy_time(rs.getInt(2));
				room.setSeat_num(rs.getInt(3));

				list.add(room);
				System.out.println("성공");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} /*
			 * finally { JdbcUtil.close(stmt); }
			 */

		return list;
	};

}
