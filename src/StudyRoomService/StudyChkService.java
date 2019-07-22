package StudyRoomService;

import java.sql.Connection;
import java.sql.SQLException;

import StudyRoom.Dao.StudyRoomDAO;
import jdbc.ConnectionProvider;

public class StudyChkService {
	
	private static StudyChkService seatnum = new StudyChkService();

	public static StudyChkService getInstance() {
		return seatnum;
	}
	
	private StudyChkService () {};

	 
	public int StudyChk(int time ) {

		int shk = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			
			shk = dao.chk(conn, time);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return shk;
	}

}
