package StudyRoomService;

import java.sql.Connection;
import java.sql.SQLException;

import StudyRoom.Dao.StudyRoomDAO;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class RDService {
	
	private static RDService seatnum = new RDService();

	public static RDService getInstance() {
		return seatnum;
	}
	 private RDService() {};



	public int REVDelete(String user_id) throws SQLException {
		
		int rev = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			StudyRoomDAO dao = StudyRoomDAO.getInstance();
			rev = dao.delete(conn, user_id);
			
			conn.commit();
						
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}
		
		return rev;
	};
};