package com.lib.fin.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.fin.commons.Pager;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;
	@Override
	public List<BookVO> getBooklist(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(bookDAO.getTotal(pager));
		List<BookVO> ar=bookDAO.getBooklist(pager);
		for(BookVO bookVO : ar) {
			
		}
		return ar;
	}
	@Override
	public int getTotalBookCount()throws Exception{
		return bookDAO.getTotalBookCount();
	}
	@Override
	public int setBookAdd(BookVO bookVo)throws Exception{
		return bookDAO.setBookAdd(bookVo);
	}
	@Override
	public int setBookDelete(BookVO bookVO)throws Exception{
		return bookDAO.setBookDelete(bookVO);
	}
}
