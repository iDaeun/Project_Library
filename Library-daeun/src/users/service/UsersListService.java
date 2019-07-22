package users.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.ConnectionProvider;
import users.dao.UsersDao;
import users.model.MemberInfo;
import users.model.MemberListView;

public class UsersListService {
	private UsersListService() {

	}

	private static UsersListService service = new UsersListService();

	public static UsersListService getInstance() {
		return service;
	}

	// 1. 한 페이지에 보여줄 회원정보 개수
	private static final int MEMBER_COUNT_PER_PAGE = 5;

	public MemberListView getUsersListView(int pgNum) {

		// 현재 페이지 번호
		int currentPgNum = pgNum;

		MemberListView mListView = null;

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();

			// 전체 회원정보 개수
			int memberTotalCnt = dao.selectCount(conn);

			// 회원목록, DB검색에 사용할 StartRow & EndRow
			List<MemberInfo> memberList = null;
			int startRow = 0;
			int endRow = 0;

			if (memberTotalCnt > 0) {

				// StartRow & EndRow 구하는 공식
				startRow = (pgNum - 1) * MEMBER_COUNT_PER_PAGE + 1;
				endRow = startRow + MEMBER_COUNT_PER_PAGE - 1;
				
				// 해당 범위에 있는 회원 목록 담은 list 리턴
				memberList = dao.selectList(conn, startRow, endRow);

			} else {

				// 회원 수가 없을때 -> 빈 list 리턴
				currentPgNum = 0;
				memberList = Collections.emptyList();
			}

			mListView = new MemberListView(memberTotalCnt, currentPgNum,  
					MEMBER_COUNT_PER_PAGE, startRow, endRow ,memberList);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mListView;
	}
}
