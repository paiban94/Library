package com.lib.fin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.approval.ApprovalDAO;
import com.lib.fin.approval.ApprovalDocVO;
import com.lib.fin.commons.FileManager;


@Service
public class DeptService {
	
	@Autowired
	private  DeptDAO deptDAO;

	
	public List<Map<String,Object>> getDeptInfo()throws Exception{
		
		
		List<Map<String, Object>> deptList=deptDAO.getDeptInfo();
	
		
		return deptList;
	}
	
//	public List<Map<String,Object>> getEmpInfo(String emp_team)throws Exception{
//		
//		
//		List<Map<String, Object>> EmpList=deptDAO.getEmpInfo(emp_team);
//		
//		
//		return EmpList;
//	}
	
public List<ApprovalDocVO> getEmpInfo(String emp_team)throws Exception{
		
		
		List<ApprovalDocVO> EmpList=deptDAO.getEmpInfo(emp_team);
		
		
		return EmpList;
	}
	


}
