	package com.lib.fin.member;
	
	import java.lang.reflect.Member;
import java.security.Principal;
	import java.util.HashMap;
import java.util.List;
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
import org.springframework.ui.Model;
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
	
		//멤버리스트
		   public List<MemberVO> getList(MemberVO memberVO)throws Exception {
		        List<MemberVO> list = memberDAO.getList(memberVO);
		        return list;
		    }
		
		
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
		    public int memJoin(MemberVO memberVO, Model model) throws Exception {
		        memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
			 	
		        Map<String, Object> teamMap=new HashMap<>();
		        teamMap.put("A", "대표");
		        teamMap.put("B", "운영과");
		        teamMap.put("C", "정책과");
		        teamMap.put("D", "서비스과");
		        teamMap.put("E", "가발령");
		        model.addAttribute("teamMap",teamMap);
	
		        Map<String, Object> positionMap=new HashMap<>();
		        positionMap.put("A", "관장");
		        positionMap.put("B", "팀장");
		        positionMap.put("C", "주무관");
		        positionMap.put("D", "사서");
		        model.addAttribute("positionMap",positionMap);
		        
		        //부서 및 직급 이름으로 설정
		        memberVO.setEmp_team((String) teamMap.get(memberVO.getEmp_team()));
		        memberVO.setEmp_position((String) positionMap.get(memberVO.getEmp_position()));

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
			public int updateMember(MemberVO memberVO)throws Exception{
				  MemberVO updatedMember = new MemberVO();
				  updatedMember.setEmp_no(memberVO.getEmp_no()); // 
				  log.info("===업데이트시 사원번호:{}===", updatedMember.getEmp_no());
				  
				  // 비밀번호가 입력된 경우에만 업데이트
			    if (memberVO.getPassword() != null && !memberVO.getPassword().isEmpty()) {
			        // 비밀번호 변경, 암호화처리
			    	String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
			        memberVO.setPassword(encodedPassword);
			    }else {
			    	//비밀번호 변경하지않을경우 null로 설정해서 업데이트에서 제외
			    	memberVO.setPassword(null);
			    }
			    
			    //이메일과 전화번호
			   // MemberVO updateMember = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			    //이메일이 null이 아니고 비어있지않으면 이메일 업데이트 처리
			    if(memberVO.getEmail() != null && !memberVO.getEmail().isEmpty()) {
			    	memberVO.setEmail(memberVO.getEmail());
			    }else {
			    	memberVO.setEmail(null);
			    }
			    //전화번호가 null이 아니고 비어있지 않으면 전화번호 업데이트 처리
			    if (memberVO.getPhone() != null && !memberVO.getPhone().isEmpty()) {
			    	memberVO.setPhone(memberVO.getPhone());
			    }else {
			    	memberVO.setPhone(null);
			    }
			    //새로 설정한 값 추출
//			    String newPassword = memberVO.getPassword();
//			    String newPhone = memberVO.getPhone();
//			    String newEmail = memberVO.getEmail();
			    
				log.info("====정보수정중{}====", memberVO);
				  int result = memberDAO.updateMember(memberVO);
				
				  
				  if (result == 1) {
				      return result;
				  } else {
				      return 0;
				  }
				
			   //return result;
			}
	
//		   @Transactional(rollbackFor = Exception.class)
//		   public int updateMember(MemberVO memberVO)throws Exception{
//			   try {
//				   
//				   //비밀번호 변경여부
//				   if(memberVO.getPassword() !=null && !memberVO.getPassword().isEmpty()) {
//					// 비밀번호 변경, 암호화 처리
//		                if (memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
//		                    String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
//		                    memberVO.setPassword(encodedPassword);
//		                    log.info("====비밀번호{}=====");
//		                } else {
//		                    
//		                    throw new Exception("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
//		                }
//		            }
//				   	// 이메일 
//		            if (memberVO.getEmail() != null && !memberVO.getEmail().isEmpty()) {
//		            	memberVO.setEmail(memberVO.getEmail());
//		            }
//
//		            // 전화번호 
//		            if (memberVO.getPhone() != null && !memberVO.getPhone().isEmpty()) {
//		            	memberVO.setPhone(memberVO.getPhone());
//		            }
//
//		            // MemberDAO를 사용하여 회원 정보 업데이트
//	            int result = memberDAO.updateMember(memberVO);
//
//	            return result;
//		          
//		        } catch (Exception e) {
//		            throw new Exception("회원 정보 업데이트 중 오류가 발생했습니다.");
//		        }
//		    }
//		
			
//			   @Transactional(rollbackFor = Exception.class)
//			    public Integer updateMember(MemberVO memberVO) throws Exception {
//				   log.info("====updateMember 메서드 호출{}=====", memberVO);
//			        int result = memberDAO.updateMember(memberVO);
//			        return result;
//			    }
//			@Transactional(rollbackFor = Exception.class)
//		    public int updateMember(MemberVO memberVO) throws Exception {
//			   log.info("====updateMember 메서드 호출{}=====", memberVO);
//		        int result = memberDAO.updateMember(memberVO);
//		       	if(result <=0) {
//		       		throw new Exception("업데이트에 실패했습니다");
//		       	}
//				return result;
//		    }
//			
//			   @Transactional(rollbackFor = Exception.class)
//			    public int memberUpdate(MemberVO memberVO) throws Exception {
//			        //memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
//				   //String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
//				  //memberVO.setPassword(encodedPassword);
//				   	int result = memberDAO.memberUpdate(memberVO);
//			        return result;
//			    }
//	}
			
			
			
			
			   //아이디찾기
			   public MemberVO  findEmpNo(String name, String phone)throws Exception{
				   log.info(phone);
				   log.info(name);
				   return memberDAO.findEmpNo(name, phone);
				   
			   }
			   
			   //비밀번호 찾기
			   public MemberVO findPassword(String emp_no, String phone)throws Exception{
				   log.info(phone);
				   log.info(emp_no);
				   return memberDAO.findEmpNo(emp_no, phone);
			   }
			   
}
