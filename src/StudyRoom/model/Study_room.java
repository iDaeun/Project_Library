package StudyRoom.model;

public class Study_room {
	
	private String user_id;
	private int study_time;
	private int seat_num;
	
	public Study_room() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Study_room(int study_time, String user_id, int seat_num) {
		this.study_time = study_time;
		this.user_id = user_id;
		this.seat_num = seat_num;
	}


	public int getStudy_time() {
		return study_time;
	}
	public void setStudy_time(int study_time) {
		this.study_time = study_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}

	
	
}
