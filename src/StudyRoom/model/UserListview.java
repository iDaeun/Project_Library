package StudyRoom.model;

import java.util.List;

public class UserListview {
	
	private List<Study_room> user_id;
	

	public UserListview(List<Study_room> user_id) {
		this.user_id = user_id;
	}

	public List<Study_room> getUser_id() {
		return user_id;
	}

	public void setUser_id(List<Study_room> user_id) {
		this.user_id = user_id;
	}
	

}
