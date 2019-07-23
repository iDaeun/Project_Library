package StudyRoomService;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import StudyRoom.Dao.StudyRoomDAO;
import StudyRoom.model.Study_room;
import StudyRoom.model.UserListview;
import StudyRoom.model.user;

import jdbc.ConnectionProvider;

public class RVservice {

	private static RVservice seatnum = new RVservice();

	public static RVservice getInstance() {
		return seatnum;
	}
	 private RVservice() {};
	
	 
	 
	 public user SeatRV(String user_id) {
		 
		 user sr = null;
		 Connection conn;
		 
		 try {
			conn = ConnectionProvider.getConnection();
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			
			sr = dao.select(conn, user_id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sr;
		 
	 }
	 
	/* 모든 데이터 뽑아주는 서비스 */
	 public List<Study_room> allseatRV() {
		 
		 List<Study_room> list = null;
		
		 Connection conn;
		 
		 try {
			conn = ConnectionProvider.getConnection();
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			
			list = dao.allselect(conn);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		 
	 }
	 
	/* 아이디에 따른 리스트 출력 메소드 */
	 	public List<Study_room> allRV(String user_id) {
		 
		 List<Study_room> list = null;
		
		 Connection conn;
		 
		 try {
			conn = ConnectionProvider.getConnection();
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			
			list = dao.selectId(conn, user_id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		 
	 }
	 
	 
	 
	 
	 
}
