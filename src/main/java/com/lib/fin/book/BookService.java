package com.lib.fin.book;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lib.fin.commons.Pager;

@Service
public interface BookService {

	public int setBookAdd(BookVO bookVO)throws Exception;
	
	public int getTotalBookCount()throws Exception;
	
	public List<BookVO> getBooklist(Pager pager)throws Exception;
	
	public int setBookDelete(BookVO bookVO)throws Exception;
}
