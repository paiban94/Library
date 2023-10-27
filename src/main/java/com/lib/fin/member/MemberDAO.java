package com.lib.fin.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.lib.fin.member.MemberVO;

@Mapper
public interface MemberDAO {
	
	//로그인
	public MemberVO getMember(MemberVO memberVO)throws Exception;
	
	//회원가입
	//int reuslt= memberDAO.memJoin(memberVO); service에서 데이터 타입 
	public int memJoin(MemberVO memberVO)throws Exception;

	//role 권한 리스트
	public int setMemberRole(Map<String, Object> map)throws Exception;
}
