package com.lib.fin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.approval.ApprovalDAO;
import com.lib.fin.commons.FileManager;


@Service

public class DeptService {
	
	@Autowired
	private  DeptDAO deptDAO;

	
	public List<Map<String,Object>> getDeptInfo(){
		
		
		List<Map<String, Object>> deptList=null;
		try {
			deptList = deptDAO.getDeptInfo();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return deptList;
	}

}
