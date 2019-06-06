package com.oracle.mapper;

import com.oracle.web.bean.Fenlei;
import java.util.List;

public interface FenleiMapper {

	int deleteByPrimaryKey(Integer fId);

	int insert(Fenlei record);

	Fenlei selectByPrimaryKey(Integer fId);

	int updateByPrimaryKey(Fenlei record);
	
    int selectCount();

	List<Fenlei> selectBypage(int index);
	
	List<Fenlei> sesectAllBypage();
}