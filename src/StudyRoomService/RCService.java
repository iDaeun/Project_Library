package StudyRoomService;

import java.sql.Connection;
import java.sql.SQLException;

import StudyRoom.Dao.StudyRoomDAO;
import StudyRoom.model.Study_room;
import jdbc.ConnectionProvider;

public class RCService {
	
	private static RCService seatnum = new RCService();

	public static RCService getInstance() {
		return seatnum;
	}
	 private RCService() {};

	 
	 
	public int SeatRC(String uId, int seat_num, int seat_time) {

		int result = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			
			result = dao.update(conn,uId,seat_num,seat_time);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}
