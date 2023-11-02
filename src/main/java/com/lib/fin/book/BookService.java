package com.lib.fin.book;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.fin.facility.FacilityVO;
@Service
public class BookService {
	@Autowired
	private BookDAO bookDAO;
	
	public int setBookAdd(BookVO bookVO) throws Exception {
		return bookDAO.setBookAdd(bookVO);
	}
	
	public List<Map<String, Object>> getBooklist() throws Exception{
		return bookDAO.getBooklist();
	}
	public int setBookDelete(BookVO bookVO) throws Exception{
		return bookDAO.setBookDelete(bookVO);
	}
}
