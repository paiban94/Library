package com.lib.fin.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public ModelAndView getBooklist() throws Exception {
		Map<String, Object> listMap= new HashMap();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/book/booklist");
		
		List<Map<String, Object>> result = bookService.getBooklist();
		System.out.println(result);
		return mv;
	}
	
	@PostMapping("add")
	public String setBookAdd(HttpServletRequest request, BookVO bookVO)throws Exception{ 
			        
		 int result = bookService.setBookAdd(bookVO);
		
		 return "redirect:./booklist";
	}
	@PostMapping("delete")
	public String setBookDelete(BookVO bookVO) throws Exception{
		int result = bookService.setBookDelete(bookVO);
		return "redirect:./booklist";
	}
	
	
}
