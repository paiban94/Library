package com.lib.fin.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	//기안
	@GetMapping("draft")
	private String setDraft()throws Exception {
		return "approval/draft";
	}
	
	@PostMapping("draft")
	private String setDraft(ApprovalDocVO approvalDocVO,MultipartFile[] files1)throws Exception {
		approvalDocVO.setEmp_no("20231");
		approvalDocVO.setReg_id("20231");
		approvalDocVO.setMod_id("20231");
		approvalDocVO.setUse_yn("y");
		
		approvalService.setDraft(approvalDocVO, files1);
		
		return "approval/draft";
	}
	
	//휴가신청서
	@GetMapping("leave")
	private String getLeave()throws Exception{
		return "approval/leave";
	}
	
	//지출결의서
	@GetMapping("expense")
	private String getExpense()throws Exception{
		return "approval/expense";
	}

}
