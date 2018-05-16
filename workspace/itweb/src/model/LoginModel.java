package model;

import doman.User;

public class LoginModel {
	public boolean login(User user) {
		if(user.getUsername().equals("root")&&user.getPassword().equals("123")) {
			return true;
		}else {
		return false;
		}
	}
}
