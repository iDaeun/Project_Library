package book.model;

public class RentModel {
	private int rent_num;
	private int book_id;
	private String user_id;
	private String book_ren;
	private String rent_st;
	private String rent_end;
	public int getRent_num() {
		return rent_num;
	}
	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBook_ren() {
		return book_ren;
	}
	public void setBook_ren(String book_ren) {
		this.book_ren = book_ren;
	}
	public String getRent_st() {
		return rent_st;
	}
	public void setRent_st(String rent_st) {
		this.rent_st = rent_st;
	}
	public String getRent_end() {
		return rent_end;
	}
	public void setRent_end(String rent_end) {
		this.rent_end = rent_end;
	}
	
}
