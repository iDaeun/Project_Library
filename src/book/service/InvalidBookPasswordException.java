package book.service;

public class InvalidBookPasswordException extends Exception{

	public InvalidBookPasswordException(String bookname) {
		super(bookname);
		// TODO Auto-generated constructor stub
	}
}
