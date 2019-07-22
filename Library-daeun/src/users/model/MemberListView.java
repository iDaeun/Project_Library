package users.model;

import java.util.List;

// 회원목록 
public class MemberListView {
	private int memberTotalCnt;
	private int currentPgNum;
	private int pgTotalCnt;
	private int memberCntPerPg;
	private int startRow;
	private int endRow;
	private List<MemberInfo> memberList;

	public MemberListView(int memberTotalCnt, int currentPgNum, int memberCntPerPg, int startRow, int endRow,
			List<MemberInfo> memberList) {

		this.memberTotalCnt = memberTotalCnt;
		this.currentPgNum = currentPgNum;
		this.memberCntPerPg = memberCntPerPg;
		this.startRow = startRow;
		this.endRow = endRow;
		this.memberList = memberList;

		calculatepgTotalCnt();
	}

	public int getMemberTotalCnt() {
		return memberTotalCnt;
	}

	public void setMemberTotalCnt(int memberTotalCnt) {
		this.memberTotalCnt = memberTotalCnt;
	}

	public int getCurrentPgNum() {
		return currentPgNum;
	}

	public void setCurrentPgNum(int currentPgNum) {
		this.currentPgNum = currentPgNum;
	}

	public int getPgTotalCnt() {
		return pgTotalCnt;
	}

	public void setPgTotalCnt(int pgTotalCnt) {
		this.pgTotalCnt = pgTotalCnt;
	}

	public int getMemberCntPerPg() {
		return memberCntPerPg;
	}

	public void setMemberCntPerPg(int memberCntPerPg) {
		this.memberCntPerPg = memberCntPerPg;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public List<MemberInfo> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<MemberInfo> memberList) {
		this.memberList = memberList;
	}
	
	public boolean isEmpty() {
		return memberCntPerPg == 0;
	}

	// 페이지 증가 계산
	public void calculatepgTotalCnt() {

		if (memberTotalCnt == 0) {
			pgTotalCnt = 0;
		} else {
			pgTotalCnt = memberTotalCnt / memberCntPerPg;

			if (memberTotalCnt % memberCntPerPg > 0) {
				pgTotalCnt++;
			}
		}
	}

}
