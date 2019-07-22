package newbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import newbook.model.Newbook;

public class UserLibraryDao {

//------------------------user일 경우 dao만 모아놓은 클래스--------------------------------
//------------------------SingleTon--------------------------------	
	private static UserLibraryDao dao = new UserLibraryDao();

	public static UserLibraryDao getInstance() {
		return dao;
	}
	
	private UserLibraryDao() {}
//-------------------------메서드 1: 리스트에서 특정 user의 책의 개수--------------------------------------------
	
	public int selectCount(Connection conn, String userid) {

			PreparedStatement pstmt = null;
			ResultSet rs = null;

			int totalCnt = 0;

			String sql = "select count(*) from newbook where user_id=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();

				if (rs.next()) {
					totalCnt = rs.getInt(1);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return totalCnt;
		}

//-------------------------메서드 2: 데이터베이스 데이터 순서대로 정렬 후 가져와서 newbook리스트에 저장--------------------------------------------	
		
		public List<Newbook> selectList(Connection conn, int firstRow, int endRow, String userid) {

			List<Newbook> list = new ArrayList<Newbook>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select newbook_num, newbook_name, newbook_aut, newbook_pub, USER_ID from ( "
					+ " select rownum rnum, newbook_num, newbook_name, newbook_aut, newbook_pub, USER_ID from ( "
					+ " select * from newbook n order by n.newbook_num desc " + " ) where rownum <= ? "
					+ " ) where rnum >= ? and user_id=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, firstRow);
				pstmt.setString(3, userid);

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
		
}
