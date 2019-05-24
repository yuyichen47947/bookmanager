package com.oracle.web.service;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;

public interface BookService {

	int save(Book book);

	void delete(Book book);

	Book queryOneBook(Integer bid);

	void update(Book book);

	PageBean<SubBook> selectAllByPageHelper(Integer pageNow);

}
