package com.lib.fin.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO {

	//DB연결 (xml에서 만들어진 객체를 가져다 사용하고자함 = 의존 주입)
	@Autowired
	private SqlSession sqlSession;
	
	//mapper구분하는 값 namespace
	private static final String namespace = "com.lib.fin.MemberMapper";
	
	//emp_no modal
	@Override
	public String getEmpNoModal(String emp_no)throws Exception{
		return sqlSession.selectOne("member.getEmpNoModal",emp_no);
	}

	@Override
	public MemberVO getMember(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memJoin(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public int setMemberRole(Map<String, Object> map) throws Exception {
//		// TODO Auto-generated method stub
//		return 0;
//	};

}
