package newbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import book.model.BookModel;
import jdbc.JdbcUtil;
import newbook.model.Newbook;

public class LibraryDao {

//-------------------------------싱글톤 처리-----------------------------------------------	
	private static LibraryDao dao = new LibraryDao();

	public static LibraryDao getInstance() {
		return dao;
	}

	private LibraryDao() {
	}

//-----------------------------메서드1: 데이터베이스에 저장----------------------------------	
	public int insert(Connection conn, Newbook newbook) {

		int newbookNum = 0;
		int rCnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "INSERT INTO NEWBOOK " + " (NEWBOOK_NUM, NEWBOOK_NAME, NEWBOOK_AUT, NEWBOOK_PUB, USER_ID) "
				+ " VALUES(NO_SEQ.nextval,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newbook.getNewName());
			pstmt.setString(2, newbook.getNewAut());
			pstmt.setString(3, newbook.getNewPub());
			pstmt.setString(4, newbook.getUserid());

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

//-------------------------------메서드2: 책에 대한 정보를 뽑아와서 newbook객체로 만들기----------------------------------		
	 public Newbook select(Connection conn, int newbookNum) {

		 Newbook newbook = null;

		 PreparedStatement pstmt = null;
		 ResultSet rs = null;

		 String sql = "select * from Newbook where NEWBOOK_NUM=?";

		 try {
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1, newbookNum);

		 rs = pstmt.executeQuery();

		 if(rs.next()) {
		 newbook = new Newbook();
		 newbook.setNewbookNum(rs.getInt(1));
		 newbook.setNewName(rs.getString(2));
		 newbook.setNewAut(rs.getString(3));
		 newbook.setNewPub(rs.getString(4));
		 newbook.setUserid(rs.getString(5));
		 }
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }

		 return newbook;

		 }  

//------------------------메서드3: 전체 책의 개수----------------------------------------------------
	public int selectCount(Connection conn) {

		Statement stmt = null;
		ResultSet rs = null;

		int totalCnt = 0;

		String sql = "select count(*) from newbook";

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

//-------------------------메서드 4: 데이터베이스 데이터 순서대로 정렬 후 가져와서 newbook리스트에 저장--------------------------------------------	
	public List<Newbook> selectList(Connection conn, int firstRow, int endRow) {

		List<Newbook> list = new ArrayList<Newbook>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select newbook_num, newbook_name, newbook_aut, newbook_pub, USER_ID from ( "
				+ " select rownum rnum, newbook_num, newbook_name, newbook_aut, newbook_pub, USER_ID from ( "
				+ " select * from newbook n order by n.newbook_num desc " + " ) where rownum <= ? "
				+ " ) where rnum >= ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Newbook newbook = new Newbook();
				newbook.setNewbookNum(rs.getInt(1));
				newbook.setNewName(rs.getString(2));
				newbook.setNewAut(rs.getString(3));
				newbook.setNewPub(rs.getString(4));
				newbook.setUserid(rs.getString(5));

				list.add(newbook);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

//----------------------------메서드 5: 책 번호를 검색하여 데이터 삭제------------------------------------------		
	public int deleteNewbook(Connection conn, int newbookNum) throws SQLException {
		// PreparedStatement 객체 생성
		PreparedStatement pstmt = null;

		String sql = "delete from NEWBOOK where NEWBOOK_NUM=?";
		int resultCnt = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newbookNum);
			resultCnt = pstmt.executeUpdate();

		} finally {

			JdbcUtil.close(pstmt);
		}

		return resultCnt;

	}

//----------------------------메서드 6: 책번호를 검색하여 데이터 수정-----------------------------------------		
	public int updateNewbook(Connection conn, Newbook newbook, int newbookNum) throws SQLException {
		// 필요한 변수 생성

		// PreparedStatement 객체 생성
		PreparedStatement pstmt = null;;
		int resultCnt = 0;
		
		String sql = "update NEWBOOK set NEWBOOK_NAME=?, NEWBOOK_AUT=?, NEWBOOK_PUB=? where NEWBOOK_NUM=?";
		
		try {	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newbook.getNewName());
			pstmt.setString(2, newbook.getNewAut());
			pstmt.setString(3, newbook.getNewPub());
			pstmt.setInt(4, newbookNum);
			resultCnt = pstmt.executeUpdate();

		} finally {

			JdbcUtil.close(pstmt);
		}

		return resultCnt;

	}

//----------------------------메서드 7: 체크여부에 따라서 T,F 컬럼추가-----------------------------------------		
	public int updateNewbookBuy(Connection conn, int newbookNum) {

		int rCnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE NEWBOOK SET NEWBOOK_BUY='T' WHERE NEWBOOK_NUM=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newbookNum);

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
	
//----------------------------메서드 8: 책리스트 뽑아내서 반환하기-----------------------------------------		
	public List<Newbook> selectList(Connection conn) {

		List<Newbook> list = new ArrayList<Newbook>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select newbook_num, newbook_name, newbook_aut, newbook_pub, USER_ID, newbook_buy from newbook where newbook_buy='T'";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Newbook newbook = new Newbook();
				newbook.setNewbookNum(rs.getInt(1));
				newbook.setNewName(rs.getString(2));
				newbook.setNewAut(rs.getString(3));
				newbook.setNewPub(rs.getString(4));
				newbook.setUserid(rs.getString(5));
				newbook.setBuybook(rs.getString(6));

				list.add(newbook);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
