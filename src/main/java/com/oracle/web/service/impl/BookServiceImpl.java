package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.mapper.BookMapper;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;
import com.oracle.web.service.BookService;



@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;

	@Override
	@Transactional(readOnly = true)
	public List<Book> list() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll();
	}

	@Override
	@Transactional
	public int save(Book book) {
		// TODO Auto-generated method stub
		return this.bookMapper.insert(book);
	}

	@Override
	@Transactional
	public void delete(Book book) {
		// TODO Auto-generated method stub
		this.bookMapper.deleteByPrimaryKey(book.getBid());
	}

	@Override
	@Transactional(readOnly = true)
	public Book queryOneBook(Integer bid) {
		// TODO Auto-generated method stub
		return this.bookMapper.selectByPrimaryKey(bid);
	}

	@Override
	@Transactional
	public void update(Book book) {
		// TODO Auto-generated method stub
		this.bookMapper.updateByPrimaryKey(book);
	}

	@Override
	public PageBean<SubBook> selectAllByPage(Integer pageNow) {
		// TODO Auto-generated method stub

		PageBean<SubBook> pb = new PageBean<SubBook>();

		// 取当前页的数据
		PageHelper.startPage(pageNow, 5);

		// 已经是分页好的数据
		List<SubBook> list = this.bookMapper.selectAllByPage();

		pb.setBeanList(list);

		// 总记录数
		// 构建一个PageInfo
		PageInfo<SubBook> pi = new PageInfo<SubBook>(list);

		pb.setCounts((int) pi.getTotal());

		// 当前页
		pb.setPageNow(pi.getPageNum());

		// 页面数据个数-----自己定义
		pb.setpageSize(pi.getPageSize());

		return pb;
	}

}
