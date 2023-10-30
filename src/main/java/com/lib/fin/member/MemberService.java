package com.lib.fin.member;

import java.util.HashMap;
import java.util.Map;

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

	
	//EMP_NO MODAL창으로
	public String getEmpNoModal(String emp_no)throws Exception {
		return memberDAO.getEmpNoModal(emp_no);
		
	}
	

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
		 	
	        String level = memberVO.getAuthority();
	        String team = memberVO.getEmp_team();
	        String position = memberVO.getEmp_position();
	        
//	        //회원정보저장
//	        int result= memberDAO.memJoin(memberVO);
//	        
//	      
//
//	        	Map<String, Object> map = new HashMap<>();
//	        	map.put("grp_cd", "U001"); // 권한 그룹 코드
//	            map.put("cd", level);    // 권한 코드 
//	            map.put("cd_nm", "USER"); // 권한 이름 
//	            
//	            Map<String, Object> teamMap = new HashMap<>();
//	            map.put("grp_cd", "T"); // 부서 그룹 코드
//	            map.put("cd", team);    // 부서 코드 
//	            map.put("cd_nm", "부서이름"); // 부서 이름 
//	            
//	            Map<String, Object> positionMap = new HashMap<>();
//	            map.put("grp_cd", "L"); // 부서 그룹 코드
//	            map.put("cd", position);    // 부서 코드 
//    
//	        // 권한 정보 저장
//	            result = memberDAO.setMemberRole(map);
//	            int teamResult = memberDAO.setMemberRole(teamMap);
//	            int positionResult = memberDAO.setMemberRole(positionMap);
//	            
//	        return result; // 성공 시 양수 반환, 실패 시 0 반환
//	    }
//	 
	        // 회원 정보 저장
	        int result = memberDAO.memJoin(memberVO);

	        if (result > 0) {
	            // 권한 정보 설정
	            Map<String, Object> map = new HashMap<>();
	            map.put("grp_cd", "U001"); // 권한 그룹 코드
	            map.put("cd", level); // 권한 코드
	            map.put("cd_nm", "USER"); // 권한 이름

	            // 부서 정보 설정
	            Map<String, Object> empTeamMap = new HashMap<>();
	            empTeamMap.put("grp_cd", "T001"); // 부서 그룹 코드
	            empTeamMap.put("cd", team); // 부서 코드
	            empTeamMap.put("cd_nm", "부서 이름"); // 부서 이름 (선택적으로 추가)

	            // 직급 정보 설정
	            Map<String, Object> empPositionMap = new HashMap<>();
	            empPositionMap.put("grp_cd", "L001"); // 직급 그룹 코드
	            empPositionMap.put("cd", position); // 직급 코드
	            empPositionMap.put("cd_nm", "직급 이름"); // 직급 이름 (선택적으로 추가)

	            // 부서 정보 및 직급 정보 저장
//	            int empTeamResult = memberDAO.setMemberRole(empTeamMap);
//	            int empPositionResult = memberDAO.setMemberRole(empPositionMap);
//
//	            if (empTeamResult > 0 && empPositionResult > 0) {
//	                result = 1; // 부서와 직급 정보 저장에 성공하면 회원 정보 저장 성공
//	            } else {
//	                result = 0; // 부서 또는 직급 정보 저장에 실패하면 회원 정보 저장 실패
//	            }
	        }

	        return result;
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
