package com.lib.fin.member;

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
	
	//imagefile
	public int setMemImage(MemberFileVO memberFileVO)throws Exception;
	
	//공통코드 테이블 
	public int setMemberRole(Map<String, Object> map) throws Exception;

	//업데이트
	//public void updateMember(MemberVO memberVO)throws Exception;
	//public int updateMember(MemberVO memberVO)throws Exception;
	public Integer updateMember(MemberVO memberVO)throws Exception;
	
	//회원가입 버튼 클릭 후 emp_no 모달창으로
	public String getEmpNoModal(String emp_no)throws Exception;

	//profile
	//public int getProfile(MemberFileVO memberFileVO)throws Exception;
	
	//사원번호 찾기
	public MemberVO findEmpNo(String name, String phone)throws Exception;
}
