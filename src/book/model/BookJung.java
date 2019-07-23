package book.model;

public class BookJung {
	
	private String book_name;
	private String book_aut;
	
	
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
	@Override
	public String toString() {
		return "BookJung [book_name=" + book_name + ", book_aut=" + book_aut + "]";
	}
	
	
	
}
