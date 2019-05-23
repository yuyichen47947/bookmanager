package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.FenleiMapper;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.FenleiService;

public class FenleiServiceImpl implements FenleiService {

	@Autowired
	private FenleiMapper fenleiMapper;

	@Override
	@Transactional(readOnly=true)
	public List<Fenlei> selectAll() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}

	@Override
	@Transactional
	public int insert(Fenlei fenlei) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.insert(fenlei);
	}

	@Override
	@Transactional
	public Fenlei selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional
	public void delete(Fenlei fenlei) {
		// TODO Auto-generated method stub
		 this.fenleiMapper.deleteByPrimaryKey(fenlei.getfId());
	}
	
}
