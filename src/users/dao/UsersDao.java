package users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;
import users.model.MemberInfo;

public class UsersDao {

	private static UsersDao dao = new UsersDao();

	public static UsersDao getInstance() {
		return dao;
	}

	private UsersDao() {
	}

	// 아이디 중복체크 기능
	public boolean regCheck(Connection conn, String user_id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean chk = false;
		String sql = "select user_id from users where user_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			// resultSet이 empty한지 체크
			if (rs.next()) {
				// 데이터가 있음
				chk = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("DAO" + chk);
		return chk;
	}

	// 회원가입 -> 회원데이터 입력
	public int regInsert(Connection conn, MemberInfo memberInfo) {

		PreparedStatement pstmt = null;
		int rCnt = 0;
		String sql = "insert into users values (?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberInfo.getUser_id());
			pstmt.setString(2, memberInfo.getUser_pw());
			pstmt.setString(3, memberInfo.getUser_name());
			pstmt.setTimestamp(4, memberInfo.getUser_reg());
			pstmt.setString(5, memberInfo.getUser_photo());

			rCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return rCnt;
	}

	// (아이디&비밀번호 매칭) 입력된 아이디의 memberInfo객체 리턴
	public MemberInfo select(Connection conn, String user_id) {

		MemberInfo memberInfo = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select * from users where user_id = ? ";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				memberInfo = new MemberInfo();

				memberInfo.setUser_id(rs.getString(1));
				memberInfo.setUser_pw(rs.getString(2));
				memberInfo.setUser_name(rs.getString(3));
				memberInfo.setUser_reg(rs.getTimestamp(4));
				memberInfo.setUser_photo(rs.getString(5));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memberInfo;
	}

	// 회원 정보 개수 전체 count
	public int selectCount(Connection conn) {

		Statement stmt = null;
		ResultSet rs = null;
		int memberTotalCnt = 0;

		String sql = "select count(*) from users";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				memberTotalCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memberTotalCnt;
	}

	// startRow & endRow 사이의 리스트 -> 전체 출력
	public List<MemberInfo> selectList(Connection conn, int startRow, int endRow) {

		List<MemberInfo> memberList = new ArrayList<MemberInfo>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select rownum, user_id, user_pw, user_name, user_reg, user_photo "
				+ "from ( select rownum rnum, user_id, user_pw, user_name, user_reg, user_photo "
				+ "from ( select * from users order by user_reg desc ) where rownum <= ? ) " + "where rnum >= ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				MemberInfo memberInfo = new MemberInfo();
				
				memberInfo.setRownum(rs.getInt(1));
				memberInfo.setUser_id(rs.getString(2));
				memberInfo.setUser_pw(rs.getString(3));
				memberInfo.setUser_name(rs.getString(4));
				memberInfo.setUser_reg(rs.getTimestamp(5));
				memberInfo.setUser_photo(rs.getString(6));

				// 반복하며 list에 추가
				memberList.add(memberInfo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memberList;
	}

	// ---------------------------------- 회원탈퇴--------------------------------------
	// FK에 해당 아이디로 있는 내용지우고 PK에 해당 아이디의 회원정보 지워야 한다!!

	// 1. [도서] 해당 아이디가 도서를 대출중이면 -> exception !!! "대출중이 도서가 있습니다, 반납 후 회원탈퇴 가능합니다!"
	// 대출중 = N / 반납함 = Y
	public String selectRentTable(Connection conn, String user_id) {

		String rent = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select book_ren from rent where user_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				rent = rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rent;
	}

	// 반납된 상태이면 -> 통과 (반납을 했으면 이미 id가 지워져있으므로 아이디에 해당되는 도서 내용은 없음)

	// 2. [건의사항] 해당 아이디의 건의사항 내용 삭제
	// 3. [열람실] 해당 아이디가 예약한 좌석 삭제
	// 4. [신청도서] 해당 아이디가 신청한 도서 (여러개 있을 수 있음) 모두 삭제
	public int deleteOtherTable(Connection conn, String table_name, String user_id) throws SQLException {

		int rCnt = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql1 = "select user_id from "+ table_name +" where user_id=?";
		String sql2 = "delete from "+ table_name +" where user_id=?";

		try {
			// 테이블에 해당 아이디에 대한 내용 존재? :
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 존재하면 -> 삭제 :
				PreparedStatement pstmt1 = null;
				pstmt1 = conn.prepareStatement(sql2);
				pstmt1.setString(1, user_id);
				rCnt = pstmt1.executeUpdate();

			}

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rCnt;

	}

	// 5. 아이디에 해당되는 회원정보 삭제
	public int deleteMem(Connection conn, String user_id) throws SQLException {

		int rCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from users where user_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rCnt = pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rCnt;

	}

}
