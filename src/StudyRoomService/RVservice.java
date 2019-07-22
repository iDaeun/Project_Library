package StudyRoomService;

import java.sql.Connection;
import java.sql.SQLException;

import StudyRoom.Dao.StudyRoomDAO;
import StudyRoom.model.Study_room;
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
	 
	 
	 
	 
	 
}
