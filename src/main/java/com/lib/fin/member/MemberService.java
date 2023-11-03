	package com.lib.fin.member;
	
	import java.security.Principal;
	import java.util.HashMap;
	
	import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.userdetails.User;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.boot.autoconfigure.AutoConfiguration;
	import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;

	import org.springframework.security.authentication.BadCredentialsException;
	import org.springframework.security.core.annotation.AuthenticationPrincipal;
	import org.springframework.security.core.context.SecurityContext;
	import org.springframework.security.core.context.SecurityContextHolder;
	import org.springframework.security.core.userdetails.UserDetails;
	import org.springframework.security.core.userdetails.UserDetailsService;
	import org.springframework.security.core.userdetails.UsernameNotFoundException;
	import org.springframework.security.crypto.factory.PasswordEncoderFactories;
	import org.springframework.security.crypto.password.PasswordEncoder;
	import org.springframework.stereotype.Service;
	import org.springframework.transaction.annotation.Transactional;
	import org.springframework.validation.BindingResult;
	import org.springframework.web.multipart.MultipartFile;
	
	import lombok.extern.slf4j.Slf4j;
	
	@Service
	@Slf4j
	public class MemberService implements UserDetailsService {
	
	
		//DAO
		@Autowired
		private MemberDAO memberDAO;
		@Autowired
		private PasswordEncoder passwordEncoder;
		

	
		
		//EMP_NO MODAL창으로
	//	public String getEmpNoModal(String emp_no)throws Exception {
	//		return memberDAO.getEmpNoModal(emp_no);
	//		
	//	}
		
	
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
			 	
		      
		        
		        // 회원 정보 저장
		        int result = memberDAO.memJoin(memberVO);
		        //if 나가면 사라지는곳인데 여기는 기본값? 다시 생각해볼곳
		        if (result > 0) {
		            // 권한 정보 설정
		            Map<String, Object> map = new HashMap<>();
		            map.put("grp_cd", "U001"); // 권한 그룹 코드
		            map.put("cd", "U"); // 권한 코드
		            map.put("cd_nm", "USER"); // 권한 이름
	
		            // 부서 정보 설정
		            Map<String, Object> empTeamMap = new HashMap<>();
		            empTeamMap.put("grp_cd", "T001"); // 부서 그룹 코드
		            empTeamMap.put("cd", "E"); // 부서 코드
		            empTeamMap.put("cd_nm", "부서 이름"); // 부서 이름 (선택적으로 추가)
	
		            // 직급 정보 설정
		            Map<String, Object> empPositionMap = new HashMap<>();
		            empPositionMap.put("grp_cd", "L001"); // 직급 그룹 코드
		            empPositionMap.put("cd", "D"); // 직급 코드
		            empPositionMap.put("cd_nm", "직급 이름"); // 직급 이름 (선택적으로 추가)
	
		        }
	
		        return result;
		    }   
		        
		 
			//로그인
			@Override
			public UserDetails loadUserByUsername(String emp_no) throws UsernameNotFoundException {
				// TODO Auto-generated method stub
				log.info("====== 로그인 시도 중 ==========");
				MemberVO memberVO = new MemberVO();
				memberVO.setEmp_no(emp_no);

			
				
				try {
					memberVO = memberDAO.getLogin(memberVO);

					log.info("====== 로그인 시도 중  {}==========",memberVO);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					memberVO=null;
				}
				
				return memberVO;
				
			}
			//업데이트
			
			public void memberUpdate(MemberVO memberVO)throws Exception{
				memberDAO.memberUpdate(memberVO);
			
	}		
		

	
	
	
}
