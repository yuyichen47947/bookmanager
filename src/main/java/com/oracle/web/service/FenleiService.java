package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Fenlei;

public interface FenleiService {

	List<Fenlei> selectAll();
	
	int insert(Fenlei fenlei);

	Fenlei selectByPrimaryKey(Integer id);

	void delete(Fenlei fenlei);

	void update(Fenlei fenlei);

}
