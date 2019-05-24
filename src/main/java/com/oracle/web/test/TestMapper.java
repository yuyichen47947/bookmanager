package com.oracle.web.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.oracle.mapper.BookMapper;
import com.oracle.web.bean.SubBook;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestMapper {

	@Autowired
	private BookMapper bookMapper;
	
	@Test
	public void testPage(){
		
		PageHelper.startPage(2,5);
		
		List<SubBook> list=this.bookMapper.selectAllByPageHelper();
		
		for (SubBook subBook : list) {
			
			System.out.println(subBook);
		}
	}
}
