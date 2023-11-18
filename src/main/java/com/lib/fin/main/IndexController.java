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


@Controller
public class IndexController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("/")
	public String getIndex(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception {
//		MemberFileVO profileImage = memberService.getMemImage(memberVO.getEmp_no());
//		if (profileImage != null) {
//	        String filePath = "/files/" + profileImage.getFile_name();
//	        model.addAttribute("profileImage", profileImage);
//	        model.addAttribute("filePath", filePath);
//	    } else {
//	        model.addAttribute("filePath", "/files/default_profile_image.jpg");
//	    }
		ProfileImage.addProfileImage(model, memberService, memberVO.getEmp_no());
		return "/index";
	}

	@GetMapping("/member/assets/img/logo.png")
	public String getIndex1(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception {
//		MemberFileVO profileImage = memberService.getMemImage(memberVO.getEmp_no());
//		if (profileImage != null) {
//	        String filePath = "/files/" + profileImage.getFile_name();
//	        model.addAttribute("profileImage", profileImage);
//	        model.addAttribute("filePath", filePath);
//	    } else {
//	        model.addAttribute("filePath", "/files/default_profile_image.jpg");
//	    }
		ProfileImage.addProfileImage(model, memberService, memberVO.getEmp_no());
		return "redirect:/";
	}
}



	