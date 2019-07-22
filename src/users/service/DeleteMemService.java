package users.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import users.dao.UsersDao;
import users.exception.RentException;

public class DeleteMemService {
	private DeleteMemService() {

	}

	private static DeleteMemService service = new DeleteMemService();

	public static DeleteMemService getInstance() {
		return service;
	}

	// 아이디&비밀번호 매칭 통과 -> 삭제 진행
	public int deleteMem(String user_id) throws SQLException, RentException {

		int rCnt1 = 0;
		int rCnt2 = 0;
		int rCnt3 = 0;
		int rCnt4 = 0;
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();

			// 트렌젝션 처리
			conn.setAutoCommit(false);

			// **다른 테이블** 아이디에 해당되는 내용 지움

			// 1. 도서 테이블 삭제
			// 1-1. 대출 여부 확인
			String rent = dao.selectRentTable(conn, user_id);
			System.out.println(rent);
			
			if (rent != null && rent.trim().equals("N")) {
				
				// 1-2. 대출 O -> 예외발생
				throw new RentException("대출중이 도서가 있습니다, 반납 후 회원탈퇴 가능합니다!");
				
			} else {

				// 1-3. 대출 X -> 반납을 했으면 이미 id가 지워져있으므로 아이디에 해당되는 도서 내용은 없음 => 삭제필요 없음

				// 2. 건의사항 테이블 삭제
				rCnt1 = dao.deleteOtherTable(conn, "suggestions", user_id);
				System.out.println("rCnt1" + rCnt1);

				if (rCnt1 > 0) {
					// 3. 열람실 테이블 삭제
					rCnt2 = dao.deleteOtherTable(conn, "study_room", user_id);
					System.out.println("rCnt2" + rCnt2);
				}

				if (rCnt2 > 0) {
					// 4. 신청도서 테이블 삭제
					rCnt3 = dao.deleteOtherTable(conn, "newbook ", user_id);
					System.out.println("rCnt3" + rCnt3);
				}

				// 5. 자식 테이블에서 내용 모두 삭제 후 -> DB에서 해당 회원정보 삭제
				rCnt4 = dao.deleteMem(conn, user_id);

				// 트렌젝션 정상처리
				conn.commit();
			}

		} catch (SQLException e) {
			// 예외발생 -> 트렌젝션의 rollback
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (Exception e) {
			// 예외발생 -> 트렌젝션의 rollback
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e; }

		return rCnt4;
	}
}
