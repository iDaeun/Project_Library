package library.board.notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.notice.dao.NoticeDao;

public class UpdateNoticeService {

	private static UpdateNoticeService service = new UpdateNoticeService();

	public static UpdateNoticeService getInstance() {
		return service;
	}

	private UpdateNoticeService() {

	}

	public int updateNotice(int not_num, String not_title, String not_cont) {
		int rCnt = 0;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			NoticeDao dao = NoticeDao.getInstance();

			rCnt = dao.update(conn, not_num, not_title, not_cont);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rCnt;
	}
}
