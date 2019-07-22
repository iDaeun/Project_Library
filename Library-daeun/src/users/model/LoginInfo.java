package users.model;

import java.sql.Timestamp;

public class LoginInfo {
	private String user_id;
	private Timestamp user_reg;
	
	public LoginInfo(String user_id) {
		this.user_id = user_id;
		this.user_reg = new Timestamp(System.currentTimeMillis());
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Timestamp getUser_reg() {
		return user_reg;
	}

	public void setUser_reg(Timestamp user_reg) {
		this.user_reg = user_reg;
	}

	@Override
	public String toString() {
		return "LoginInfo [user_id=" + user_id + ", user_reg=" + user_reg + "]";
	}
		
	
}
