package library.board.notice.model;

public class Notice {
	private int not_num;
	private String not_title;
	private String not_cont;
	private String user_id;
	private String not_reg;

	public int getNot_num() {
		return not_num;
	}

	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}

	public String getNot_title() {
		return not_title;
	}

	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}

	public String getNot_cont() {
		return not_cont;
	}

	public void setNot_cont(String not_cont) {
		this.not_cont = not_cont;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNot_reg() {
		return not_reg;
	}

	public void setNot_reg(String not_reg) {
		this.not_reg = not_reg;
	}
}
