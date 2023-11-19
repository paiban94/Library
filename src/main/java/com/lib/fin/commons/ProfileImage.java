package com.lib.fin.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.lib.fin.member.MemberFileVO;
import com.lib.fin.member.MemberService;
@Component
public class ProfileImage {
	
	@Autowired
	MemberService memberService;

	//프로필사진 상단에서 출력하기 위해 사용
	public  void addProfileImage(Model model, String empNo)throws Exception{
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
