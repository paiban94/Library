package com.lib.fin.member;

import java.util.Map;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.lib.fin.member.MemberVO;

@Mapper
public interface MemberDAO {
	
	
	//로그인
	public MemberVO getMember(MemberVO memberVO)throws Exception;
	
	
	//회원가입
	//int reuslt= memberDAO.memJoin(memberVO); service에서 데이터 타입 
	public int memJoin(MemberVO memberVO)throws Exception;

	//공통코드 테이블 
	public int setMemberROle(Map<String, Object> map) throws Exception;
	
	//회원가입 버튼 클릭 후 emp_no 모달창으로
	//public String getEmpNoModal(String emp_no)throws Exception;

	//profile
	public int getProfile(MemberFileVO memberFileVO)throws Exception;

}
