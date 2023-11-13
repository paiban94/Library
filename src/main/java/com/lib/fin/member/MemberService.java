	package com.lib.fin.member;
	
	import java.lang.reflect.Member;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.security.core.userdetails.User;
	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfiguration;
	import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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

import com.lib.fin.commons.FileManager;
import com.lib.fin.commons.FileManagerProfile;

import lombok.extern.slf4j.Slf4j;
	
	@Service
	@Slf4j
	public class MemberService implements UserDetailsService {
	
	
		//DAO
		@Autowired
		private MemberDAO memberDAO;
		
		@Autowired
		//private FileManager fileManager;
		private FileManagerProfile fileManagerProfile;
		//이메일 전송	
		@Autowired
		private JavaMailSender javaMailSender;
		
		@Autowired
		private PasswordEncoder passwordEncoder;
		
		//local file 위치
		@Value("${app.upload}")
		private String filePath;
			
	
		@Value("${app.member.photo}")
		private String photo;
		
	
		//관리자멤버리스트
		   public List<MemberVO> getAdminMemList(MemberVO memberVO)throws Exception {
		        List<MemberVO> getAdminMemList = memberDAO.getAdminMemList(memberVO);
		        return getAdminMemList;
		    }
	   //관리자 멤버 상세정보
		   public MemberVO getAdminDetail(String emp_no) throws Exception {
		        return memberDAO.getAdminDetail(emp_no);
		    }
		   

		//관리자 멤버 정보 업데이트
		  public int adminMemUpdate(MemberVO memberVO)throws Exception{
			  return memberDAO.adminMemUpdate(memberVO);
		  }
		   
		
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
			 	
		        // 회원 정보 저장
		        int result = memberDAO.memJoin(memberVO);
		        Map<String, Object> map = new HashMap<>();
		        map.put("roleNum",memberVO.getEmp_position());
		        result = memberDAO.setMemberRole(map);
		        return result;
		    }   
		 	
		 
		 //이미지저장
		public int setMemImage(MemberFileVO memberFileVO,MultipartFile photo, MemberVO memberVO)throws Exception{
			 
		 		
		 		String path =filePath +photo;
		 		String saveFileName = fileManagerProfile.save(path, photo, memberVO);
	   
			   try {
				   if(photo != null) {
					 
					   
					   memberFileVO.setFile_no(memberVO.getEmp_no());
					   memberFileVO.setFile_name(saveFileName);
					   memberFileVO.setFile_oriName(photo.getOriginalFilename());
					   memberFileVO.setEmp_no(memberVO.getEmp_no());
					   memberFileVO.setReg_id(memberFileVO.getEmp_no());
					   memberFileVO.setMod_id(memberVO.getEmp_no());
					   memberFileVO.setUse_yn("Y");
					   
					   //DB에 저장
					   memberDAO.setMemImage(memberFileVO);
				   }
				
			} catch (Exception e) {
				log.info("파일업로드실패"+e.getMessage());
			}
		 		
		 		
		 		return 0;
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
				
				List<GrantedAuthority> authorities = new ArrayList<>();
				for(RoleVO roleVO : memberVO.getRoleVOs()) {
					authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
				}
				
				UserDetails userDetails = new User(
				memberVO.getEmp_no(),
				memberVO.getPassword(),
				authorities
				);
				
				log.info("=====권한보기{}=====", authorities);
				return userDetails;
				
			}
		
			
			//업데이트
			@Transactional(rollbackFor = Exception.class)
			public int updateMember(MemberVO memberVO, MultipartFile photo)throws Exception{
				  //MemberVO updatedMember = new MemberVO();
				  MemberVO updatedMember = memberDAO.getLogin(memberVO);
				  
				  // 기존 정보를 유지하도록 설정
				  memberVO.setEmp_team(updatedMember.getEmp_team());
				  memberVO.setEmp_position(updatedMember.getEmp_position());
				  memberVO.setBirth(updatedMember.getBirth());
				  
				  log.info("===업데이트시 사원번호:{}===", memberVO.getEmp_no());
				  log.info("===업데이트시 생일:{}===", memberVO.getBirth());
				  log.info("===업데이트시 부서:{}===", memberVO.getEmp_team());
				  
				  
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
			    //이메일이 null이 아니고 비어있지않으면 이메일 업데이트 처리
			    if(memberVO.getEmail() != null && !memberVO.getEmail().isEmpty()) {
			    	memberVO.setEmail(memberVO.getEmail());
			    }else {
			    	//수정 안할 시 이전 이메일
			    	memberVO.setEmail(memberVO.getEmail());
			    }
			    //전화번호가 null이 아니고 비어있지 않으면 전화번호 업데이트 처리
			    if (memberVO.getPhone() != null && !memberVO.getPhone().isEmpty()) {
			    	memberVO.setPhone(memberVO.getPhone());
			    }else {
			    	memberVO.setPhone(null);
			    }
			    if(memberVO.getBirth()==null) {
			    	memberVO.setBirth(memberVO.getBirth());
			    }
			    if(memberVO.getEmp_team()==null) {
			    	memberVO.setEmp_team(memberVO.getEmp_team());
			    }
			    if(memberVO.getBirth()==null) {
			    	memberVO.setEmp_position(memberVO.getEmp_position());
			    }
				log.info("====정보수정중{}====", memberVO);
				
				int result = memberDAO.updateMember(memberVO);
				
				  
				  if (result==1) {
				      return result;
				  } else {
				      return 0;
				  }
				
			   //return result;
			}
	

			
			//모달
//			public String memjoin()throws Exception{
//				String empNo = memberDAO.memJoin(emp_no);
//				return empNo;
//			}
			
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
