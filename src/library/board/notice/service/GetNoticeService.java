package library.board.notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library.board.notice.dao.NoticeDao;
import library.board.notice.model.Notice;

public class GetNoticeService {

	private GetNoticeService() {

	}

	private static GetNoticeService service = new GetNoticeService();

	public static GetNoticeService getInstance() {
		return service;
	}

	public Notice getNotice(int not_num) {

		Connection conn = null;
		Notice notic = null;

		try {
			conn = ConnectionProvider.getConnection();

			NoticeDao dao = NoticeDao.getInstance();

			notic = dao.select(conn, not_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notic;
	}
}
