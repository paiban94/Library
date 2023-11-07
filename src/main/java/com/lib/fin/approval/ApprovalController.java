package com.lib.fin.approval;

import java.security.Provider.Service;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.AssertFalse.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.commons.CommonJava;
import com.lib.fin.member.MemberVO;

import io.netty.handler.codec.http.HttpRequest;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	//기안
	@GetMapping("draft")
	public String setDraft()throws Exception {
		return "approval/draft";
	}
	
	@PostMapping("draft")
	public String setDraft(@AuthenticationPrincipal MemberVO memberVO, @RequestParam("midApp") String midApp, @RequestParam("lastApp") String lastApp, ApprovalDocVO approvalDocVO,MultipartFile[] files1)throws Exception {
		
		
		Map<String, String> params = new HashMap<>();
	    params.put("midApp", midApp);
	    params.put("lastApp", lastApp);
	    
	    approvalDocVO.setEmp_no(memberVO.getEmp_no());  
		approvalDocVO.setReg_id(memberVO.getEmp_no());
		approvalDocVO.setMod_id(memberVO.getEmp_no());
		approvalDocVO.setUse_yn("Y");
		
				
		approvalService.setDraft(params,approvalDocVO, files1);
		
		return "approval/draft";
	}
	
	//기안 detail
	@GetMapping("draftDetail")
	public String getDraftDetail(ApprovalDocVO approvalDocVO, Model model)throws Exception{
		
	 approvalDocVO =approvalService.getDraftDetail(approvalDocVO);
	 			   
	 model.addAttribute("docVO",approvalDocVO);
		return "approval/draftDetail";
	}
	
	
	
	//휴가신청서
	@GetMapping("leave")
	public String getLeave()throws Exception{
		return "approval/leave";
	}
	
	//지출결의서
	@GetMapping("expense")
	public String getExpense()throws Exception{
		return "approval/expense";
	}
	
	//기안 list
	@GetMapping("comDocList")
	public String getAppDocList(@AuthenticationPrincipal MemberVO memberVO, Model model)throws Exception{
		
		String emp_no = memberVO.getEmp_no(); //세션에서 사번 꺼내오기
		
		java.util.List<ApprovalDocVO> ar = approvalService.getAppDocList(emp_no);
		model.addAttribute("list",ar);
		
		return "approval/comDocList";
	}
	
	

}
