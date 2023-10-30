package com.lib.fin.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService2 implements UserDetailsService{

	//DAO 의존성주입
	@Autowired
	private MemberDAO memberDAO;
	//패스워드인코더
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원가입 시 검증메서드
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		boolean check = false; //false : error없다
		
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check=true; //check=!check
			
			bindingResult.rejectValue("passwordCheck", "memberVO.password.equalCheck");
		}
		
		return check;
		
	}




	//server Login
	@Override
	public UserDetails loadUserByUsername(String emp_no) throws UsernameNotFoundException {		
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmp_no(emp_no);
		
		
		log.info("======name{}===================", memberVO.getName());
		
		try {
			memberVO = memberDAO.getMember(memberVO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			memberVO=null;
		}
		
		 if (memberVO == null) {
	            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + emp_no);
	     }
		 	
		 
	

		 
		 // 사용자 이름과 전화번호를 로드한 데이터로 설정
		    String name = memberVO.getName();
		    String phone = memberVO.getPhone();
		    memberVO.setName(name);
		    memberVO.setPhone(phone);

	
		    
		return  memberVO;
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	public int memJoin (MemberVO memberVO) throws Exception{
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		//회원정보저장
		int result = memberDAO.memJoin(memberVO);
	    Map<String, Object> map = new HashMap<>();
        //회원가입시 기본권한 설정
	    map.put("grp_cd", "U001"); // 권한 그룹 코드
        map.put("cd", "U"); // 권한 코드
        map.put("cd_nm", "USER"); // 권한 이름

        return result;
		
	}
	
}	