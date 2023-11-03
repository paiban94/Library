package com.lib.fin.member;

import java.lang.reflect.Member;
import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
            
            //emp_no 가져오기
//            String emp_no = memberServie.getEmpNoModal(memberVO.getEmp_no());
//            
//            if(emp_no != null) {
//            	model.addAttribute("emp_no",emp_no);
//            }
//        }

        //return "redirect:../";
        }
        
    	log.info("Photo : {} --- size : {}", photo.getName(), photo.getSize());
        return "member/login";
    }
    
	@GetMapping("login")
	public String getLogin(@ModelAttribute MemberVO memberVO)throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		
		String check=context.getAuthentication().getPrincipal().toString();
		//String password = context.getAuthentication().getCredentials().toString();
		
		log.info("===== Name : {} =====", context.getAuthentication().getPrincipal().toString());
		
		
		if(!check.equals("anonymousUser")) {
			return "redirect:../";
		}
		
		return "member/login";
		
	}

	
	
	//마이페이지
	@GetMapping("mypage")
	public String memberInfo(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
		//String emp_no = memberVO.getEmp_no();
		model.addAttribute("memberVO",memberVO);
		return "member/mypage";
	}
	
	
	

	
	//정보수정 프로필 출력, 정보읽어와 뷰로 전달
	@GetMapping("update")
	public String memberUpdate(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
		log.info("======정보수정 시도중 ====");
		String emp_no=memberVO.getEmp_no();
		model.addAttribute("memberVO",emp_no);
		return "member/update";
	}
	
	@PostMapping("update")
    public String postMemberUpdate(@Valid MemberVO memberVO, BindingResult bindingResult)throws Exception{
		
		boolean check = memberService.getMemberError(memberVO, bindingResult);
	  	if(bindingResult.hasErrors() || !check) {
    		log.info("==========수정에 실패했습니다==========");
    		return "member/update";
    	}

		//현재 로그인한 사용자의 정보 
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO updateMember = (MemberVO) obj;
		//현재 사용자의 정보 변경 부분
		updateMember.setPassword(memberVO.getPassword());
		updateMember.setEmail(memberVO.getEmail());
		updateMember.setPhone(memberVO.getPhone());
		

		log.info("===={}====", updateMember);
	   memberService.memberUpdate(memberVO);
		
	   return "member/mypage";
	}
	
//	@GetMapping("/login")
//	public String getLogin()throws Exception{
//		
//		return "member/login";
//			
//	
//	}
//	
////	@RequestMapping("/postLogin")
////	public String postLogin(@RequestParam("emp_no") String emp_no, @RequestParam("password") String password, 
////			@AuthenticationPrincipal MemberVO memberVO)throws Exception{
////		
////		log.info("======EMP_NO : {}====",emp_no);
////		log.info("======NAME : {}====", memberVO.getName());
////		return "redirect:/";
////	}
//	
//	@RequestMapping("/postLogin")
//	public String postLogin(@ModelAttribute MemberVO memberVO)throws Exception{
//		SecurityContext context = SecurityContextHolder.getContext();
//		
//		log.info("===== Name : {} =====", context.getAuthentication().getPrincipal().toString());
//		String check=context.getAuthentication().getPrincipal().toString();
//		
//		
////		if(!check.equals("anonymousUser")) {		
////			return "/member/login";
////	
////		}else {
////			return "/index";
////		}
//		return "redirect:/";
//	}
//
////	@PostMapping("/postLogin")
////	public String postLogin(@ModelAttribute MemberVO memberVO, Model model)throws Exception{
////		UserDetails userDetails = memberService.getE
////		return "reidrect:/";
////	}

	}

