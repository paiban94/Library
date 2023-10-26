package com.lib.fin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfiguration;
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
public class MemberService implements UserDetailsService {

	//DAO
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PasswordEncoder passwordEncoder;


	//검증메서드
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception{
		boolean check = false; 
		//false = error가 없다, true = error가 있다. 검증실패
		
		//password 일치 검증
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			check=true; // 패스워드가 패스워드체크랑 같지않다면 트루(에러)
			
			bindingResult.rejectValue("passwordCheck", "password.mismatch", "비밀번호가 일치해야 합니다.");
		}
			
		
		return check;
	}
	
	 @Transactional(rollbackFor = Exception.class)
	    public int memJoin(MemberVO memberVO) throws Exception {
	        memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		 	int result= memberDAO.memJoin(memberVO);
	        // 다른 처리 로직 추가 (예: 권한 설정, 로깅 등)
	        return result; // 성공 시 양수 반환, 실패 시 0 반환
	    }
	 
	 //serverLogin
		@Override
		public UserDetails loadUserByUsername(String emp_no) throws UsernameNotFoundException {		
			//MemberVO memberVO = MemberMapper.getLogin(username);
			MemberVO memberVO = new MemberVO();
			memberVO.setEmp_no(emp_no);
			try {
				memberVO = memberDAO.getMember(memberVO);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				memberVO=null;
			}
			return  memberVO;
		}

}
