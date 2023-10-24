package com.lib.fin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

	//DAO
	@Autowired
	private MemberDAO memberDAO;


	//검증메서드
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception{
		boolean check = false; 
		//false = error가 없다, true = error가 있다. 검증실패
		
		//password 일치 검증
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check=true; // 패스워드가 패스워드체크랑 같지않다면 트루(에러)
			
			//bindingResult.reject("passwordCheck","비밀번호가 일치하지 않습니다.");
			bindingResult.rejectValue("passwordCheck", "password.mismatch", "비밀번호가 일치해야 합니다.");
		}
			
		
		return check;
	}
	
	 @Transactional(rollbackFor = Exception.class)
	    public int memJoin(MemberVO memberVO) throws Exception {
	        memberDAO.memJoin(memberVO);
	        // 다른 처리 로직 추가 (예: 권한 설정, 로깅 등)
	        return 1; // 성공 시 양수 반환, 실패 시 0 반환
	    }

}
