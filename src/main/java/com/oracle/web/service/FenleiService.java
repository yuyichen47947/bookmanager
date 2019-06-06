package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;

public interface FenleiService {

	int insert(Fenlei fenlei);

	void delete(Fenlei fenlei);

	void update(Fenlei fenlei);

	Fenlei queryOneMonster(Integer id);

	PageBean<Fenlei> selectByPage(Integer pageNow, int pageSize);

	PageBean<Fenlei> selectAllPage(Integer pageNow);

}
