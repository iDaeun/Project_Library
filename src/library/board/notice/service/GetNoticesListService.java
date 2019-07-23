package library.board.notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import library.board.notice.dao.NoticeDao;
import library.board.notice.model.Notice;
import library.board.notice.model.NoticesList;

public class GetNoticesListService {

	// 건의사항 리스트를 출력할 수 있도록 처리해보자...!
	// 글 번호, 글 제목, 작성자 만 뽑아볼까?

	private GetNoticesListService() {

	}

	private static GetNoticesListService service = new GetNoticesListService();

	public static GetNoticesListService getInstance() {
		return service;
	}

	// 페이지에 보여즐 게시글의 개수
	private static final int NOTICES_COUNT_PER_PAGE = 10;

	public NoticesList getNoticesList(int pageNumber) {

		int currentPageNumber = pageNumber;

		Connection conn = null;

		NoticesList list = null;

		try {
			conn = ConnectionProvider.getConnection();

			NoticeDao dao = NoticeDao.getInstance();

			int noticesTotalCount = dao.selectCount(conn);

			// 게시물 리스트..!
			List<Notice> noticesList = null;
			int firstRow = 0;
			int endRow = 0;

			if (noticesTotalCount > 0) {

				firstRow = (pageNumber - 1) * NOTICES_COUNT_PER_PAGE + 1;
				endRow = firstRow + NOTICES_COUNT_PER_PAGE - 1;

				noticesList = dao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				noticesList = Collections.emptyList();
			}

			list = new NoticesList(noticesTotalCount, currentPageNumber, noticesList, NOTICES_COUNT_PER_PAGE, firstRow,
					endRow);
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
