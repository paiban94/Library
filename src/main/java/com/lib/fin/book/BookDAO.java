package com.lib.fin.book;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface BookDAO {

	public int setBookAdd(BookVO bookVO) throws Exception;
	
	public List<Map<String, Object>> getBooklist() throws Exception;
	
	public int setBookDelete (BookVO bookVO)throws Exception;
	
}
