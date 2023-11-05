package com.lib.fin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lib.fin.approval.ApprovalDocVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/dept/*")
@Slf4j
public class DeptController {

	@Autowired
	DeptService deptService;
	
	
	@PostMapping("/getDeptInfo")
	@ResponseBody
	public List<Map<String,Object>> getDeptInfo() throws Exception{
	
        
		List<Map<String,Object>> deptList= deptService.getDeptInfo();
			
		return deptList;
		
	
	}
	
//	@RequestMapping("/getEmpInfo")
//	@ResponseBody
//	public List<Map<String,Object>> getEmpInfo(String emp_team) throws Exception{
//	
//		List<Map<String,Object>> EmpList= deptService.getEmpInfo(emp_team);
//			
//		return EmpList;
//		
//	
//	}
	
	@PostMapping("/getEmpInfo")
	@ResponseBody
	public List<MemberVO> getEmpInfo(String emp_team) throws Exception{
	
		List<MemberVO> EmpList= deptService.getEmpInfo(emp_team);
			
		return EmpList;
		
	
	}

	
	

}
