package StudyRoom.model;

public class user {
	
	private int study_time;
	private int seat_num;
	private String user_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getStudy_time() {
		return study_time;
	}
	public void setStudy_time(int study_time) {
		this.study_time = study_time;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
}
