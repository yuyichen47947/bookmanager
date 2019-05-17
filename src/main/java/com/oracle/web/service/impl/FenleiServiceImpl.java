package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.FenleiMapper;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.FenleiService;

public class FenleiServiceImpl implements FenleiService {
	
	//注入Dao
	@Autowired
	private FenleiMapper fenleiMapper;

	@Override
	@Transactional
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}

}
