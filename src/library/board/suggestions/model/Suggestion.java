package library.board.suggestions.model;

public class Suggestion {
	private int sug_num;
	private String sug_title;
	private String sug_cont;
	private String user_id;
	private String sug_comment;

	public int getSug_num() {
		return sug_num;
	}

	public void setSug_num(int sug_num) {
		this.sug_num = sug_num;
	}

	public String getSug_title() {
		return sug_title;
	}

	public void setSug_title(String sug_title) {
		this.sug_title = sug_title;
	}

	public String getSug_cont() {
		return sug_cont;
	}

	public void setSug_cont(String sug_cont) {
		this.sug_cont = sug_cont;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSug_comment() {
		return sug_comment;
	}

	public void setSug_comment(String sug_comment) {
		this.sug_comment = sug_comment;
	}

}
