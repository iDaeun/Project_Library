package newbook.model;

public class Newbook {
	
	private String buyBook;
	
	
public String getBuybook() {
		return buyBook;
	}
	public void setBuybook(String buyBook) {
		this.buyBook = buyBook;
	}

	//---------------------------------------------userid-------------------------------------------------
	private String userid;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
//---------------------------------------------newbook_num-------------------------------------------------
	private int newbookNum;
	
	public int getNewbookNum() {
		return newbookNum;
	}
	public void setNewbookNum(int newbookNum) {
		this.newbookNum = newbookNum;
	}
	
	private String newName;
	private String newAut;
	private String newPub;
	
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	public String getNewAut() {
		return newAut;
	}
	public void setNewAut(String newAut) {
		this.newAut = newAut;
	}
	public String getNewPub() {
		return newPub;
	}
	public void setNewPub(String newPub) {
		this.newPub = newPub;
	}

}
