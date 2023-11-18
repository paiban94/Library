package com.lib.fin.book;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.lib.fin.commons.Pager;
@Mapper
public interface BookDAO {

	public int getCount(Pager pager)throws Exception;
	
	public int setBookAdd(BookVO bookVO) throws Exception;
	
	public List<BookVO> getBooklist(Pager pager) throws Exception;
	
	public int setBookDelete (BookVO bookVO)throws Exception;
	
	public Long getTotal(Pager pager)throws Exception;
	
	public int getTotalBookCount()throws Exception;
}
