package com.lib.fin.member;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;



import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {
	
	//service 생성자 주입
	@Autowired
	private MemberService memberService;
	
	
	
	//회원가입 페이지 출력 요청
	@GetMapping("join")
	public void memJoin (@ModelAttribute MemberVO memberVO) throws Exception {
		
	}
	
//	@PostMapping("join")
//	public String memJoin (@Valid MemberVO memberVO,BindingResult bindingResult, MultipartFile photo)throws Exception{
//		return "redirect:../";
//	}
	
    @PostMapping("join")
    public String memJoin(@Valid MemberVO memberVO, BindingResult bindingResult, MultipartFile photo) throws Exception {
    	
    	boolean check = memberService.getMemberError(memberVO, bindingResult);

    	if(bindingResult.hasErrors() || check) {
    		log.info("==========실패했습니다==========");
    		return "member/join";
    	}
    	
        int result = memberService.memJoin(memberVO);

        if (result > 0) {
            // 회원 가입이 성공한 경우에 대한 처리
            log.info("===========회원 가입이 성공했습니다.=========");
        }

        //return "redirect:../";
        return "member/login";
    }
    
    
	@GetMapping("/login")
	public String getLogin(@ModelAttribute MemberVO memberVO)throws Exception{
		
		return "/member/login";

	}
	
	@RequestMapping("/postLogin")
	public String postLogin(@ModelAttribute MemberVO memberVO)throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		
		log.info("===== Name : {} =====", context.getAuthentication().getPrincipal().toString());
		String check=context.getAuthentication().getPrincipal().toString();
		
		if(!check.equals("anonymousUser")) {		
			return "/member/login";
	
		}else {
			return "/index";
		}
		
	}
	

}
