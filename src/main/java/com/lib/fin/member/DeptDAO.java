package com.lib.fin.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.lib.fin.approval.ApprovalDocVO;



@Mapper
public interface DeptDAO {
	

	
	public List<Map<String, Object>> getDeptInfo()throws Exception;

}
