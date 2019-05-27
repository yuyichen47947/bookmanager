package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;

public interface UserService {

	int save(User user);

	List<User> list();

	PageBean<User> selectByPage(Integer pageNow,int pageSize);
	
	PageBean<User> selectAllPage(Integer pageNow);

	void  delete(User user);

	User queryOneUser(Integer id);

	void update(User user);

	
  
}
