package com.lib.fin.main;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.approval.ApprovalDocVO;
import com.lib.fin.approval.ApprovalService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.announcement.AnnouncementService;
import com.lib.fin.commons.ProfileImage;
import com.lib.fin.member.MemberService;
import com.lib.fin.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexController {
	
	@Autowired
	private AnnouncementService announcementService;
	
	@Autowired
	private ApprovalService approvalService;  

	@Autowired
	private MemberService memberService;

	@Autowired
	private ProfileImage profileImage;

	@GetMapping("/")

	public ModelAndView getIndex(@AuthenticationPrincipal MemberVO memberVO,ModelAndView mv, Model model) throws Exception {
		mv.setViewName("/index");
		
		
		String emp_no = memberVO.getEmp_no(); // 세션에서 사번 꺼내오기

		Map<String, Object> paramas = new HashMap<>();
		paramas.put("emp_no", emp_no);
		paramas.put("k", "com");

		List<ApprovalDocVO> ar = approvalService.IndexAppDocList(memberVO);
		mv.addObject("ar", ar);
		
		
		List<BoardVO> list = announcementService.getIndexList();
		
		mv.addObject("list", list);
		
		profileImage.addProfileImage(model, memberVO.getEmp_no());
		
		return mv;
	}



	@GetMapping("/member/assets/img/logo.png")
	public String getIndex1(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception {


		return "redirect:/";
	}
	
	
}