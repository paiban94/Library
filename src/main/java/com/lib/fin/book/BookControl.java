package com.lib.fin.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.commons.Pager;
import com.lib.fin.commons.ProfileImage;
import com.lib.fin.facility.FacilityVO;
import com.lib.fin.member.MemberVO;
import com.lib.fin.schedule.ScheduleVO;

import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/book/*")
@Slf4j
public class BookControl {
	
	@Autowired
	private BookService bookService;
	@Autowired
	private ProfileImage profileImage;
	
	@GetMapping("getBooklist")
	public ModelAndView getBooklist(@AuthenticationPrincipal MemberVO memberVO ,Pager pager, ModelAndView mv, Model model)throws Exception{
		List<BookVO> ar=bookService.getBooklist(pager);
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("book/booklist");
		
		profileImage.addProfileImage(model, memberVO.getEmp_no());
		log.info("=====getBooklist:{}======", memberVO.getEmp_no());
		return mv;
	
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
