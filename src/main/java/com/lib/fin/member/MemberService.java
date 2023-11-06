	package com.lib.fin.member;
	
	import java.security.Principal;
	import java.util.HashMap;
	
	import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.userdetails.User;
	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.lib.fin.commons.FileManagerProfile;

import lombok.extern.slf4j.Slf4j;
	
	@Service
	@Slf4j
	public class MemberService implements UserDetailsService {
	
	
		//DAO
		@Autowired
		private MemberDAO memberDAO;
		
		@Autowired
		private FileManagerProfile fileManagerProfile;
		
		@Autowired
		private PasswordEncoder passwordEncoder;
		
		//local file 위치
		@Value("${app.upload.mapping}")
		private String filePath;
			
		//요청 URL 경로
		@Value("${app.url.path}")
		private String urlPath;
	
		// 사원번호 모달에 전송
		public String getEmpNoModal(MemberVO memberVO) {
		    return memberVO.getEmp_no();
		}
		
	
		//검증메서드
		public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception{
			boolean check = false; 
			//false = error가 없다, true = error가 있다. 검증실패
			
			//password 일치 검증
			if(memberVO.getPassword() != null && memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
				check=false; // 비밀번호가 비어있지않고 패스워드가 패스워드체크랑 같다면 일치
			}else {	
				//비밀번호 누락 or 불일치
				check=true;
				bindingResult.rejectValue("passwordCheck", "password.mismatch", "비밀번호가 일치해야 합니다.");
			}
				
			
			return check;
		}
		
		
		//코드를 코드명이랑 매칭해서 변경
//		public Map<String, String> getCodeName(){
//			Map<String, String> codeName = new HashMap<>();
//			codeName.put(null, null)
//		}	 
		
		 @Transactional(rollbackFor = Exception.class)
		    public int memJoin(MemberVO memberVO) throws Exception {
		        memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
			 	
		        // 회원 정보 저장
		        int result = memberDAO.memJoin(memberVO);

		     
	
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
			   @Transactional(rollbackFor = Exception.class)
			    public Integer updateMember(MemberVO memberVO) throws Exception {
				   log.info("====updateMember 메서드 호출=====");
			        int result = memberDAO.updateMember(memberVO);
			        return result;
			    }
//			   @Transactional(rollbackFor = Exception.class)
//			    public int memberUpdate(MemberVO memberVO) throws Exception {
//			        //memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
//				   	String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
//				   	memberVO.setPassword(encodedPassword);
//				   	int result = memberDAO.memberUpdate(memberVO);
//			        return result;
//			    }
			   
			   
			   //아이디찾기
			   public MemberVO  findEmpNo(String name, String phone)throws Exception{
				   log.info(phone);
				   log.info(name);
				   return memberDAO.findEmpNo(name, phone);
				   
			   }
			   
}
