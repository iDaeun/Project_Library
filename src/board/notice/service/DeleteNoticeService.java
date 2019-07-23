package library.board.notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.notice.dao.NoticeDao;

public class DeleteNoticeService {

	private DeleteNoticeService() {

	}

	private static DeleteNoticeService service = new DeleteNoticeService();

	public static DeleteNoticeService getInstance() {
		return service;
	}

	public int deleteNotice(int not_num) {
		int resultCnt = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			NoticeDao dao = NoticeDao.getInstance();

			dao.delete(conn, not_num);

			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultCnt;
	}

}
