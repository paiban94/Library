package com.lib.fin.member;

import java.lang.reflect.Member;
import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.commons.FileManager;
import com.lib.fin.commons.FileManagerProfile;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/member/*")
@Slf4j
public class MemberController {
	
	//service 생성자 주입
	@Autowired
	private MemberService memberService;
	@Autowired
	//private FileManager fileManager;
	private FileManagerProfile fileManagerProfile;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//멤버리스트
	@GetMapping("memberList")
	public String memList(Model model, MemberVO memberVO)throws Exception{
		List<MemberVO> memberList = memberService.getList(memberVO);
		model.addAttribute("memberList",memberList);
		return "member/memberList";
	}
	
	//부서리스트 
	@GetMapping("teamList")
	public String TeamList(String emp_team,Model model)throws Exception{
		List<MemberVO> teamList = memberService.getTeamList(emp_team);
		model.addAttribute("teamList",teamList);
		return "member/teamList";
	}
	
	//회원가입 페이지 출력 요청
	@GetMapping("join")
	public void memJoin (@ModelAttribute MemberVO memberVO) throws Exception {
		
	}
	
    @PostMapping("join")
    public String memJoin(@Valid MemberVO memberVO, BindingResult bindingResult,Model model, MultipartFile profile) throws Exception {
    	
    	boolean check = memberService.getMemberError(memberVO, bindingResult);
    	log.info("===check:{}====", check);
    	if(bindingResult.hasErrors() || check) {
    		log.info("==========실패했습니다==========");
    		return "member/join";
    	}
    	
    	   	
        int result = memberService.memJoin(memberVO, model);
        
        log.info("===result:{}====", result);
        
       
        
        if (result > 0) {
            // 회원 가입이 성공한 경우에 대한 처리
            log.info("===========회원 가입이 성공했습니다.=========");
             
        	int empNo = memberService.memJoin(memberVO, model);
        	model.addAttribute("empNo", empNo);
        	//log.info("profile : name---: {} --- size : {}", profile.getName(), profile.getSize());
 
        	return "member/login";
    		
        }else {
             
        return "member/join";
        }
     }
    //모달로 사원번호보내기
//    @GetMapping("join")
//    public String getEmpNoModal(String emp_no, Model model)throws Exception{
//    	String empNo = memberService.getEmpNoModal(emp_no);
//    	model.addAttribute("empNo", empNo);
//    	return "member/join";
//    }
    
    
    
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

//	//topbar
//	@GetMapping("../layout/topbar")
//	public String logInfo(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
//		String name = memberVO.getName();
//		
//	}
	
	//마이페이지
	@GetMapping("mypage")
	public String memberInfo(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
		//String emp_no = memberVO.getEmp_no();
		model.addAttribute("memberVO",memberVO);
		return "member/mypage";	
	}
	
	
	

	
	//정보수정 프로필 출력, 정보읽어와 뷰로 전달
	@GetMapping("update")
	public String getUpdateMember(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
		log.info("======정보수정 시도중 ====");
		model.addAttribute("memberVO",memberVO);
		return "member/update";
	}
	
	 @PostMapping("/update")
	    public String postUpdateMember(@Valid MemberVO memberVO, BindingResult bindingResult, Model model)throws Exception {
	        	
		 	boolean check = memberService.getMemberError(memberVO, bindingResult);
			log.info("===업데이트check:{}====", check);
		 	if (bindingResult.hasErrors()||check) {
	            // 유효성 검사 에러가 있을 경우 처리
	            return "member/update";
	        }

	        int result = memberService.updateMember(memberVO);
	    	log.info("===업데이트RESULT:{}====",result);
	        if (result > 0) {
	            model.addAttribute("success", memberVO);
	        } else {
	            model.addAttribute("error", "정보 수정에 실패했습니다.");
	        }
	        
	        
	        return "member/mypage";
	    }
	
	
	//정보수정 프로필 출력, 정보읽어와 뷰로 전달
//	@GetMapping("update")
//	public String getUpdateMember(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
//		MemberUpdateVO memberUpdateVO = new MemberUpdateVO();
//		memberUpdateVO.setNewEmail(memberVO.getEmail());
//		memberUpdateVO.setNewPhone(memberVO.getPhone());
//		memberUpdateVO.setNewPassword(memberVO.getPassword());
//		
//		model.addAttribute("memberUpdateVO",memberUpdateVO);
//		return "member/update";
//	}
	


//	@PostMapping("update")
//    public String postUpdateMember(@Valid MemberVO memberVO, BindingResult bindingResult)throws Exception{
//		
//		boolean check = memberService.getMemberError(memberVO, bindingResult);
//	  	if(bindingResult.hasErrors() || check) {
// 		log.info("==========수정에 실패했습니다{}==========", check);
//    		  // bindingResult.rejectValue("passwordCheck", "password.mismatch", "비밀번호가 일치해야 합니다.");
//    	        return "member/update";
//    	}
//
//		
//		 // 비밀번호가 입력된 경우에만 업데이트
//	    if (memberVO.getPassword() != null && !memberVO.getPassword().isEmpty()) {
//	        // 비밀번호 변경, 암호화처리
//	    	String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
//	        memberVO.setPassword(encodedPassword);
//	    }else {
//	    	//비밀번호 변경하지않을경우 null로 설정해서 업데이트에서 제외
//	    	memberVO.setPassword("");
//	    }
//	    
//	    //이메일과 전화번호
//	   // MemberVO updateMember = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//	    //이메일이 null이 아니고 비어있지않으면 이메일 업데이트 처리
//	    if(memberVO.getEmail() != null && !memberVO.getEmail().isEmpty()) {
//	    	memberVO.setEmail(memberVO.getEmail());
//	    }else {
//	    	memberVO.setEmail("");
//	    }
//	    //전화번호가 null이 아니고 비어있지 않으면 전화번호 업데이트 처리
//	    if (memberVO.getPhone() != null && !memberVO.getPhone().isEmpty()) {
//	    	memberVO.setPhone(memberVO.getPhone());
//	    }else {
//	    	memberVO.setPhone("");
//	    }
//
//
//		log.info("====정보수정중{}====", memberVO);
//		int result = memberService.updateMember(memberVO);
//
//		if (result>0) {
//		    log.info("===========정보 수정이 성공했습니다.=========");
//		} else {
//		    log.info("===========정보 수정에 실패했습니다.=========");
//		}
//
//		
//	   return "member/mypage";
//	}
	
	@GetMapping("findEmpNo")
	public String getFindEmpNo()throws Exception {
		return "member/findEmpNo";
	}
	
	
	@PostMapping("findEmpNo")
	public String postFindEmpNo(@RequestParam String name, @RequestParam String phone, Model model)throws Exception{
		MemberVO memberVO = memberService.findEmpNo(name, phone);
		//String emp_no = memberService.findEmpNo(name, phone);
		log.info("=======사원번호:{}=======",memberVO);
		 if (name == null || name.isEmpty() || phone == null || phone.isEmpty()) {
		 model.addAttribute("error", "이름과 전화번호를 입력해야 합니다.");
		 return "member/findEmpNo";
		}
		//이름과 이메일이 일치하지 않으면 에러메세지 띄워주기
		
		if(memberVO != null) {
			model.addAttribute("FindEmpNo",memberVO);
		}else {
			model.addAttribute("error", "해당 사원번호를 찾을 수 없습니다.");
		}
		return "member/empresult";
	}
	
	//비밀번호찾기
	@GetMapping("findPassword")
	public String getFindPassword()throws Exception {
		return "member/findPassword";
	}
	
//	@PostMapping("f")
	
	
}

