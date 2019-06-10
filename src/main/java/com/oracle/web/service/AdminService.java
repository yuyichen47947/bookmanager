package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(String username);

	Admin showAdmin(String uname);

	Admin queryOneAdmin(Integer id);

	void update(Admin admin);

	Admin validatePassword(Admin admin);

	Admin updatePassword(String uname, String newpassword);
	
}
