package com.lib.fin.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.commons.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalService {
	
	@Value("${app.upload}")
	private String filePath;
	
	@Value("${app.approval.draft}")
	private String approvalName;
	
	
	
	@Autowired
	private FileManager fileManager;
	
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
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
				approvalFileVO.setFile_path(path);
				result = approvalDAO.setFileAdd(approvalFileVO);
				
				
			}
			
		}
			
		return result;
	}

}
