package StudyRoomService;

import java.sql.Connection;
import java.sql.SQLException;

import StudyRoom.Dao.StudyRoomDAO;
import StudyRoom.model.Study_room;
import jdbc.ConnectionProvider;

public class SeatNum {

	private static SeatNum seatnum = new SeatNum();

	public static SeatNum getInstance() {
		return seatnum;
	}
	 private SeatNum () {};

	public int SeatRev(Study_room sr) {

		int result = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			
			result = dao.insert(conn, sr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}
