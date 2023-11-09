package com.lib.fin.member;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.lib.fin.member.MemberVO;

@Mapper
public interface MemberDAO {
	

	//로그인
	//시큐리티
	public MemberVO getLogin(MemberVO memberVO)throws Exception;	
	
	//회원가입
	//int reuslt= memberDAO.memJoin(memberVO); service에서 데이터 타입 
	public int memJoin(MemberVO memberVO)throws Exception;
	
	//회원목록
	public List<MemberVO> getList(MemberVO memberVO)throws Exception;
	
	//부서목록
	public List<MemberVO> getTeamList(String emp_team)throws Exception;
	
	//imagefile
	public int setMemImage(MemberFileVO memberFileVO)throws Exception;
	
	//공통코드 테이블 
	public int setMemberRole(Map<String, Object> map) throws Exception;

	//업데이트
	public int updateMember(MemberVO memberVO)throws Exception;
	//public int updateMember(String password, String phone, String email)throws Exception;
	
	// public Integer updateMember(MemberVO memberVO)throws Exception;
	
	//회원가입 버튼 클릭 후 emp_no 모달창으로
//	public String getEmpNoModal(String emp_no)throws Exception;

	//profile
	//public int getProfile(MemberFileVO memberFileVO)throws Exception;
	
	//사원번호 찾기
	public MemberVO findEmpNo(String name, String phone)throws Exception;
	//비밀번호 찾기
	public MemberVO findPassword(String emp_no,String phone) throws Exception;
}
