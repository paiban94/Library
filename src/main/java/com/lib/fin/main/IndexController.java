package com.lib.fin.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lib.fin.commons.ProfileImage;
import com.lib.fin.member.MemberFileVO;
import com.lib.fin.member.MemberService;
import com.lib.fin.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IndexController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ProfileImage profileImage;
	
	@GetMapping("/")
	public String getIndex(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception {

		profileImage.addProfileImage(model, memberVO.getEmp_no());

		return "/index";
	}

	@GetMapping("/member/assets/img/logo.png")
	public String getIndex1(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception {

		
	
		return "redirect:/";
	}
}



	