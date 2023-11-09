package com.lib.fin.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.commons.FileManager;
import com.lib.fin.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalService {
	
	@Value("${app.upload}")
	private String filePath;
	
	@Value("${app.approval.doc}")
	private String approvalName;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	//일반기안
	public int setDraft(Map<String, String> params,ApprovalDocVO approvalDocVO ,MultipartFile[] files)throws Exception{
		
		String path = this.filePath+this.approvalName;
		int result= approvalDAO.setDraft(approvalDocVO);

		log.info("===============path: {} =========",path);
		log.info("===============path: {} =========",filePath);
		log.info("===============path: {} =========",approvalName);
		
		
		ApprovalHisVO approvalHisVO = new ApprovalHisVO();
		
		String midApp = params.getOrDefault("midApp","");
		String lastApp = params.getOrDefault("lastApp","");
	
		
		//중간 결재자 insert
		if(!"".equals(midApp)) {
			approvalHisVO.setDoc_no(approvalDocVO.getDoc_no());
			approvalHisVO.setEmp_no(midApp);
			approvalHisVO.setApproval_level(1);
			approvalHisVO.setApproval_state(approvalDocVO.getApproval_state());
			approvalHisVO.setReg_id(midApp);
			approvalHisVO.setMod_id(midApp);
			approvalHisVO.setUse_yn("Y");
			result = approvalDAO.setApprovalHis(approvalHisVO);
		
		}
		
		//최종결재자 insert
		if(!"".equals(lastApp)) {
			approvalHisVO.setDoc_no(approvalDocVO.getDoc_no());
			approvalHisVO.setEmp_no(lastApp);
			approvalHisVO.setApproval_level(2);
			approvalHisVO.setApproval_state(approvalDocVO.getApproval_state());
			approvalHisVO.setReg_id(lastApp);
			approvalHisVO.setMod_id(lastApp);
			approvalHisVO.setUse_yn("Y");
			result = approvalDAO.setApprovalHis(approvalHisVO);
		
		}
	
	
				
		if(files != null) {
			for(MultipartFile multipartFile: files) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				ApprovalFileVO approvalFileVO = new ApprovalFileVO();
				String fileName = fileManager.save(path, multipartFile);
				approvalFileVO.setDoc_no(approvalDocVO.getDoc_no());
				approvalFileVO.setFile_name(fileName);
				approvalFileVO.setFile_oriName(multipartFile.getOriginalFilename());
				approvalFileVO.setReg_id(approvalDocVO.getEmp_no());
				approvalFileVO.setMod_id(approvalDocVO.getEmp_no());
				approvalFileVO.setUse_yn("Y");
				result = approvalDAO.setFileAdd(approvalFileVO);
				
				
			}
			
		}
			
		return result;
	}
	
	//기안 detail
	public ApprovalDocVO getDraftDetail(ApprovalDocVO approvalDocVO)throws Exception {
		
		return approvalDAO.getDraftDetail(approvalDocVO);
		
	}
	
	//결제라인
	public List<ApprovalHisVO> getAppLine(String doc_no)throws Exception{
		
		return approvalDAO.getAppLine(doc_no);
	}
	//DOCList
	public List<ApprovalDocVO> getAppDocList(String emp_no)throws Exception{
		
		return approvalDAO.getAppDocList(emp_no);
		
	}
	
	//sign add
	public int addSign(MemberVO memberVO,MultipartFile file)throws Exception{
		String path = this.filePath+"sign";
		
		String fileName = fileManager.save(path, file);
		memberVO.setSign_name(fileName);
		memberVO.setSign_oriName(file.getOriginalFilename());
		int result = approvalDAO.addSign(memberVO);
				
		return result;
	}
	//DOCList
	public Map<String,Object> docApproval(Map<String,Object> param)throws Exception{
		Map<String,Object> resultMap = new HashMap<>();
		int resultInt = approvalDAO.docApproval(param);
		
		int resultInt1 = approvalDAO.docBaseApproval(param);
		
		if(resultInt > 0) {
			resultMap.put("code", "0000");
		}else {
			resultMap.put("code", "9999");
		}
		return resultMap;
		
	}

}
