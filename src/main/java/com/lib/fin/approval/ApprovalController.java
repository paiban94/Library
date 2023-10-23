package com.lib.fin.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	
	@Autowired
	private ApprocalService approcalService;
	
	@GetMapping("draft")
	private String getDraft()throws Exception {
		return "approval/draft";
	}
	
	@PostMapping("draft")
	private String getDraft(ApprovalDocVO approvalDocVO,MultipartFile[] file)throws Exception {
		
		
		
		return "approval/draft";
	}
	

}
