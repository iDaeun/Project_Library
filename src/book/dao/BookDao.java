package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.Out;

import book.model.AllModel;
import book.model.BookJung;
import book.model.BookModel;
import book.model.JoinModel;
import book.model.RentModel;
import book.model.RentalList;
import newbook.model.Newbook;

public class BookDao {
	// 싱글톤
	private BookDao() {}
	
	private static BookDao dao = new BookDao();
	
	public static BookDao getInstance() {
		return dao;
	}
	
	// 신청도서 삽입(추가)
		public int insertNewbook(Connection conn, Newbook newbook) {
			int rCnt = 0;
			PreparedStatement pstmt = null;
			
			String sql = "insert into BOOK VALUES (BOOK_ID_SEQ.nextval,?,?,?,?)";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, newbook.getNewName());
				pstmt.setString(2, newbook.getNewAut());
				pstmt.setString(3, newbook.getNewPub());
				pstmt.setString(4, "not insert yet");
				
				rCnt = pstmt.executeUpdate();
				
			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return rCnt;
		}
	// 도서 추가할때 중복책 확인
	public BookJung bookjung(Connection conn, String book_name, String book_aut) {
		BookJung book = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select book_name,book_aut from book where book_name=? and book_aut=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_name);
			pstmt.setString(2, book_aut);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new BookJung();
				book.setBook_name(rs.getString(1));
				book.setBook_aut(rs.getString(2));
			}
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return book;
	}
	// 도서 삽입 (추가)
	public int insert(Connection conn,BookModel bookmodel) {
		int rCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "insert into BOOK VALUES (BOOK_ID_SEQ.nextval,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookmodel.getBook_name());
			pstmt.setString(2, bookmodel.getBook_aut());
			pstmt.setString(3, bookmodel.getBook_pub());
			pstmt.setString(4, bookmodel.getBook_ge());
			
			rCnt = pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return rCnt;
	}
	// 추가된 도서 RENT 테이블로 추가 (대출테이블에도 추가)
	public int insert2(Connection conn) {
		Statement stmt = null;
		int rs = 0;
		
		String sql = "insert into RENT VALUES (RENT_ID_SEQ.nextval,(select max(book_id) from book),'','Y','','')";
		try {
			
		stmt = conn.createStatement();
		
		rs = stmt.executeUpdate(sql);
		
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return rs;
	}
	// 도서삭제전 자식테이블부터삭제
	public int delete(Connection conn, String book_name,String book_aut) throws SQLException {
		int rs = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from rent where book_id=(select book_id from book where book_name=? and book_aut=?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_name);
			pstmt.setString(2, book_aut);
			
			rs = pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			pstmt.close();
		}
		
		
		return rs;
	}
	// 도서 삭제
	public int delete2(Connection conn, String book_name, String book_aut) throws SQLException {
		int rs = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from BOOK where BOOK_NAME = ? and book_aut = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_name);
			pstmt.setString(2, book_aut);
			
			rs = pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			pstmt.close();
		}
		
		
		return rs;
	}
	// 도서전체 출력
	public List<AllModel> allselect(Connection conn) {
		List<AllModel> list = new ArrayList<AllModel>();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select b.book_name,b.book_aut,b.book_pub,b.book_ge,r.user_id,r.book_ren,r.rent_st,r.rent_end " + 
				" from book b, rent r" + 
				" where b.book_id=r.book_id order by book_name";
		
		try {
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				AllModel allmodel = new AllModel();
				allmodel.setBook_name(rs.getString(1));
				allmodel.setBook_aut(rs.getString(2));
				allmodel.setBook_pub(rs.getString(3));
				allmodel.setBook_ge(rs.getString(4));
				allmodel.setUser_id(rs.getString(5));
				allmodel.setBook_ren(rs.getString(6));
				allmodel.setRent_st(rs.getString(7));
				allmodel.setRent_end(rs.getString(8));
				
				list.add(allmodel);
				
			}
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
			
		
		return list;
	}
	// 도서 검색
	public JoinModel select(Connection conn,String book_name) {
		JoinModel joinmodel = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select b.book_name,b.book_aut,b.book_pub,b.book_ge,r.book_ren from BOOK b, rent r where b.book_id = r.book_id and book_name like ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ book_name + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				joinmodel = new JoinModel();
				joinmodel.setBook_name(rs.getString(1));
				joinmodel.setBook_aut(rs.getString(2));
				joinmodel.setBook_pub(rs.getString(3));
				joinmodel.setBook_ge(rs.getString(4));
				joinmodel.setBook_ren(rs.getString(5));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return joinmodel;
	}
	
	
	// 대여
	public int rent(Connection conn,String user_id,String book_name) {
		
		PreparedStatement pstmt = null;
		int rCnt = 0;
		
		String sql = "update Rent " + 
				" set book_ren='N',user_id=?,Rent_st=(select current_date from dual),Rent_end=(select sysdate+7 from dual) " + 
				" where book_id=(select book_id from book where book_name=?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, book_name);
			
			rCnt = pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return rCnt;
	}
	
	// 대여중인책 리스트
	public List<RentalList> rentallist(Connection conn ,String user_id) {
		List<RentalList> rentallist = new ArrayList<RentalList>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select b.book_name,b.book_aut,b.book_pub,b.book_ge,r.rent_st,r.rent_end " + 
				" from book b, rent r" + 
				" where b.book_id=r.book_id and r.user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RentalList rentallistm = new RentalList();
				rentallistm.setBook_name(rs.getString(1));
				rentallistm.setBook_aut(rs.getString(2));
				rentallistm.setBook_pub(rs.getString(3));
				rentallistm.setBook_ge(rs.getString(4));
				rentallistm.setRent_st(rs.getString(5));
				rentallistm.setRent_end(rs.getString(6));
				
				rentallist.add(rentallistm);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return rentallist;
	}
	
	// 반납
	public int turn(Connection conn,String user_id,String book_name) {
		
		PreparedStatement pstmt = null;
		int rs = 0;
		
		String sql = "update RENT " + 
				" set book_ren='Y',Rent_st='',Rent_end='',User_id='' " + 
				" where user_id=? and book_id=(select book_id from book where book_name=?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, book_name);
			
			rs = pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return rs;
	}
	
	// 삭제시 책이름과 동일한지 확인하는 select 문
	public BookModel selectChk(Connection conn,String book_name) {
		BookModel bookmodel = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select book_name,book_aut,book_pub,book_ge " + 
				" from BOOK " + 
				" where BOOK_NAME = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_name);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bookmodel = new BookModel();
				bookmodel.setBook_name(rs.getString(1));
				bookmodel.setBook_aut(rs.getString(2));
				bookmodel.setBook_pub(rs.getString(3));
				bookmodel.setBook_ge(rs.getString(4));
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return bookmodel;
	}

	public int selectCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		
		int totalCnt = 0;
		
		String sql = "select count(*) from book";
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return totalCnt;
	}

	public List<AllModel> selectList(Connection conn, int firstRow, int endRow) {
		List<AllModel> list = new ArrayList<AllModel>();
		
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String sql = "select BOOK_NAME, BOOK_AUT, BOOK_PUB, BOOK_GE , user_id, book_ren, rent_st, rent_end " + 
				"from ( select rownum rnum, b.BOOK_NAME, b.BOOK_AUT, b.BOOK_PUB, b.BOOK_GE, r.user_id,r.book_ren,r.rent_st,r.rent_end " + 
				"from ( select * from book  order by book_id desc )b ,(select * from rent  order by book_id desc)r where b.book_id = r.book_id and rownum <= ?) where rnum >=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AllModel book = new AllModel();
				book.setBook_name(rs.getString(1));
				book.setBook_aut(rs.getString(2));
				book.setBook_pub(rs.getString(3));
				book.setBook_ge(rs.getString(4));
				book.setUser_id(rs.getString(5));
				book.setBook_ren(rs.getString(6));
				book.setRent_st(rs.getString(7));
				book.setRent_end(rs.getString(8));
				
				list.add(book);
				
				
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return list;
	}
	
}
