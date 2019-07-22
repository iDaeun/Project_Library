package book.model;

public class BookModel {
	private int book_id;          //도서코드
	private String book_name;		//책제목
	private String book_aut;		//작가
	private String book_pub;		//출판사
	private String book_ge;			//장르
	
	
	
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_aut() {
		return book_aut;
	}
	public void setBook_aut(String book_aut) {
		this.book_aut = book_aut;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getBook_ge() {
		return book_ge;
	}
	public void setBook_ge(String book_ge) {
		this.book_ge = book_ge;
	}
	
	
}
