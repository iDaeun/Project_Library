package library.board.notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.notice.dao.NoticeDao;
import library.board.notice.model.Notice;

public class WriteNoticeService {

	private static WriteNoticeService service = new WriteNoticeService();

	public static WriteNoticeService getInstance() {
		return service;
	}

	private WriteNoticeService() {

	}

	public int write(Notice notic) {
		int rCnt = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			NoticeDao dao = NoticeDao.getInstance();

			rCnt = dao.insert(conn, notic);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
	}
}
