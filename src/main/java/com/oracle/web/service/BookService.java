package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;

public interface BookService {
	
	List<Book> list();

	int save(Book book);

	void delete(Book book);

	Book queryOneBook(Integer bid);

	void update(Book book);

	PageBean<SubBook> selectAllByPage(Integer pageNow);

}
