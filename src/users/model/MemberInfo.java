package users.model;

import java.sql.Timestamp;

public class MemberInfo {
	private int rownum = 0;
	private String user_id;
	private String user_pw;
	private String user_name;
	private Timestamp user_reg;
	private String user_photo;
	
	public MemberInfo() {
		this.user_reg = new Timestamp(System.currentTimeMillis());
		this.user_photo = "none";
	}	
	
	public MemberInfo(String user_id, String user_pw, String user_name) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_photo = "none";
		this.user_reg = new Timestamp(System.currentTimeMillis());
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public Timestamp getUser_reg() {
		return user_reg;
		
	}


	public void setUser_reg(Timestamp user_reg) {
		this.user_reg = user_reg;
	}
	

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	
	
	// 로그인 시에 비밀번호 비교 
	public boolean matchPassword(String user_pw) {
		return this.user_pw.equals(user_pw);
	}

	@Override
	public String toString() {
		return "MemberInfo [rownum=" + rownum + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_reg=" + user_reg + ", user_photo=" + user_photo + "]";
	}

	

}
