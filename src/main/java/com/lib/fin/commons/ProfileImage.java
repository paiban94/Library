package com.lib.fin.commons;

import org.springframework.ui.Model;

import com.lib.fin.member.MemberFileVO;
import com.lib.fin.member.MemberService;

public class ProfileImage {

	//프로필사진 상단에서 출력하기 위해 사용
	public static void addProfileImage(Model model, MemberService memberService, String empNo)throws Exception{
		MemberFileVO profileImage = memberService.getMemImage(empNo);
		if (profileImage != null) {
            String filePath = "/files/" + profileImage.getFile_name();
            model.addAttribute("profileImage", profileImage);
            model.addAttribute("filePath", filePath);
        } else {
            model.addAttribute("filePath", "/files/default_profile_image.jpg");
        }
		
		
		
	}
			


}
