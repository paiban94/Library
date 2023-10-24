package com.lib.fin.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {

	
	//회원가입
	public void memJoin(MemberVO memberVO)throws Exception;
}
