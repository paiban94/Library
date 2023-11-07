package com.lib.fin.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.facility.FacilityVO;
import com.lib.fin.schedule.ScheduleVO;
@Controller
@RequestMapping("/book/*")
public class BookControl {
	
	@Autowired
	private BookService bookService;
	
	@GetMapping("getBooklist")
	public String getBooklist(Model model) throws Exception {
		List<BookVO> ar=bookService.getBooklist();
		model.addAttribute("list",ar);
		return "book/booklist";
	
	}
	
	@PostMapping("add")
	public String setBookAdd(HttpServletRequest request, BookVO bookVO)throws Exception{ 
			        
		 int result = bookService.setBookAdd(bookVO);
		
		 return "redirect:./getBooklist";
	}
	@PostMapping("delete")
	public String setBookDelete(BookVO bookVO) throws Exception{
		int result = bookService.setBookDelete(bookVO);
		return "redirect:./getBooklist";
	}
	
	
}
